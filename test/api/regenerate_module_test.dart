import 'package:norbix_dart/src/core/transport.dart';
import 'package:norbix_dart/src/api/api.dart';
import 'package:test/test.dart';

void main() {
  test('api.regenerate module can be constructed', () {
    const config = TransportConfig(
      baseUrlApi: 'https://api.norbix.dev',
      baseUrlHub: 'https://hub.norbix.dev',
      apiVersion: 'v1',
      hubVersion: 'v1',
    );
    final ns = ApiNamespace(Transport(config));
    final module = ns.regenerate;
    expect(module, isNotNull);
  });
}
