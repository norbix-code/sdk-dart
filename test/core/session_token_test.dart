import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Sessions: a project sign-in token past half its window gets a fresh one in
/// the `norbix-session-token` answer header. The client swaps it in only when
/// it sent its own stored bearer token on that call, and tells the app
/// through `NorbixConfig.onSessionToken`. Fake driver only: nothing leaves
/// the process.
HttpDriverResponse _answer({String? fresh, String body = '{"ok":true}'}) =>
    HttpDriverResponse(
      statusCode: 200,
      headers: {
        'content-type': 'application/json',
        if (fresh != null) 'norbix-session-token': fresh,
      },
      body: body,
    );

NorbixApi _client(
  FakeHttpDriver driver, {
  String? bearerToken,
  String? apiKey,
  void Function(String token)? onSessionToken,
}) =>
    NorbixApi(
      config: NorbixConfig(
        baseUrl: 'https://api.example.test',
        bearerToken: bearerToken,
        apiKey: apiKey,
        projectId: 'proj_1',
        onSessionToken: onSessionToken,
      ),
      driver: driver,
    );

Future<void> _call(NorbixApi api, {Map<String, String>? headers}) =>
    api.users.getUsers(headers: headers);

void main() {
  group('norbix-session-token', () {
    test('header present: the token is swapped and the callback called',
        () async {
      final saved = <String>[];
      var fresh = 'jwt_new';
      final driver = FakeHttpDriver((_) {
        final a = _answer(fresh: fresh.isEmpty ? null : fresh);
        fresh = '';
        return a;
      });
      final api =
          _client(driver, bearerToken: 'jwt_old', onSessionToken: saved.add);

      await _call(api);
      expect(api.config.bearerToken, 'jwt_new');
      expect(saved, ['jwt_new']);

      await _call(api);
      expect(driver.requests[0].headers['authorization'], 'Bearer jwt_old');
      expect(driver.requests[1].headers['authorization'], 'Bearer jwt_new');
      expect(saved, ['jwt_new'], reason: 'no header, no second callback');
    });

    test('the header name is read in any case and the value trimmed', () async {
      final saved = <String>[];
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {
              'content-type': 'application/json',
              'Norbix-Session-Token': ' jwt_new ',
            },
            body: '{}',
          ));
      final api =
          _client(driver, bearerToken: 'jwt_old', onSessionToken: saved.add);
      await _call(api);
      expect(api.config.bearerToken, 'jwt_new');
      expect(saved, ['jwt_new']);
    });

    test('header absent or empty: the token is left alone', () async {
      var called = false;
      var n = 0;
      final driver =
          FakeHttpDriver((_) => n++ == 0 ? _answer() : _answer(fresh: ''));
      final api = _client(driver,
          bearerToken: 'jwt_old', onSessionToken: (_) => called = true);
      await _call(api);
      await _call(api);
      expect(api.config.bearerToken, 'jwt_old');
      expect(called, isFalse);
    });

    test('the same token again changes nothing', () async {
      var called = false;
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_old'));
      final api = _client(driver,
          bearerToken: 'jwt_old', onSessionToken: (_) => called = true);
      await _call(api);
      expect(called, isFalse);
    });

    test('an API-key client never takes a token', () async {
      var called = false;
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_new'));
      final api = _client(driver,
          apiKey: 'key_1', onSessionToken: (_) => called = true);
      await _call(api);
      await _call(api);
      expect(api.config.bearerToken, isNull);
      expect(called, isFalse);
      for (final r in driver.requests) {
        expect(r.headers['x-api-key'], 'key_1');
        expect(r.headers.containsKey('authorization'), isFalse);
      }
    });

    test('a token sent in per-call headers is not the stored one', () async {
      var called = false;
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_new'));
      final api = _client(driver,
          bearerToken: 'jwt_old', onSessionToken: (_) => called = true);
      await _call(api, headers: {'authorization': 'Bearer jwt_other'});
      expect(api.config.bearerToken, 'jwt_old');
      expect(called, isFalse);
    });

    test('a call with no credentials changes nothing', () async {
      var called = false;
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_new'));
      final api = _client(driver,
          bearerToken: 'jwt_old', onSessionToken: (_) => called = true);
      await api.publicProjects.getPublicProjectConfig(projectId: 'proj_1');
      expect(api.config.bearerToken, 'jwt_old');
      expect(called, isFalse);
    });

    test('a token replaced while the call was in flight is kept', () async {
      late NorbixApi api;
      final driver = FakeHttpDriver((_) {
        api.setBearerToken('jwt_user_b');
        return _answer(fresh: 'jwt_new');
      });
      var called = false;
      api = _client(driver,
          bearerToken: 'jwt_old', onSessionToken: (_) => called = true);
      await _call(api);
      expect(api.config.bearerToken, 'jwt_user_b');
      expect(called, isFalse);
    });

    test('setBearerToken keeps the callback', () async {
      final saved = <String>[];
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_new'));
      final api = _client(driver, onSessionToken: saved.add);
      api.setBearerToken('jwt_old');
      await _call(api);
      expect(saved, ['jwt_new']);
    });

    test('a callback that throws reaches the caller and is not retried',
        () async {
      final driver = FakeHttpDriver((_) => _answer(fresh: 'jwt_new'));
      final api = NorbixApi(
        config: NorbixConfig(
          baseUrl: 'https://api.example.test',
          bearerToken: 'jwt_old',
          maxRetries: 2,
          onSessionToken: (_) => throw StateError('save failed'),
        ),
        driver: driver,
      );
      await expectLater(_call(api), throwsA(isA<StateError>()));
      expect(driver.requests, hasLength(1));
    });
  });

  group('auth.signIn', () {
    for (final remember in [false, true]) {
      test('sends rememberMe $remember and stores the token', () async {
        final driver = FakeHttpDriver((_) =>
            _answer(body: '{"bearerToken":"jwt_signed_in","userId":"u_1"}'));
        final api = _client(driver, apiKey: 'key_1');
        final answer = remember
            ? await api.auth
                .signIn(userName: 'ada', password: 'secret', rememberMe: true)
            : await api.auth.signIn(userName: 'ada', password: 'secret');

        final r = driver.lastRequest!;
        expect(r.method, 'POST');
        expect(r.url.toString(), 'https://api.example.test/auth');
        expect(jsonDecode(r.body!), {
          'provider': 'credentials',
          'userName': 'ada',
          'password': 'secret',
          'rememberMe': remember,
        });
        expect(r.headers.containsKey('x-api-key'), isFalse);
        expect(r.headers.containsKey('authorization'), isFalse);
        expect(r.headers['norbix-project-id'], 'proj_1');
        expect((answer as Map)['userId'], 'u_1');
        expect(api.config.bearerToken, 'jwt_signed_in');
      });
    }
  });
}
