import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `api.payments` — payment orders and checkout (gateway campaign
/// audit/payments-checkout), against the fake driver: verb, path, path
/// param, body and query.
NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('api.payments', () {
    test(
      'createPaymentOrder → POST /v3/payments/orders, the order in the body',
      () async {
        final driver = FakeHttpDriver(
          (_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {'content-type': 'application/json'},
            body: '{"id":"ord_1"}',
          ),
        );
        final res = await _client(driver).payments.createPaymentOrder(
          body: {
            'buyerUserId': 'usr_1',
            'merchantReference': 'ad-1042-promo-1',
            'idempotencyKey': 'idem-ad-1042',
            'currency': 'EUR',
            'priceVersion': 'v1',
            'lines': [
              {'sku': 'star-day', 'quantity': 21, 'unitAmountMinor': 30},
            ],
            'metadata': {'adId': 'ad_1042'},
          },
        ) as Map<String, dynamic>;

        final req = driver.lastRequest!;
        expect(req.method, equals('POST'));
        expect(req.url.path, equals('/v3/payments/orders'));
        final sent = jsonDecode(req.body!) as Map<String, dynamic>;
        expect(sent['buyerUserId'], equals('usr_1'));
        expect(sent['idempotencyKey'], equals('idem-ad-1042'));
        expect(
          sent['lines'],
          equals([
            {'sku': 'star-day', 'quantity': 21, 'unitAmountMinor': 30},
          ]),
        );
        expect(sent['metadata'], equals({'adId': 'ad_1042'}));
        expect(res['id'], equals('ord_1'));
      },
    );

    test('getPaymentOrder → GET /v3/payments/orders/{id}, no body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).payments.getPaymentOrder(id: 'ord_1');

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/payments/orders/ord_1'));
      expect(req.body, isNull);
    });

    test(
      'getPaymentOrders → GET /v3/payments/orders, filters in the query',
      () async {
        final driver = FakeHttpDriver();
        await _client(driver).payments.getPaymentOrders(
          query: {
            'buyerUserId': 'usr_1',
            'merchantReference': 'ad-1042-promo-1',
            'status': 'Paid',
          },
        );

        final req = driver.lastRequest!;
        expect(req.method, equals('GET'));
        expect(req.url.path, equals('/v3/payments/orders'));
        expect(
          req.url.queryParameters,
          equals({
            'buyerUserId': 'usr_1',
            'merchantReference': 'ad-1042-promo-1',
            'status': 'Paid',
          }),
        );
        expect(req.body, isNull);
      },
    );

    test(
        'startPaymentCheckout → POST /v3/payments/orders/{id}/checkout, the checkout in the body',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).payments.startPaymentCheckout(
        id: 'ord_1',
        body: {
          'integrationId': 'int_montonio',
          'method': 'paymentInitiation',
          'returnUrl': 'https://shop.example/return',
          'preferredCountry': 'LT',
          'preferredProvider': 'SWEDBANK',
        },
      );

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/payments/orders/ord_1/checkout'));
      final sent = jsonDecode(req.body!) as Map<String, dynamic>;
      expect(sent['integrationId'], equals('int_montonio'));
      expect(sent['returnUrl'], equals('https://shop.example/return'));
      expect(sent['preferredCountry'], equals('LT'));
    });
  });
}
