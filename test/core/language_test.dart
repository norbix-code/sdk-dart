import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixConfig _cfg({String? language}) => NorbixConfig(
      baseUrl: 'https://hub.norbix.ai',
      apiKey: 'k',
      language: language,
    );

void main() {
  group('Accept-Language header', () {
    test('unset language (the default) omits the header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.headers.containsKey('accept-language'),
        isFalse,
      );
    });

    test('configured language sets the header verbatim', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: _cfg(language: 'lt-LT, en;q=0.8'),
        driver: driver,
      );
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.headers['accept-language'],
        equals('lt-LT, en;q=0.8'),
      );
    });

    test('per-call language overrides the client default', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(language: 'lt'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET', language: 'de');
      expect(driver.lastRequest!.headers['accept-language'], equals('de'));
    });

    test('sendBytes and sendRaw carry the language too', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(language: 'lt'), driver: driver);
      await t.sendBytes(route: '/{version}/file', method: 'GET');
      expect(driver.lastRequest!.headers['accept-language'], equals('lt'));
      await t.sendRaw(route: '/{version}/raw', method: 'GET', language: 'en');
      expect(driver.lastRequest!.headers['accept-language'], equals('en'));
    });

    test('empty language is treated as unset', () {
      expect(_cfg(language: '').language, isNull);
    });

    test('no legacy culture headers are ever sent', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(language: 'lt'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      final keys = driver.lastRequest!.headers.keys.map((k) => k.toLowerCase());
      expect(keys, isNot(contains('culturecode')));
      expect(keys, isNot(contains('norbix-language')));
    });
  });

  group('NorbixHub language wiring', () {
    test('defaults to no language: no header', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(config: _cfg(), driver: driver);
      expect(client.language, isNull);
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers.containsKey('accept-language'),
        isFalse,
      );
    });

    test('language constructor arg + setLanguage runtime switch', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(config: _cfg(), driver: driver, language: 'lt');
      expect(client.language, equals('lt'));
      await client.accounts.getAccountRegions();
      expect(driver.lastRequest!.headers['accept-language'], equals('lt'));

      client.setLanguage('en-GB, en;q=0.9');
      expect(client.language, equals('en-GB, en;q=0.9'));
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers['accept-language'],
        equals('en-GB, en;q=0.9'),
      );

      client.setLanguage(null);
      expect(client.language, isNull);
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers.containsKey('accept-language'),
        isFalse,
      );
    });

    test('setLanguage keeps the other config fields', () {
      final client = NorbixHub(
        config: _cfg(),
        driver: FakeHttpDriver(),
        region: 'nb-eu-germany',
      );
      client.setLanguage('lt');
      expect(client.region, equals('nb-eu-germany'));
      expect(client.config.apiKey, equals('k'));
    });

    test('per-call language override on a resource method wins', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(config: _cfg(), driver: driver, language: 'lt');
      await client.accounts.getAccountRegions(language: 'de');
      expect(driver.lastRequest!.headers['accept-language'], equals('de'));
      await client.projects
          .updateProjectRegions(projectId: 'p1', body: {}, language: 'fr');
      expect(driver.lastRequest!.headers['accept-language'], equals('fr'));
    });

    test('fromEnv reads NORBIX_HUB_LANGUAGE', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub.fromEnv(
        overrides: {
          'NORBIX_HUB_BASE_URL': 'https://hub.norbix.ai',
          'NORBIX_HUB_API_KEY': 'k',
          'NORBIX_HUB_LANGUAGE': 'lt-LT, en;q=0.8',
        },
        driver: driver,
      );
      expect(client.language, equals('lt-LT, en;q=0.8'));
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers['accept-language'],
        equals('lt-LT, en;q=0.8'),
      );
    });
  });

  group('NorbixApi language wiring', () {
    test('language constructor arg + setLanguage runtime switch', () {
      final client = NorbixApi(
        config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
        driver: FakeHttpDriver(),
        language: 'lt',
      );
      expect(client.language, equals('lt'));
      client.setLanguage('en');
      expect(client.language, equals('en'));
      client.setLanguage(null);
      expect(client.language, isNull);
    });

    test('fromEnv reads NORBIX_API_LANGUAGE', () {
      final client = NorbixApi.fromEnv(
        overrides: {
          'NORBIX_API_BASE_URL': 'https://api.norbix.ai',
          'NORBIX_API_KEY': 'k',
          'NORBIX_API_LANGUAGE': 'lt',
        },
        driver: FakeHttpDriver(),
      );
      expect(client.language, equals('lt'));
    });

    test('fromEnv without the variable sends no language', () {
      final client = NorbixApi.fromEnv(
        overrides: {'NORBIX_API_BASE_URL': 'https://api.norbix.ai'},
        driver: FakeHttpDriver(),
      );
      expect(client.language, isNull);
    });
  });
}
