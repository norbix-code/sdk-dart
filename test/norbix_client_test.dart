import 'package:norbix_dart/norbix_dart.dart';
import 'package:test/test.dart';

void main() {
  test('client exposes api and hub namespaces', () {
    final client = Norbix();
    expect(client.api, isNotNull);
    expect(client.hub, isNotNull);
    client.close();
  });

  test('client updates auth credentials at runtime', () {
    final client = Norbix();
    client.setApiKey('test-key');
    client.setBearerToken('jwt-token');
    expect(client.transport.config.apiKey, equals('test-key'));
    expect(client.transport.config.bearerToken, equals('jwt-token'));
    client.close();
  });
}
