import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.accounts` — trial limits, against the fake driver (never a real
/// server): verb, full path, the query or body, the parsed answer, the new
/// checkout fields, and a full region reaching the caller with its code.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
  config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
  driver: driver,
);

HttpDriverResponse Function(int) _json(Map<String, Object?> body) =>
    (_) => HttpDriverResponse(
      statusCode: 200,
      headers: const {'content-type': 'application/json'},
      body: jsonEncode(body),
    );

void main() {
  group('hub.accounts — trial limits', () {
    test('getTrialAvailability → GET /v3/account/trial-availability, region '
        'in the query, answer parsed', () async {
      final driver = FakeHttpDriver(
        _json({
          'limitsOn': true,
          'region': 'nb-eu-germany',
          'trialsOpen': false,
          'waitlistOpen': true,
          'onWaitlist': false,
          'refusal': '',
        }),
      );
      final answer = await _client(driver).accounts.getTrialAvailability(
        query: {'region': 'nb-eu-germany'},
      ) as Map<String, dynamic>;

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/trial-availability'),
      );
      expect(
        driver.lastRequest!.url.queryParameters['region'],
        equals('nb-eu-germany'),
      );
      expect(answer['trialsOpen'], isFalse);
      expect(answer['waitlistOpen'], isTrue);
    });

    test('joinTrialWaitlist → POST /v3/account/trial-waitlist, region, consent '
        'and consentVersion in the body, status parsed', () async {
      final driver = FakeHttpDriver(
        _json({'status': 'added', 'message': 'You are on the waiting list.'}),
      );
      final answer = await _client(driver).accounts.joinTrialWaitlist(
        body: {
          'region': 'nb-eu-germany',
          'consent': true,
          'consentVersion': '2026-11',
        },
      ) as Map<String, dynamic>;

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v3/account/trial-waitlist'),
      );
      expect(
        jsonDecode(driver.lastRequest!.body as String),
        equals({
          'region': 'nb-eu-germany',
          'consent': true,
          'consentVersion': '2026-11',
        }),
      );
      expect(answer['status'], equals('added'));
    });

    test('createStripeCheckoutSession carries region, withoutTrial and '
        'trialInvite in the body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.createStripeCheckoutSession(
        body: {
          'subscriptionType': 'ManagedService',
          'bundle': 'Starter',
          'billingPeriod': 'Monthly',
          'region': 'nb-eu-germany',
          'withoutTrial': false,
          'trialInvite': 'inv_123',
        },
      );

      expect(
        driver.lastRequest!.url.toString(),
        equals(
          'https://hub.norbix.ai/v3/account/stripe/create-checkout-session',
        ),
      );
      final sent = jsonDecode(
        driver.lastRequest!.body as String,
      ) as Map<String, dynamic>;
      expect(sent['region'], equals('nb-eu-germany'));
      expect(sent['withoutTrial'], isFalse);
      expect(sent['trialInvite'], equals('inv_123'));
    });

    test('a trial checkout in a full region (400 CM-ERRORS-ACCOUNT-040) '
        'reaches the caller with the code', () async {
      final driver = FakeHttpDriver(
        (_) => HttpDriverResponse(
          statusCode: 400,
          headers: const {'content-type': 'application/json'},
          body: jsonEncode({
            'responseStatus': {
              'errorCode': 'CM-ERRORS-ACCOUNT-040',
              'message': 'Free trials in this region are full.',
              'errors': [
                {
                  'message': 'Free trials in this region are full.',
                  'errorCode': 'CM-ERRORS-ACCOUNT-040',
                },
              ],
            },
          }),
        ),
      );

      Object? caught;
      try {
        await _client(driver).accounts.createStripeCheckoutSession(
          body: {
            'subscriptionType': 'ManagedService',
            'bundle': 'Starter',
            'billingPeriod': 'Monthly',
            'region': 'nb-eu-germany',
          },
        );
      } catch (e) {
        caught = e;
      }

      expect(caught, isA<NorbixClientError>());
      final error = caught as NorbixClientError;
      expect(error.httpStatus, equals(400));
      expect(error.errorCode, equals('CM-ERRORS-ACCOUNT-040'));
    });
  });
}
