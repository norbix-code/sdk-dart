import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

void main() {
  group('NorbixConfig', () {
    test('strips trailing slash from baseUrl', () {
      final cfg = NorbixConfig(baseUrl: 'https://api.norbix.ai/');
      expect(cfg.baseUrl, equals('https://api.norbix.ai'));
    });

    test('copyWith preserves untouched fields', () {
      final cfg = NorbixConfig(
        baseUrl: 'https://api.norbix.ai',
        apiKey: 'k1',
        bearerToken: 'b1',
        apiVersion: 'v2',
      );
      final next = cfg.copyWith(apiKey: 'k2');
      expect(next.apiKey, equals('k2'));
      expect(next.bearerToken, equals('b1'));
      expect(next.apiVersion, equals('v2'));
      expect(next.baseUrl, equals('https://api.norbix.ai'));
    });

    test('fromEnv reads overrides and falls back to defaults', () {
      final cfg = NorbixConfig.fromEnv(
        defaultBaseUrl: 'https://api.norbix.ai',
        baseUrlVar: 'X_BASE_URL',
        apiKeyVar: 'X_KEY',
        bearerTokenVar: 'X_TOKEN',
        apiVersionVar: 'X_VERSION',
        timeoutMsVar: 'X_TIMEOUT',
        maxRetriesVar: 'X_RETRIES',
        overrides: {
          'X_BASE_URL': 'http://localhost:5000',
          'X_KEY': 'nbx_test',
          'X_RETRIES': '3',
          'X_TIMEOUT': '15000',
        },
      );
      expect(cfg.baseUrl, equals('http://localhost:5000'));
      expect(cfg.apiKey, equals('nbx_test'));
      expect(cfg.bearerToken, isNull);
      expect(cfg.apiVersion, equals('v1'));
      expect(cfg.maxRetries, equals(3));
      expect(cfg.timeout, equals(const Duration(milliseconds: 15000)));
    });

    test('fromEnv falls back to default URL when not set', () {
      final cfg = NorbixConfig.fromEnv(
        defaultBaseUrl: 'https://api.norbix.ai',
        overrides: const {},
      );
      expect(cfg.baseUrl, equals('https://api.norbix.ai'));
    });
  });
}
