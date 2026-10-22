import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.payments` — the received-webhooks log (gateway campaign
/// audit/payments, item 8), against the fake driver: verb, path and query.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  test(
      'getPaymentsWebhookLog → GET /v3/payments/webhooks/log, filters in the query',
      () async {
    final driver = FakeHttpDriver();
    await _client(driver).payments.getPaymentsWebhookLog(
      query: {'integrationId': 'int_stripe', 'limit': 20},
    );

    final req = driver.lastRequest!;
    expect(req.method, equals('GET'));
    expect(req.url.path, equals('/v3/payments/webhooks/log'));
    expect(
      req.url.queryParameters,
      equals({'integrationId': 'int_stripe', 'limit': '20'}),
    );
    expect(req.body, isNull);
  });

  test(
      'savePaymentsIntegration (Montonio) leaves out an unset isSandbox — empty = true (sandbox) on the gateway',
      () async {
    // Owner 2026-10-22: isSandbox is optional; the SDK must not fill in a
    // default, or an unset field would mean live money.
    final driver = FakeHttpDriver();
    await _client(driver).payments.savePaymentsIntegration(
      body: {
        'integration': {
          'provider': 'Montonio',
          'accessKey': 'ak_test',
          'secretKey': 'sk_test',
        },
      },
    );

    final req = driver.lastRequest!;
    expect(req.method, equals('POST'));
    expect(req.url.path, equals('/v3/payments/integrations'));
    final body = jsonDecode(req.body!) as Map<String, dynamic>;
    expect(
      body,
      equals({
        'integration': {
          'provider': 'Montonio',
          'accessKey': 'ak_test',
          'secretKey': 'sk_test',
        },
      }),
    );
    expect((body['integration'] as Map).containsKey('isSandbox'), isFalse);
  });
}
