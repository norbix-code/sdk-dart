import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `api.logs` — the app's own log lines (gateway campaign audit/logging,
/// Logs stage A), against the fake driver: verb, path, body, the answer and
/// the 429 quota refusal with its Retry-After.
NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('api.logs', () {
    test('writeLogs → POST /v3/logs, the entries in the body', () async {
      final driver = FakeHttpDriver(
        (_) => const HttpDriverResponse(
          statusCode: 200,
          headers: {'content-type': 'application/json'},
          body: '{"accepted":2}',
        ),
      );
      final res = await _client(driver).logs.writeLogs(body: {
        'entries': [
          {
            'level': 'error',
            'title': 'Payment failed',
            'message': 'card declined',
            'eventCode': 'order:payment_failed',
            'correlationId': 'checkout-42',
            'meta': {'orderId': 'ord_1'},
          },
          {'title': 'Checkout opened'},
        ],
      }) as Map<String, dynamic>;

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/logs'));
      final body = jsonDecode(req.body!) as Map<String, dynamic>;
      final entries = body['entries'] as List;
      expect(entries, hasLength(2));
      expect(
          entries.first,
          equals({
            'level': 'error',
            'title': 'Payment failed',
            'message': 'card declined',
            'eventCode': 'order:payment_failed',
            'correlationId': 'checkout-42',
            'meta': {'orderId': 'ord_1'},
          }));
      expect(entries.last, equals({'title': 'Checkout opened'}));
      expect(res['accepted'], equals(2));
    });

    test(
        'writeLogs over the quota → NorbixRateLimitError with the gateway code '
        'and retryAfterSeconds, sent once', () async {
      final driver = FakeHttpDriver(
        (_) => const HttpDriverResponse(
          statusCode: 429,
          headers: {'content-type': 'application/json', 'retry-after': '37'},
          body: '{"responseStatus":{"isSuccess":false,"errors":['
              '{"errorCode":"CM-ERRORS-LOGGING-003",'
              '"message":"Log quota used up"}]}}',
        ),
      );

      await expectLater(
        _client(driver).logs.writeLogs(body: {
          'entries': [
            {'title': 'x'},
          ],
        }),
        throwsA(isA<NorbixRateLimitError>()
            .having((e) => e.status, 'status', 429)
            .having((e) => e.code, 'code', 'CM-ERRORS-LOGGING-003')
            .having((e) => e.retryAfterSeconds, 'retryAfterSeconds', 37)),
      );
      // A POST is not resent: the caller decides when to try again.
      expect(driver.requests, hasLength(1));
    });
  });
}
