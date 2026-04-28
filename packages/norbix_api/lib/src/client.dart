// GENERATED FILE. Do not edit by hand.
// Regenerate with: python3 tool/generate_resources.py

import 'package:norbix_core/norbix_core.dart';

import 'resources/api_keys.dart';
import 'resources/auth.dart';
import 'resources/users.dart';

/// Default base URL for the public Norbix Api host.
const String kNorbixApiDefaultBaseUrl = 'https://api.norbix.ai';

/// Norbix Api client.
///
/// Resources are exposed as direct properties — for example
/// `client.apiKeys.someMethod(...)` — so callers do NOT navigate
/// a redundant `client.xxx.apiKeys` namespace.
class NorbixApi {
  /// Build a client. Defaults to the public Norbix host. To point at a
  /// self-hosted deployment (e.g. `https://api.norbix.isidos.lt` or
  /// `http://localhost:5000`), pass a [NorbixConfig] with the desired URL.
  ///
  /// ```dart
  /// final client = NorbixApi();                          // public host
  /// final client = NorbixApi(
  ///   config: NorbixConfig(
  ///     baseUrl: 'http://localhost:5000',
  ///     apiKey: 'nbx_dev_...',
  ///   ),
  /// );
  /// ```
  NorbixApi({NorbixConfig? config, HttpDriver? driver})
      : _transport = Transport(
          config: config ?? NorbixConfig(baseUrl: kNorbixApiDefaultBaseUrl),
          driver: driver,
        );

  /// Build a client that reads its base URL and credentials from
  /// environment variables. Falls back to the public host when the
  /// URL var is not set, so callers always get a usable client.
  ///
  /// Recognised variables:
  ///   NORBIX_API_BASE_URL        (default https://api.norbix.ai)
  ///   NORBIX_API_KEY
  ///   NORBIX_API_BEARER_TOKEN
  ///   NORBIX_API_VERSION        (default v1)
  ///   NORBIX_API_TIMEOUT_MS
  ///   NORBIX_API_MAX_RETRIES
  factory NorbixApi.fromEnv({
    Map<String, String>? overrides,
    HttpDriver? driver,
  }) {
    final cfg = NorbixConfig.fromEnv(
      defaultBaseUrl: kNorbixApiDefaultBaseUrl,
      baseUrlVar: 'NORBIX_API_BASE_URL',
      apiKeyVar: 'NORBIX_API_KEY',
      bearerTokenVar: 'NORBIX_API_BEARER_TOKEN',
      apiVersionVar: 'NORBIX_API_VERSION',
      timeoutMsVar: 'NORBIX_API_TIMEOUT_MS',
      maxRetriesVar: 'NORBIX_API_MAX_RETRIES',
      overrides: overrides,
    );
    return NorbixApi(config: cfg, driver: driver);
  }

  final Transport _transport;

  /// Currently active configuration. Mutate via [setApiKey], [setBearerToken],
  /// or by passing a new [NorbixConfig] at construction time.
  NorbixConfig get config => _transport.config;

  /// Replace the API key without rebuilding the client.
  void setApiKey(String? key) =>
      _transport.config = _transport.config.copyWith(apiKey: key);

  /// Replace the bearer token without rebuilding the client.
  void setBearerToken(String? token) =>
      _transport.config = _transport.config.copyWith(bearerToken: token);

  /// Replace the entire configuration. Useful for switching environments
  /// (staging <-> production) at runtime.
  void setConfig(NorbixConfig config) => _transport.config = config;

  late final ApiKeysResource apiKeys = ApiKeysResource(_transport);
  late final AuthResource auth = AuthResource(_transport);
  late final UsersResource users = UsersResource(_transport);

  /// Closes the underlying HTTP client. Call when you are done.
  void close() => _transport.close();
}
