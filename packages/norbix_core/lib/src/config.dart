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

  NorbixConfig({
    required String baseUrl,
    this.apiVersion = 'v1',
    this.apiKey,
    this.bearerToken,
    this.timeout = const Duration(seconds: 30),
    this.maxRetries = 0,
    Map<String, String>? defaultHeaders,
  })  : baseUrl = _stripTrailingSlash(baseUrl),
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
    );
  }

  /// Returns a copy with selected fields replaced. Useful for runtime token
  /// rotation without mutating shared state.
  NorbixConfig copyWith({
    String? baseUrl,
    String? apiVersion,
    String? apiKey,
    String? bearerToken,
    Duration? timeout,
    int? maxRetries,
    Map<String, String>? defaultHeaders,
  }) {
    return NorbixConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      apiVersion: apiVersion ?? this.apiVersion,
      apiKey: apiKey ?? this.apiKey,
      bearerToken: bearerToken ?? this.bearerToken,
      timeout: timeout ?? this.timeout,
      maxRetries: maxRetries ?? this.maxRetries,
      defaultHeaders: defaultHeaders ?? this.defaultHeaders,
    );
  }

  static String _stripTrailingSlash(String url) {
    return url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }
}
