import 'dart:io' show Platform;

import 'package:meta/meta.dart';

/// Base configuration for any Norbix SDK client.
///
/// Carries the host URL, the API version, credentials (API key and/or bearer
/// token), HTTP timeout and retry policy. Extended by the per-host configs
/// in `norbix_api` and `norbix_hub`.
///
/// Three ways to construct one:
///
/// ```dart
/// // 1) Defaults — points at the public norbix.ai endpoint.
/// final cfg = NorbixConfig(baseUrl: 'https://api.norbix.ai');
///
/// // 2) Explicit overrides for self-hosted deployments.
/// final cfg = NorbixConfig(
///   baseUrl: 'http://localhost:5000',
///   apiKey: 'nbx_dev_...',
/// );
///
/// // 3) Read everything from environment variables.
/// final cfg = NorbixConfig.fromEnv(
///   baseUrlVar: 'NORBIX_API_URL',
///   apiKeyVar:  'NORBIX_API_KEY',
///   defaultBaseUrl: 'https://api.norbix.ai',
/// );
/// ```
@immutable
class NorbixConfig {
  /// Base URL of the host, e.g. `https://api.norbix.ai`,
  /// `https://api.norbix.isidos.lt` or `http://localhost:5000`.
  /// Trailing slashes are stripped.
  final String baseUrl;

  /// API version segment injected into routes that contain `{version}`.
  final String apiVersion;

  /// Static API key, sent as `x-api-key`. Optional.
  final String? apiKey;

  /// Bearer JWT token, sent as `Authorization: Bearer ...`. Optional.
  /// Wins over [apiKey] when both are set.
  final String? bearerToken;

  /// HTTP request timeout. Defaults to 30 s.
  final Duration timeout;

  /// How many times to retry transient (5xx, 429, network) failures.
  /// Defaults to 0 (no retry). Set to 2–3 for production.
  final int maxRetries;

  /// Extra headers added to every request.
  final Map<String, String> defaultHeaders;

  /// Project environment every request targets, sent as the `norbix-env`
  /// header. `PROD` (the default) sends no header; a non-PROD env (e.g.
  /// `TEST`, `STAGING`) scopes every read and write to that environment's
  /// integrations. There is no cross-env fallback.
  final String env;

  /// Norbix region every request targets (a region code such as
  /// `nb-eu-germany`), sent as the `nb-region` header. Unlike [env] there is
  /// NO default region: when null (the default) no header is sent. When set
  /// and [baseUrl] is an SDK default host, requests are routed to the
  /// regional host (`https://{region}.api.norbix.ai`); a user-supplied
  /// custom [baseUrl] is never rewritten.
  final String? region;

  NorbixConfig({
    required String baseUrl,
    this.apiVersion = 'v1',
    this.apiKey,
    this.bearerToken,
    this.timeout = const Duration(seconds: 30),
    this.maxRetries = 0,
    Map<String, String>? defaultHeaders,
    this.env = 'PROD',
    String? region,
  })  : baseUrl = _stripTrailingSlash(baseUrl),
        region = _normalizeRegion(region),
        defaultHeaders = Map.unmodifiable(defaultHeaders ?? const {});

  /// Build a config from environment variables. Falls back to [defaultBaseUrl]
  /// when the URL var is not set, so callers always get a usable client.
  ///
  /// All env var names are configurable so the same helper works for both
  /// API and Hub packages.
  factory NorbixConfig.fromEnv({
    required String defaultBaseUrl,
    String baseUrlVar = 'NORBIX_BASE_URL',
    String apiVersionVar = 'NORBIX_API_VERSION',
    String apiKeyVar = 'NORBIX_API_KEY',
    String bearerTokenVar = 'NORBIX_BEARER_TOKEN',
    String timeoutMsVar = 'NORBIX_TIMEOUT_MS',
    String maxRetriesVar = 'NORBIX_MAX_RETRIES',
    String envVar = 'NORBIX_ENV',
    String regionVar = 'NORBIX_REGION',
    Map<String, String>? overrides,
  }) {
    final env = <String, String>{
      ...Platform.environment,
      ...?overrides,
    };

    String? read(String key) {
      final v = env[key];
      return (v == null || v.isEmpty) ? null : v;
    }

    final timeoutMs = int.tryParse(read(timeoutMsVar) ?? '');
    final retries = int.tryParse(read(maxRetriesVar) ?? '');

    return NorbixConfig(
      baseUrl: read(baseUrlVar) ?? defaultBaseUrl,
      apiVersion: read(apiVersionVar) ?? 'v1',
      apiKey: read(apiKeyVar),
      bearerToken: read(bearerTokenVar),
      timeout: Duration(milliseconds: timeoutMs ?? 30000),
      maxRetries: retries ?? 0,
      env: read(envVar) ?? 'PROD',
      region: read(regionVar),
    );
  }

  /// Returns a copy with selected fields replaced. Useful for runtime token
  /// rotation without mutating shared state.
  ///
  /// Pass an empty string for [region] to clear it (null keeps the current
  /// value, like every other field).
  NorbixConfig copyWith({
    String? baseUrl,
    String? apiVersion,
    String? apiKey,
    String? bearerToken,
    Duration? timeout,
    int? maxRetries,
    Map<String, String>? defaultHeaders,
    String? env,
    String? region,
  }) {
    return NorbixConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      apiVersion: apiVersion ?? this.apiVersion,
      apiKey: apiKey ?? this.apiKey,
      bearerToken: bearerToken ?? this.bearerToken,
      timeout: timeout ?? this.timeout,
      maxRetries: maxRetries ?? this.maxRetries,
      defaultHeaders: defaultHeaders ?? this.defaultHeaders,
      env: env ?? this.env,
      region: region ?? this.region,
    );
  }

  static String _stripTrailingSlash(String url) {
    return url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }

  static String? _normalizeRegion(String? region) {
    return (region == null || region.isEmpty) ? null : region;
  }
}

/// SDK default hosts eligible for regional base-URL composition. A region
/// only rewrites these well-known hosts (`kNorbixApiDefaultBaseUrl`,
/// `kNorbixHubDefaultBaseUrl`); user-supplied base URLs are never touched.
const Set<String> kNorbixRegionalDefaultBaseUrls = {
  'https://api.norbix.ai',
  'https://hub.norbix.ai',
};

/// Compose the regional base URL for [baseUrl]: when [baseUrl] is one of the
/// SDK defaults the [region] code becomes a subdomain prefix (e.g.
/// `https://nb-eu-germany.api.norbix.ai`); any other base URL is returned
/// unchanged.
String composeRegionalBaseUrl(String baseUrl, String region) {
  if (!kNorbixRegionalDefaultBaseUrls.contains(baseUrl)) return baseUrl;
  final uri = Uri.parse(baseUrl);
  return '${uri.scheme}://$region.${uri.host}';
}
