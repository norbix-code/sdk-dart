import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.accounts` — bundle discount codes, against the fake driver (never a
/// real server): verb, full path, the body, and a refused code reaching the
/// caller with its code and reason.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.accounts — bundle discounts', () {
    test(
        'checkBundleDiscount → POST /v3/account/stripe/discount/check, '
        'code, bundle and billingPeriod in the body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.checkBundleDiscount(
        body: {
          'code': 'LAUNCH30',
          'bundle': 'Growth',
          'billingPeriod': 'Annual',
        },
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/stripe/discount/check'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({
          'code': 'LAUNCH30',
          'bundle': 'Growth',
          'billingPeriod': 'Annual',
        }),
      );
    });

    test('applyBundleDiscount → POST /v3/account/stripe/discount, code in the '
        'body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.applyBundleDiscount(
        body: {'code': 'LAUNCH30'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/stripe/discount'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({'code': 'LAUNCH30'}),
      );
    });

    test(
        'createStripeCheckoutSession carries discountCode in the body',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.createStripeCheckoutSession(
        body: {
          'subscriptionType': 'ManagedService',
          'bundle': 'Starter',
          'billingPeriod': 'Monthly',
          'discountCode': 'LAUNCH30',
        },
      );

      expect(
        driver.lastRequest!.url.toString(),
        equals(
            'https://hub.norbix.ai/v3/account/stripe/create-checkout-session'),
      );
      expect(
        (jsonDecode(driver.lastRequest!.body as String)
            as Map<String, dynamic>)['discountCode'],
        equals('LAUNCH30'),
      );
    });

    test(
        'a refused code (400 CM-ERRORS-ACCOUNT-027) reaches the caller with '
        'the code and the reason', () async {
      final driver = FakeHttpDriver((_) => HttpDriverResponse(
            statusCode: 400,
            headers: const {'content-type': 'application/json'},
            body: jsonEncode({
              'responseStatus': {
                'errorCode': 'CM-ERRORS-ACCOUNT-027',
                'message': 'This discount code cannot be used.',
                'errors': [
                  {
                    'message': 'This discount code cannot be used.',
                    'errorCode': 'CM-ERRORS-ACCOUNT-027',
                    'context': {'reason': 'already_used'},
                  },
                ],
              },
            }),
          ));

      Object? caught;
      try {
        await _client(driver).accounts.applyBundleDiscount(
          body: {'code': 'LAUNCH30'},
        );
      } catch (e) {
        caught = e;
      }

      expect(caught, isA<NorbixClientError>());
      final error = caught as NorbixClientError;
      expect(error.httpStatus, equals(400));
      expect(error.errorCode, equals('CM-ERRORS-ACCOUNT-027'));
      expect(error.errors.single.context['reason'], equals('already_used'));
    });
  });
}
