import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixConfig _cfg({
  String? region,
  String baseUrl = 'https://hub.norbix.ai',
}) =>
    NorbixConfig(baseUrl: baseUrl, apiKey: 'k', region: region);

void main() {
  group('nb-region header', () {
    test('unset region (the default) omits the header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(driver.lastRequest!.headers.containsKey('nb-region'), isFalse);
    });

    test('configured region sets the header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(region: 'nb-eu-germany'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.headers['nb-region'],
        equals('nb-eu-germany'),
      );
    });

    test('per-call region overrides the client default', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(region: 'nb-eu-germany'), driver: driver);
      await t.send(
        route: '/{version}/echo',
        method: 'GET',
        region: 'nb-us-east',
      );
      expect(driver.lastRequest!.headers['nb-region'], equals('nb-us-east'));
    });

    test('per-call region sets the header only — URL is not recomposed',
        () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(), driver: driver);
      await t.send(
        route: '/{version}/echo',
        method: 'GET',
        region: 'nb-eu-germany',
      );
      expect(
        driver.lastRequest!.headers['nb-region'],
        equals('nb-eu-germany'),
      );
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/echo'),
      );
    });
  });

  group('regional base URL composition', () {
    test('default hub base URL composes the regional host', () async {
      final driver = FakeHttpDriver();
      final t = Transport(config: _cfg(region: 'nb-eu-germany'), driver: driver);
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://nb-eu-germany.hub.norbix.ai/v1/echo'),
      );
    });

    test('default api base URL composes the regional host', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: _cfg(region: 'nb-eu-germany', baseUrl: 'https://api.norbix.ai'),
        driver: driver,
      );
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://nb-eu-germany.api.norbix.ai/v1/echo'),
      );
    });

    test('a custom base URL is never rewritten — header still sent', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: _cfg(region: 'nb-eu-germany', baseUrl: 'http://localhost:5000'),
        driver: driver,
      );
      await t.send(route: '/{version}/echo', method: 'GET');
      expect(
        driver.lastRequest!.url.toString(),
        equals('http://localhost:5000/v1/echo'),
      );
      expect(
        driver.lastRequest!.headers['nb-region'],
        equals('nb-eu-germany'),
      );
    });
  });

  group('NorbixHub region wiring', () {
    test('defaults to no region: no header, default host', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
      );
      expect(client.region, isNull);
      await client.accounts.getAccountRegions();
      expect(driver.lastRequest!.headers.containsKey('nb-region'), isFalse);
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/account/regions'),
      );
    });

    test('region constructor arg + setRegion runtime switch', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
        region: 'nb-eu-germany',
      );
      expect(client.region, equals('nb-eu-germany'));
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers['nb-region'],
        equals('nb-eu-germany'),
      );
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://nb-eu-germany.hub.norbix.ai/v1/account/regions'),
      );

      client.setRegion('nb-us-east');
      await client.accounts.getAccountRegions();
      expect(driver.lastRequest!.headers['nb-region'], equals('nb-us-east'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://nb-us-east.hub.norbix.ai/v1/account/regions'),
      );

      client.setRegion(null);
      expect(client.region, isNull);
      await client.accounts.getAccountRegions();
      expect(driver.lastRequest!.headers.containsKey('nb-region'), isFalse);
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/account/regions'),
      );
    });

    test('per-call region override on a resource method wins', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
        region: 'nb-eu-germany',
      );
      await client.accounts.getAccountRegions(region: 'nb-us-east');
      expect(driver.lastRequest!.headers['nb-region'], equals('nb-us-east'));
    });

    test('list and update hit the right routes', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
        driver: driver,
      );
      await client.accounts.getAccountRegions();
      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/account/regions'),
      );

      await client.projects.updateProjectRegions(
        projectId: 'p1',
        body: {
          'primaryRegion': 'nb-eu-germany',
          'additionalRegions': ['nb-us-east'],
        },
      );
      expect(driver.lastRequest!.method, equals('PATCH'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/account/projects/p1/settings/regions'),
      );
    });

    test('fromEnv reads NORBIX_HUB_REGION', () async {
      final driver = FakeHttpDriver();
      final client = NorbixHub.fromEnv(
        overrides: {
          'NORBIX_HUB_BASE_URL': 'https://hub.norbix.ai',
          'NORBIX_HUB_API_KEY': 'k',
          'NORBIX_HUB_REGION': 'nb-eu-germany',
        },
        driver: driver,
      );
      expect(client.region, equals('nb-eu-germany'));
      await client.accounts.getAccountRegions();
      expect(
        driver.lastRequest!.headers['nb-region'],
        equals('nb-eu-germany'),
      );
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://nb-eu-germany.hub.norbix.ai/v1/account/regions'),
      );
    });
  });
}
