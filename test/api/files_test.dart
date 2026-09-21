import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _fileDriver(String body, {int status = 200}) => FakeHttpDriver(
      (_) => HttpDriverResponse(
        statusCode: status,
        headers: const {'content-type': 'application/pdf'},
        body: body,
      ),
    );

void main() {
  group('api.files.getPublicFile', () {
    test('sends no credentials at all', () async {
      final driver = _fileDriver('PDF-BYTES');
      await _client(driver).files.getPublicFile(
            publicId: 'nbpf_abc',
            name: 'report.pdf',
          );

      final headers = driver.lastRequest!.headers;
      expect(headers.containsKey('authorization'), isFalse);
      expect(headers.containsKey('x-api-key'), isFalse);
    });

    test('hits the public route and returns the bytes', () async {
      final driver = _fileDriver('PDF-BYTES');
      final bytes = await _client(driver).files.getPublicFile(
            publicId: 'nbpf_abc',
            name: 'report.pdf',
          );

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.path,
        equals('/v1/files/public/nbpf_abc/report.pdf'),
      );
      expect(utf8.decode(bytes), equals('PDF-BYTES'));
    });

    test('keeps the slashes of a folder-relative name', () async {
      final driver = _fileDriver('X');
      await _client(driver).files.getPublicFile(
            publicId: 'nbpf_folder',
            name: '2026/q1/report.pdf',
          );

      // The gateway route ends in a wildcard token, so the slashes have to
      // survive as slashes — percent-encoded they stop matching the route.
      expect(
        driver.lastRequest!.url.path,
        equals('/v1/files/public/nbpf_folder/2026/q1/report.pdf'),
      );
    });

    test('a name segment with a space is still encoded', () async {
      final driver = _fileDriver('X');
      await _client(driver).files.getPublicFile(
            publicId: 'nbpf_folder',
            name: 'q1 reports/a b.pdf',
          );

      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/public/nbpf_folder/q1%20reports/a%20b.pdf'),
      );
    });

    test('a miss is a plain 404', () async {
      final driver = FakeHttpDriver(
        (_) => const HttpDriverResponse(
          statusCode: 404,
          headers: {'content-type': 'application/json'},
          body: '{"message":"Not Found"}',
        ),
      );

      expect(
        () => _client(driver).files.getPublicFile(
              publicId: 'nbpf_gone',
              name: 'x.pdf',
            ),
        throwsA(isA<NorbixError>()),
      );
    });

    test('binary bytes survive — they are not put through jsonDecode',
        () async {
      // 0x89 'P' 'N' 'G' — the PNG magic number. A JSON parse of this either
      // throws or silently mangles it.
      final png = <int>[0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
      final driver = FakeHttpDriver(
        (_) => HttpDriverResponse(
          statusCode: 200,
          headers: const {'content-type': 'image/png'},
          body: '',
          bytes: png,
        ),
      );

      final bytes = await _client(driver).files.getPublicFile(
            publicId: 'nbpf_img',
            name: 'logo.png',
          );

      expect(bytes, equals(png));
    });
  });

  group('api.files.testFilesIntegration', () {
    FakeHttpDriver jsonDriver(String body, {int status = 200}) =>
        FakeHttpDriver(
          (_) => HttpDriverResponse(
            statusCode: status,
            headers: const {'content-type': 'application/json'},
            body: body,
          ),
        );

    test('posts to /{version}/files/{id}/test with the id substituted',
        () async {
      final driver = jsonDriver('{"items":[]}');
      await _client(driver).files.testFilesIntegration(
            filesIntegrationId: 'nbin_1',
          );

      final request = driver.lastRequest!;
      expect(request.method, equals('POST'));
      expect(
        request.url.toString(),
        equals('https://api.norbix.ai/v1/files/nbin_1/test'),
      );
      // Not the Hub route — that one is /files/integrations/test.
      expect(request.url.path, isNot(contains('/integrations/')));
    });

    test('is project-scoped: sends the API key and the environment', () async {
      final driver = jsonDriver('{"items":[]}');
      final client = NorbixApi(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          apiKey: 'nbx_test',
          env: 'DEV',
        ),
        driver: driver,
      );

      await client.files.testFilesIntegration(filesIntegrationId: 'nbin_1');

      final headers = driver.lastRequest!.headers;
      expect(headers['x-api-key'], equals('nbx_test'));
      expect(headers['norbix-env'], equals('DEV'));
    });

    test('an id with a slash is encoded as one path segment', () async {
      final driver = jsonDriver('{"items":[]}');
      await _client(driver).files.testFilesIntegration(
            filesIntegrationId: 'a/b',
          );

      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/a%2Fb/test'),
      );
    });

    test('returns the per-step items parsed', () async {
      final driver = jsonDriver(jsonEncode({
        'items': [
          {'operation': 'UploadFile', 'result': 'OK', 'errors': null},
          {
            'operation': 'GetFile',
            'result': 'FAILED',
            'errors': ['AccessDenied'],
          },
          {'operation': 'GetAllFiles', 'result': 'NOT_TESTED', 'errors': null},
          {'operation': 'DeleteFile', 'result': 'NOT_TESTED', 'errors': null},
        ],
        'responseStatus': {'isSuccess': true},
      }));

      final res = await _client(driver).files.testFilesIntegration(
            filesIntegrationId: 'nbin_1',
          ) as Map<String, dynamic>;

      final items = res['items'] as List<dynamic>;
      expect(items, hasLength(4));
      expect(
        items.map((i) => (i as Map)['operation']),
        equals(['UploadFile', 'GetFile', 'GetAllFiles', 'DeleteFile']),
      );
      expect((items.first as Map)['result'], equals('OK'));
      expect((items[1] as Map)['result'], equals('FAILED'));
      expect((items[1] as Map)['errors'], equals(['AccessDenied']));
    });

    test('an error ResponseStatus surfaces as a typed NorbixError', () async {
      final driver = jsonDriver(
        jsonEncode({
          'responseStatus': {
            'errorCode': 'NotFound',
            'message': 'Files integration not found',
          },
        }),
        status: 404,
      );

      await expectLater(
        _client(driver).files.testFilesIntegration(
              filesIntegrationId: 'nbin_missing',
            ),
        throwsA(
          isA<NorbixNotFoundError>()
              .having((e) => e.status, 'status', 404)
              .having(
                (e) => e.details['responseStatus'],
                'details.responseStatus',
                containsPair('errorCode', 'NotFound'),
              ),
        ),
      );
    });
  });
}
