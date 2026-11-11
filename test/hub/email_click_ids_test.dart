import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Email click ids (`nblid`): `emailNotifications.updateEmailClickTracking`
/// switches them on or off (`PATCH /{version}/notifications/email/settings/click-tracking`)
/// and `emailNotifications.recordEmailClicks` hands clicks back
/// (`POST /{version}/notifications/email/clicks`). The body is the caller's
/// map, sent as it is, never in the query. Every call goes to the fake
/// driver — never a real server.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _answering(String body) => FakeHttpDriver(
      (_) => HttpDriverResponse(
        statusCode: 200,
        headers: const {'content-type': 'application/json'},
        body: body,
      ),
    );

void main() {
  group('updateEmailClickTracking', () {
    test(
        'PATCH /v3/notifications/email/settings/click-tracking, enabled in the body',
        () async {
      final driver = _answering('{}');
      await _client(driver)
          .emailNotifications
          .updateEmailClickTracking(body: {'enabled': true});

      expect(driver.requests, hasLength(1));
      final req = driver.lastRequest!;
      expect(req.method, equals('PATCH'));
      expect(req.url.path,
          equals('/v3/notifications/email/settings/click-tracking'));
      expect(req.url.query, isEmpty);
      expect(jsonDecode(req.body!), equals({'enabled': true}));
    });

    test('enabled: false is sent, not dropped', () async {
      final driver = _answering('{}');
      await _client(driver)
          .emailNotifications
          .updateEmailClickTracking(body: {'enabled': false});

      final req = driver.lastRequest!;
      expect(req.method, equals('PATCH'));
      expect(jsonDecode(req.body!), equals({'enabled': false}));
    });

    test('a failed PATCH is not sent again', () async {
      final driver = FakeHttpDriver(
        (_) => const HttpDriverResponse(
          statusCode: 500,
          headers: {'content-type': 'application/json'},
          body: '{"responseStatus":{"errorCode":"X","message":"boom"}}',
        ),
      );
      await expectLater(
        _client(driver)
            .emailNotifications
            .updateEmailClickTracking(body: {'enabled': true}),
        throwsA(isA<NorbixError>()),
      );
      expect(driver.requests, hasLength(1));
    });
  });

  group('recordEmailClicks', () {
    const answer = '{"recorded":1,"duplicates":0,"flagged":1,"rejected":1,'
        '"clicks":[{"index":0,"status":"recorded","flag":"suspected-scanner",'
        '"flagReason":"user-agent","campaignId":"cmp_1",'
        '"notificationId":"ntf_1","linkIndex":2,"to":["ann@example.com"]},'
        '{"index":1,"status":"rejected","reason":"not-valid"}]}';

    test(
        'POST /v3/notifications/email/clicks, the clicks as sent, the answer as is',
        () async {
      final driver = _answering(answer);
      final clicks = [
        {
          'nblid': 'ntf_1.2.1.abc',
          'url': 'https://shop.example.com/sale?nblid=ntf_1.2.1.abc',
          'clickedAt': '2026-11-11T10:00:00Z',
          'userAgent': 'Mozilla/5.0',
        },
        {'nblid': 'made-up'},
      ];
      final result = await _client(driver)
          .emailNotifications
          .recordEmailClicks(body: {'clicks': clicks});

      expect(driver.requests, hasLength(1));
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/notifications/email/clicks'));
      expect(req.url.query, isEmpty);
      expect(jsonDecode(req.body!), equals({'clicks': clicks}));

      final map = result as Map<String, dynamic>;
      expect(map['recorded'], equals(1));
      expect(map['rejected'], equals(1));
      final results = map['clicks'] as List<dynamic>;
      expect(results, hasLength(2));
      expect(results[0]['flag'], equals('suspected-scanner'));
      expect(results[0]['flagReason'], equals('user-agent'));
      expect(results[0]['to'], equals(['ann@example.com']));
      expect(results[1]['status'], equals('rejected'));
      expect(results[1]['reason'], equals('not-valid'));
    });
  });
}
