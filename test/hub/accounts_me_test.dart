import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.accounts` — the signed-in team member's own record
/// (`GET /account/me`) and own phone number (`PUT /account/me/phone`),
/// against the fake driver (never a real server).
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.accounts — me', () {
    test('getMyAccountUserProfile → GET /v1/account/me', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.getMyAccountUserProfile();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/account/me'),
      );
      expect(driver.lastRequest!.body, isNull);
    });

    test('updateMyAccountUserPhone → PUT /v1/account/me/phone with the phone',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .updateMyAccountUserPhone(body: {'phone': '+37060000000'});

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/account/me/phone'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({'phone': '+37060000000'}),
      );
    });
  });
}
