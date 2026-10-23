import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Template clone answers the new copy's id. The gateway's clone requests
/// (email, SMS and push templates) answer an `IdResponse`
/// (`{"id": "<new template id>"}`); the SDK hands it to the caller as is.
/// Every call goes to the fake driver — never a real server.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _answeringCopyId() => FakeHttpDriver(
      (_) => const HttpDriverResponse(
        statusCode: 200,
        headers: {'content-type': 'application/json'},
        body: '{"id":"tpl_copy"}',
      ),
    );

void _expectClone(FakeHttpDriver driver, String channel, Object? answer) {
  expect(answer, isA<Map<String, dynamic>>());
  expect((answer as Map<String, dynamic>)['id'], equals('tpl_copy'));
  expect(driver.requests, hasLength(1));
  expect(driver.lastRequest!.method, equals('POST'));
  expect(
    driver.lastRequest!.url.path,
    equals('/v3/notifications/$channel/templates/tpl_source/clone'),
  );
}

void main() {
  group('template clone returns the new copy\'s id', () {
    test('cloneEmailTemplate', () async {
      final driver = _answeringCopyId();
      final answer = await _client(driver)
          .emailNotifications
          .cloneEmailTemplate(id: 'tpl_source');
      _expectClone(driver, 'email', answer);
    });

    test('cloneSmsTemplate', () async {
      final driver = _answeringCopyId();
      final answer = await _client(driver)
          .smsNotifications
          .cloneSmsTemplate(id: 'tpl_source');
      _expectClone(driver, 'sms', answer);
    });

    test('clonePushTemplate', () async {
      final driver = _answeringCopyId();
      final answer = await _client(driver)
          .pushNotifications
          .clonePushTemplate(id: 'tpl_source');
      _expectClone(driver, 'push', answer);
    });
  });
}
