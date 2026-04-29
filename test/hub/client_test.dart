import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

void main() {
  group('NorbixHub', () {
    test('uses public default URL', () {
      final client = NorbixHub();
      expect(client.config.baseUrl, equals(kNorbixHubDefaultBaseUrl));
      expect(kNorbixHubDefaultBaseUrl, equals('https://hub.norbix.ai'));
      client.close();
    });

    test('accepts self-hosted URL via config', () {
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'http://localhost:5000'),
      );
      expect(client.config.baseUrl, equals('http://localhost:5000'));
      client.close();
    });

    test('exposes resources directly: client.projects, client.database, ...',
        () {
      final client = NorbixHub();
      expect(client.projects, isNotNull);
      expect(client.database, isNotNull);
      expect(client.emailNotifications, isNotNull);
      expect(client.accounts, isNotNull);
      expect(client.aiIntegrations, isNotNull);
      expect(client.webhooks, isNotNull);
      client.close();
    });

    test('fromEnv with overrides', () {
      final client = NorbixHub.fromEnv(overrides: const {
        'NORBIX_HUB_BASE_URL': 'https://hub.norbix.isidos.lt',
        'NORBIX_HUB_BEARER_TOKEN': 'jwt_xyz',
      });
      expect(client.config.baseUrl, equals('https://hub.norbix.isidos.lt'));
      expect(client.config.bearerToken, equals('jwt_xyz'));
      client.close();
    });
  });

  group('NorbixHub round-trip', () {
    test('projects.getProject substitutes projectId', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(
          baseUrl: 'https://hub.norbix.ai',
          bearerToken: 'jwt',
        ),
        driver: driver,
      );

      await client.projects.getProject(projectId: 'prj_1');

      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/account/projects/prj_1'),
      );
      expect(
        driver.lastRequest!.headers['authorization'],
        equals('Bearer jwt'),
      );
    });

    test('database.getDatabaseSchemas hits /v1/database/schemas', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(driver: driver);
      await client.database.getDatabaseSchemas();
      expect(
        driver.lastRequest!.url.path,
        equals('/v1/database/schemas'),
      );
    });

    test('emailNotifications.createEmailTemplate sends POST', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(driver: driver);
      await client.emailNotifications
          .createEmailTemplate(body: {'name': 'welcome'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.path,
          equals('/v1/notifications/email/templates'));
      expect(driver.lastRequest!.body, equals('{"name":"welcome"}'));
    });

    test('apiVersion override flows through routes', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(
          baseUrl: 'https://hub.norbix.ai',
          apiVersion: 'v2',
        ),
        driver: driver,
      );
      await client.echo.echo();
      expect(driver.lastRequest!.url.path, equals('/v2/echo'));
    });
  });
}
