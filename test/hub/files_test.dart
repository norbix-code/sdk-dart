import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.files — integrations', () {
    test('testFilesIntegration posts to /files/integrations/test', () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.testFilesIntegration(
        body: {
          'provider': 'AwsS3',
          'settings': {'bucket': 'b'},
        },
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/integrations/test'),
      );
      expect(driver.lastRequest!.body, contains('"provider":"AwsS3"'));
    });

    test('the id routes use the gateway spelling {Id}', () async {
      final driver = FakeHttpDriver();
      final client = _client(driver);

      await client.files.deleteFilesIntegration(id: 'nbin_1');
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/integrations/nbin_1'),
      );

      await client.files.setFilesIntegrationAsDefault(id: 'nbin_1');
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/integrations/nbin_1/default'),
      );

      await client.files.enableFilesIntegration(id: 'nbin_1');
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/integrations/nbin_1/enable'),
      );

      await client.files.disableFilesIntegration(id: 'nbin_1');
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/integrations/nbin_1/disable'),
      );
    });
  });

  group('hub.files — public links', () {
    test('makeFilePublic posts the integration and path', () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.makeFilePublic(
        body: {'filesIntegrationId': 'nbin_1', 'path': 'docs/a.pdf'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/item/public'),
      );
      expect(driver.lastRequest!.body, contains('"path":"docs/a.pdf"'));
    });

    test('makeFilePrivate posts to /files/item/private', () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.makeFilePrivate(
        body: {'filesIntegrationId': 'nbin_1', 'path': 'docs/a.pdf'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/item/private'),
      );
    });

    test('makeFolderPublic posts to /files/folder/public', () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.makeFolderPublic(
        body: {'filesIntegrationId': 'nbin_1', 'path': 'docs'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/folder/public'),
      );
    });

    test('makeFolderPrivate posts to /files/folder/private', () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.makeFolderPrivate(
        body: {'filesIntegrationId': 'nbin_1', 'path': 'docs'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/files/folder/private'),
      );
    });

    test('publishing is authenticated — only reading the link is not',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).files.makeFilePublic(
        body: {'filesIntegrationId': 'nbin_1', 'path': 'docs/a.pdf'},
      );

      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });

  group('hub.files — reads', () {
    test('getFolderFiles and getFile hit the folder and item routes',
        () async {
      final driver = FakeHttpDriver();
      final client = _client(driver);

      await client.files.getFolderFiles(
        query: {'filesIntegrationId': 'nbin_1', 'path': 'docs'},
      );
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.path, equals('/v1/files/folder'));
      expect(
        driver.lastRequest!.url.queryParameters['path'],
        equals('docs'),
      );

      await client.files.getFile(
        query: {'filesIntegrationId': 'nbin_1', 'path': 'docs/a.pdf'},
      );
      expect(driver.lastRequest!.url.path, equals('/v1/files/item'));
    });
  });
}
