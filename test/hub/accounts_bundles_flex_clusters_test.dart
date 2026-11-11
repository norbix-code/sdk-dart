import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.accounts` — Managed Service bundles and the account's Flex
/// clusters, against the fake driver (never a real server): verb, full
/// path and where the parameters go.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.accounts — bundles and Flex clusters', () {
    test('getManagedServiceBundles → GET /v3/account/stripe/bundles', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.getManagedServiceBundles();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/stripe/bundles'),
      );
      expect(driver.lastRequest!.body, isNull);
    });

    test(
        'changeManagedServiceBundle → POST /v3/account/stripe/change-bundle, '
        'bundle and billingPeriod in the body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.changeManagedServiceBundle(
        body: {'bundle': 'Growth', 'billingPeriod': 'Annual'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/stripe/change-bundle'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({'bundle': 'Growth', 'billingPeriod': 'Annual'}),
      );
    });

    test('getFlexClusters → GET /v3/account/flex-clusters', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.getFlexClusters();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/flex-clusters'),
      );
      expect(driver.lastRequest!.body, isNull);
    });

    test(
        'upgradeFlexCluster → POST /v3/account/flex-clusters/{id}/upgrade, '
        'the id in the path and tierCode in the body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.upgradeFlexCluster(
        flexClusterId: 'fc_1',
        body: {'tierCode': 'M10'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/flex-clusters/fc_1/upgrade'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({'tierCode': 'M10'}),
      );
    });

    test(
        'createStripeCheckoutSession → POST '
        '/v3/account/stripe/create-checkout-session, bundle and '
        'billingPeriod in the body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.createStripeCheckoutSession(
        body: {
          'subscriptionType': 'ManagedService',
          'bundle': 'Starter',
          'billingPeriod': 'Monthly',
        },
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals(
            'https://hub.norbix.ai/v3/account/stripe/create-checkout-session'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({
          'subscriptionType': 'ManagedService',
          'bundle': 'Starter',
          'billingPeriod': 'Monthly',
        }),
      );
    });
  });
}
