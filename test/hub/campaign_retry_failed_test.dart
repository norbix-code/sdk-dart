import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Retrying the failed recipients of a campaign (gateway 2.3.9, N-28):
/// `retryFailed{Email,Sms,Push}Notifications` post to
/// `/{version}/notifications/<channel>/campaigns/{Id}/retry-failed`. The
/// body is the caller's map, sent as it is — the SDK fills in no default, so
/// an unset optional (`databaseIntegrationId`, `notificationIds`,
/// `includeAmbiguous`, `categories`) is simply not on the wire. Every call
/// goes to the fake driver — never a real server, never a real provider.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

const _answer =
    '{"retryRequestId":"rtr_1","selected":2,"skipped":{"AlreadyAccepted":5},'
    '"replayed":false}';

FakeHttpDriver _answering() => FakeHttpDriver(
      (_) => const HttpDriverResponse(
        statusCode: 200,
        headers: {'content-type': 'application/json'},
        body: _answer,
      ),
    );

Future<Object?> _call(
  NorbixHub hub,
  String channel, {
  required Object id,
  Object? body,
}) {
  switch (channel) {
    case 'email':
      return hub.emailNotifications
          .retryFailedEmailNotifications(id: id, body: body);
    case 'sms':
      return hub.smsNotifications
          .retryFailedSmsNotifications(id: id, body: body);
    case 'push':
      return hub.pushNotifications
          .retryFailedPushNotifications(id: id, body: body);
  }
  throw ArgumentError.value(channel, 'channel');
}

void main() {
  for (final channel in ['email', 'sms', 'push']) {
    group('retryFailed ($channel)', () {
      test('POST /v3/notifications/$channel/campaigns/cmp_1/retry-failed',
          () async {
        final driver = _answering();
        final answer = await _call(
          _client(driver),
          channel,
          id: 'cmp_1',
          body: {'idempotencyKey': 'retry-1'},
        );

        expect(driver.requests, hasLength(1));
        final req = driver.lastRequest!;
        expect(req.method, equals('POST'));
        expect(
          req.url.path,
          equals('/v3/notifications/$channel/campaigns/cmp_1/retry-failed'),
        );
        expect(answer, isA<Map<String, dynamic>>());
        final map = answer as Map<String, dynamic>;
        expect(map['retryRequestId'], equals('rtr_1'));
        expect(map['selected'], equals(2));
        expect(map['skipped'], equals({'AlreadyAccepted': 5}));
        expect(map['replayed'], isFalse);
      });

      test('only idempotencyKey — the unset optionals are not sent', () async {
        final driver = FakeHttpDriver();
        await _call(
          _client(driver),
          channel,
          id: 'cmp_1',
          body: {'idempotencyKey': 'retry-1'},
        );

        final body =
            jsonDecode(driver.lastRequest!.body!) as Map<String, dynamic>;
        expect(body, equals({'idempotencyKey': 'retry-1'}));
        for (final optional in [
          'databaseIntegrationId',
          'notificationIds',
          'includeAmbiguous',
          'categories',
        ]) {
          expect(body.containsKey(optional), isFalse, reason: optional);
        }
      });

      test('every field travels in the body as given', () async {
        final driver = FakeHttpDriver();
        await _call(
          _client(driver),
          channel,
          id: 'cmp_1',
          body: {
            'idempotencyKey': 'retry-2',
            'databaseIntegrationId': 'nbin_db',
            'notificationIds': ['ntf_1', 'ntf_2'],
            'includeAmbiguous': true,
            'categories': ['Transient', 'Unknown'],
          },
        );

        final body =
            jsonDecode(driver.lastRequest!.body!) as Map<String, dynamic>;
        expect(
          body,
          equals({
            'idempotencyKey': 'retry-2',
            'databaseIntegrationId': 'nbin_db',
            'notificationIds': ['ntf_1', 'ntf_2'],
            'includeAmbiguous': true,
            'categories': ['Transient', 'Unknown'],
          }),
        );
      });

      test('a refused retry (same key, another body) throws the typed error',
          () async {
        final driver = FakeHttpDriver((_) => const HttpDriverResponse(
              statusCode: 409,
              headers: {'content-type': 'application/json'},
              body: '{"responseStatus":{"errorCode":"Conflict",'
                  '"message":"idempotencyKey was used with another body"}}',
            ));

        await expectLater(
          _call(
            _client(driver),
            channel,
            id: 'cmp_1',
            body: {'idempotencyKey': 'retry-1', 'includeAmbiguous': true},
          ),
          throwsA(isA<NorbixError>()),
        );
      });
    });
  }
}
