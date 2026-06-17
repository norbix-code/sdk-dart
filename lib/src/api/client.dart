// GENERATED FILE. Do not edit by hand.
// Regenerate with: python3 tool/generate_resources.py

import '../core/config.dart';
import '../core/http_driver.dart';
import '../core/transport.dart';

import 'resources/api_keys.dart';
import 'resources/auth.dart';
import 'resources/chat.dart';
import 'resources/database.dart';
import 'resources/files.dart';
import 'resources/user_auth.dart';
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
  NorbixApi({
    NorbixConfig? config,
    HttpDriver? driver,
    String? env,
    String? region,
  }) : _transport = Transport(
          config: () {
            var cfg = config ?? NorbixConfig(baseUrl: kNorbixApiDefaultBaseUrl);
            if (env != null) cfg = cfg.copyWith(env: env);
            if (region != null) cfg = cfg.copyWith(region: region);
            return cfg;
          }(),
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
  ///   NORBIX_API_REGION
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
      envVar: 'NORBIX_API_ENV',
      regionVar: 'NORBIX_API_REGION',
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

  /// Project environment all requests target (sent as the `norbix-env`
  /// header). Defaults to `PROD`.
  String get env => _transport.config.env;

  /// Switch the project environment for subsequent requests. Pass `'PROD'`
  /// (or `null`) to return to production.
  void setEnv(String? env) =>
      _transport.config = _transport.config.copyWith(env: env ?? 'PROD');

  /// Norbix region all requests target (sent as the `nb-region` header and —
  /// when the base URL is the SDK default — used to route to the regional
  /// host). Null (the default) means no region: no header is sent.
  String? get region => _transport.config.region;

  /// Switch the Norbix region for subsequent requests. Pass `null` to clear
  /// it (no header, default host). When the base URL is the SDK default the
  /// regional host (`https://{region}.api.norbix.ai`) is used; a custom base
  /// URL is never rewritten. Per-call `region` arguments still override this
  /// for individual requests (header only).
  void setRegion(String? region) =>
      _transport.config = _transport.config.copyWith(region: region ?? '');

  /// Replace the entire configuration. Useful for switching environments
  /// (staging <-> production) at runtime.
  void setConfig(NorbixConfig config) => _transport.config = config;

  late final ApiKeysResource apiKeys = ApiKeysResource(_transport);
  late final AuthResource auth = AuthResource(_transport);
  late final ChatResource chat = ChatResource(_transport);
  late final DatabaseResource database = DatabaseResource(_transport);
  late final FilesResource files = FilesResource(_transport);
  late final UserAuthResource userAuth = UserAuthResource(_transport);
  late final UsersResource users = UsersResource(_transport);

  /// Closes the underlying HTTP client. Call when you are done.
  void close() => _transport.close();
}
