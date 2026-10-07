import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// The three notification preview routes open with a signed link (`hash`)
/// alone. A client with no credentials must still send the call — with no
/// credential header and no error — and a client with a credential must
/// still send it.
typedef _Preview = Future<Object?> Function(
    NorbixHub hub, Map<String, Object?> query);

final _previews = <String, _Preview>{
  'push': (hub, q) => hub.pushNotifications.previewPushNotification(query: q),
  'email': (hub, q) =>
      hub.emailNotifications.previewEmailNotification(query: q),
  'sms': (hub, q) => hub.smsNotifications.previewSmsNotification(query: q),
};

NorbixHub _client(FakeHttpDriver driver, {String? apiKey, String? bearer}) =>
    NorbixHub(
      config: NorbixConfig(
        baseUrl: 'https://hub.norbix.ai',
        apiKey: apiKey,
        bearerToken: bearer,
      ),
      driver: driver,
    );

void main() {
  group('hub notification preview — signed link', () {
    for (final entry in _previews.entries) {
      final kind = entry.key;
      final preview = entry.value;

      test('$kind: no credentials + hash sends no auth and does not throw',
          () async {
        final driver = FakeHttpDriver();
        await preview(_client(driver), {'hash': 'signed-link-abc'});

        final request = driver.lastRequest!;
        expect(request.method, equals('GET'));
        expect(request.url.path, equals('/v3/notifications/$kind/preview'));
        expect(
            request.url.queryParameters, equals({'hash': 'signed-link-abc'}));
        expect(request.headers.containsKey('authorization'), isFalse);
        expect(request.headers.containsKey('x-api-key'), isFalse);
      });

      test('$kind: a bearer token is sent as Authorization', () async {
        final driver = FakeHttpDriver();
        await preview(
            _client(driver, bearer: 'tok'), {'hash': 'signed-link-abc'});

        expect(
            driver.lastRequest!.headers['authorization'], equals('Bearer tok'));
      });

      test('$kind: an API key is sent (x-api-key)', () async {
        final driver = FakeHttpDriver();
        await preview(
            _client(driver, apiKey: 'k'), {'hash': 'signed-link-abc'});

        expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
      });
    }
  });
}
