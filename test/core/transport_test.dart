import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixConfig _cfg({
  String baseUrl = 'https://api.norbix.ai',
  String? apiKey,
  String? bearerToken,
  int retries = 0,
}) =>
    NorbixConfig(
      baseUrl: baseUrl,
      apiKey: apiKey,
      bearerToken: bearerToken,
      maxRetries: retries,
    );

void main() {
  group('Transport.send', () {
    test('builds URL with base, version, path params and query', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);

      await t.send(
        route: '/{version}/membership/users/{id}',
        method: 'GET',
        pathParams: {'id': 'usr_123'},
        query: {'take': 20, 'skip': 0},
      );

      expect(
        driver.lastRequest!.url.toString(),
        equals(
            'https://api.norbix.ai/v3/membership/users/usr_123?take=20&skip=0'),
      );
      expect(driver.lastRequest!.method, equals('GET'));
    });

    test('encodes path params (so id with spaces / slashes is safe)', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(
        route: '/{version}/files/{key}',
        pathParams: {'key': 'a/b c'},
      );
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v3/files/a%2Fb%20c'),
      );
    });

    test('sends bearer token over api key when both are set', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: _cfg(apiKey: 'k', bearerToken: 'b'),
        driver: driver,
      );
      await t.send(route: '/v3/echo');
      expect(driver.lastRequest!.headers['authorization'], equals('Bearer b'));
      expect(driver.lastRequest!.headers.containsKey('x-api-key'), isFalse);
    });

    test('sends api key when only api key is set', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(apiKey: 'k'), driver: driver);
      await t.send(route: '/v3/echo');
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });

    test('serialises body to JSON for non-GET', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(
        route: '/v3/things',
        method: 'POST',
        body: {'name': 'a'},
      );
      expect(driver.lastRequest!.body, equals('{"name":"a"}'));
      expect(driver.lastRequest!.headers['content-type'], contains('json'));
    });

    test('does not send body on GET even if provided', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(route: '/v3/echo', method: 'GET', body: {'x': 1});
      expect(driver.lastRequest!.body, isNull);
    });

    test('parses JSON body on success', () async {
      final driver = FakeHttpDriver(
        (i) => const HttpDriverResponse(
          statusCode: 200,
          headers: {'content-type': 'application/json'},
          body: '{"id":"1","name":"alice"}',
        ),
      );
      final t = Transport(config: _cfg(), driver: driver);
      final out = await t.send(route: '/v3/users/1') as Map<String, Object?>;
      expect(out['id'], equals('1'));
      expect(out['name'], equals('alice'));
    });

    test('maps 404 to NorbixNotFoundError', () async {
      final driver = FakeHttpDriver(
        (i) => HttpDriverResponse(
          statusCode: 404,
          headers: const {'content-type': 'application/json'},
          body: jsonEncode({'message': 'gone', 'code': 'NOT_FOUND'}),
        ),
      );
      final t = Transport(config: _cfg(), driver: driver);
      expect(
        () => t.send(route: '/v3/users/0'),
        throwsA(isA<NorbixNotFoundError>()
            .having((e) => e.code, 'code', 'NOT_FOUND')
            .having((e) => e.message, 'message', 'gone')),
      );
    });

    test('maps 401 to NorbixAuthError', () async {
      final driver = FakeHttpDriver(
        (i) => const HttpDriverResponse(
          statusCode: 401,
          headers: {'content-type': 'application/json'},
          body: '{"message":"bad token"}',
        ),
      );
      final t = Transport(config: _cfg(), driver: driver);
      expect(() => t.send(route: '/v3/me'), throwsA(isA<NorbixAuthError>()));
    });

    test('maps 429 to NorbixRateLimitError with retryAfter', () async {
      final driver = FakeHttpDriver(
        (i) => const HttpDriverResponse(
          statusCode: 429,
          headers: {'content-type': 'application/json', 'retry-after': '7'},
          body: '{"message":"slow down"}',
        ),
      );
      final t = Transport(config: _cfg(), driver: driver);
      try {
        await t.send(route: '/v3/x');
        fail('expected throw');
      } on NorbixRateLimitError catch (e) {
        expect(e.retryAfterSeconds, equals(7));
      }
    });

    test('retries on 5xx up to maxRetries then succeeds', () async {
      final driver = FakeHttpDriver((attempt) {
        if (attempt < 2) {
          return const HttpDriverResponse(
            statusCode: 502,
            headers: {'content-type': 'application/json'},
            body: '{"message":"bad gateway"}',
          );
        }
        return const HttpDriverResponse(
          statusCode: 200,
          headers: {'content-type': 'application/json'},
          body: '{"ok":true}',
        );
      });
      final t = Transport(config: _cfg(retries: 3), driver: driver);
      final out = await t.send(route: '/v3/x') as Map<String, Object?>;
      expect(out['ok'], isTrue);
      expect(driver.requests.length, equals(3));
    });

    test('gives up after maxRetries and throws NorbixServerError', () async {
      final driver = FakeHttpDriver(
        (i) => const HttpDriverResponse(
          statusCode: 500,
          headers: {'content-type': 'application/json'},
          body: '{"message":"down"}',
        ),
      );
      final t = Transport(config: _cfg(retries: 1), driver: driver);
      expect(() => t.send(route: '/v3/x'), throwsA(isA<NorbixServerError>()));
    });
  });

  // A write that failed may already have done its work, so it is never sent
  // again; a read is safe to repeat.
  group('retries only calls that are safe to send twice', () {
    HttpDriverResponse answer(int status) => HttpDriverResponse(
          statusCode: status,
          headers: const {'content-type': 'application/json'},
          body: '{"responseStatus":{"isSuccess":false,"errors":'
              '[{"message":"failed","errorCode":"CM-ERRORS-INFRA-NORBIX-001"}]}}',
        );

    for (final method in ['POST', 'PATCH', 'post']) {
      test('$method + 500 is sent once', () async {
        final driver = FakeHttpDriver((_) => answer(500));
        final t = Transport(config: _cfg(retries: 3), driver: driver);

        await expectLater(
          t.send(route: '/v3/x', method: method, body: {'a': 1}),
          throwsA(isA<NorbixServerError>()),
        );
        expect(driver.requests, hasLength(1));
      });
    }

    test('POST + 429 is sent once', () async {
      final driver = FakeHttpDriver((_) => answer(429));
      final t = Transport(config: _cfg(retries: 3), driver: driver);

      await expectLater(
        t.send(route: '/v3/x', method: 'POST', body: {'a': 1}),
        throwsA(isA<NorbixRateLimitError>()),
      );
      expect(driver.requests, hasLength(1));
    });

    for (final method in ['GET', 'HEAD', 'OPTIONS', 'PUT', 'DELETE']) {
      test('$method + 500 is retried maxRetries times', () async {
        final driver = FakeHttpDriver((_) => answer(500));
        final t = Transport(config: _cfg(retries: 2), driver: driver);

        await expectLater(
          t.send(route: '/v3/x', method: method),
          throwsA(isA<NorbixServerError>()),
        );
        expect(driver.requests, hasLength(3));
      });
    }

    test('GET + 429 is retried', () async {
      final driver = FakeHttpDriver(
        (i) => i == 0
            ? answer(429)
            : const HttpDriverResponse(
                statusCode: 200,
                headers: {'content-type': 'application/json'},
                body: '{"ok":true}',
              ),
      );
      final t = Transport(config: _cfg(retries: 1), driver: driver);

      final out = await t.send(route: '/v3/x') as Map<String, Object?>;
      expect(out['ok'], isTrue);
      expect(driver.requests, hasLength(2));
    });

    test('POST that fails on the network is not sent again', () async {
      final driver = _ThrowingDriver();
      final t = Transport(config: _cfg(retries: 3), driver: driver);

      await expectLater(
        t.send(route: '/v3/x', method: 'POST', body: {'a': 1}),
        throwsA(isA<NorbixTransportError>()),
      );
      expect(driver.calls, equals(1));
    });
  });
}

class _ThrowingDriver implements HttpDriver {
  int calls = 0;

  @override
  Future<HttpDriverResponse> send(HttpDriverRequest request) async {
    calls++;
    throw Exception('connection reset');
  }

  @override
  void close() {}
}
