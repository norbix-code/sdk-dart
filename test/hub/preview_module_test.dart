import 'package:norbix_dart/src/core/transport.dart';
import 'package:norbix_dart/src/hub/hub.dart';
import 'package:test/test.dart';

void main() {
  test('hub.preview module can be constructed', () {
    const config = TransportConfig(
      baseUrlApi: 'https://api.norbix.dev',
      baseUrlHub: 'https://hub.norbix.dev',
      apiVersion: 'v1',
      hubVersion: 'v1',
    );
    final ns = HubNamespace(Transport(config));
    final module = ns.preview;
    expect(module, isNotNull);
  });
}
