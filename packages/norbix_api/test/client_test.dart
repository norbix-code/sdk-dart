import 'package:norbix_api/norbix_api.dart';
import 'package:test/test.dart';

import '_fake_driver.dart';

void main() {
  group('NorbixApi', () {
    test('uses public default URL when no config passed', () {
      final client = NorbixApi();
      expect(client.config.baseUrl, equals('https://api.norbix.ai'));
      expect(client.config.baseUrl, equals(kNorbixApiDefaultBaseUrl));
      client.close();
    });

    test('accepts a self-hosted URL', () {
      final client = NorbixApi(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.isidos.lt',
          apiKey: 'k',
        ),
      );
      expect(client.config.baseUrl, equals('https://api.norbix.isidos.lt'));
      client.close();
    });

    test('exposes resources directly on the client (no api.* indirection)',
        () {
      final client = NorbixApi();
      expect(client.users, isNotNull);
      expect(client.auth, isNotNull);
      expect(client.apiKeys, isNotNull);
      client.close();
    });

    test('fromEnv reads overrides', () {
      final client = NorbixApi.fromEnv(overrides: const {
        'NORBIX_API_BASE_URL': 'http://localhost:5000',
        'NORBIX_API_KEY': 'nbx_test_123',
      });
      expect(client.config.baseUrl, equals('http://localhost:5000'));
      expect(client.config.apiKey, equals('nbx_test_123'));
      client.close();
    });

    test('setBearerToken / setApiKey rotate credentials in place', () {
      final client = NorbixApi(
        config: NorbixConfig(baseUrl: 'https://api.norbix.ai'),
      );
      client.setApiKey('k1');
      expect(client.config.apiKey, equals('k1'));
      client.setBearerToken('tok');
      expect(client.config.bearerToken, equals('tok'));
      client.close();
    });
  });

  group('NorbixApi.users round-trip', () {
    test('getUsers builds correct GET request', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          apiKey: 'nbx_test',
        ),
        driver: driver,
      );

      await client.users.getUsers(query: {'take': 10});

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://api.norbix.ai/v1/membership/users?take=10'),
      );
      expect(driver.lastRequest!.headers['x-api-key'], equals('nbx_test'));
    });

    test('getUser substitutes path param', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(
        config: NorbixConfig(baseUrl: 'http://localhost:5000'),
        driver: driver,
      );
      await client.users.getUser(id: 'usr_42');
      expect(
        driver.lastRequest!.url.toString(),
        equals('http://localhost:5000/v1/membership/users/usr_42'),
      );
    });

    test('inviteUser sends POST with JSON body', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(driver: driver);
      await client.users.inviteUser(body: {'email': 'a@b.com'});

      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.body, equals('{"email":"a@b.com"}'));
    });
  });
}
