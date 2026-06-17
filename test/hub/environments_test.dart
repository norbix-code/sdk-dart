import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixConfig _cfg({String env = 'PROD'}) =>
    NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k', env: env);

void main() {
  group('norbix-env header', () {
    test('PROD default omits the header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(driver.lastRequest!.headers.containsKey('norbix-env'), isFalse);
    });

    test('configured env sets the header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(env: 'TEST'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(driver.lastRequest!.headers['norbix-env'], equals('TEST'));
    });

    test('per-call env overrides the client default', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(env: 'TEST'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET', env: 'STAGING');
      expect(driver.lastRequest!.headers['norbix-env'], equals('STAGING'));
    });
  });

  group('NorbixHub env wiring', () {
    test('defaults to PROD and omits header', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
      );
      expect(client.env, equals('PROD'));
      await client.environments.getProjectEnvironments();
      expect(driver.lastRequest!.headers.containsKey('norbix-env'), isFalse);
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/account/projects/environments'),
      );
    });

    test('env constructor arg + setEnv runtime switch', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
        env: 'TEST',
      );
      expect(client.env, equals('TEST'));
      await client.environments.getProjectEnvironments();
      expect(driver.lastRequest!.headers['norbix-env'], equals('TEST'));

      client.setEnv('PROD');
      await client.environments.getProjectEnvironments();
      expect(driver.lastRequest!.headers.containsKey('norbix-env'), isFalse);
    });

    test('create and delete hit the right routes', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
      );
      await client.environments.createProjectEnvironment(
        body: {'environmentName': 'TEST', 'integration': {}},
      );
      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/account/projects/environments'),
      );

      await client.environments
          .deleteProjectEnvironment(environmentName: 'TEST');
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/account/projects/environments/TEST'),
      );
    });
  });
}
