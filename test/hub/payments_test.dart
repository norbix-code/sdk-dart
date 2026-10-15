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
    await _client(driver).payments.getPaymentsWebhookLog(query: {
      'integrationId': 'int_stripe',
      'limit': 20,
    });

    final req = driver.lastRequest!;
    expect(req.method, equals('GET'));
    expect(req.url.path, equals('/v3/payments/webhooks/log'));
    expect(req.url.queryParameters,
        equals({'integrationId': 'int_stripe', 'limit': '20'}));
    expect(req.body, isNull);
  });
}
