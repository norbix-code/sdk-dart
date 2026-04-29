/// Base exception thrown by every Norbix call.
///
/// Use the typed subclasses (`NorbixAuthError`, `NorbixNotFoundError`, ...)
/// when you want to react differently per HTTP status.
class NorbixError implements Exception {
  /// Norbix-specific error code (or `NORBIX_HTTP_ERROR` if the server did
  /// not provide one).
  final String code;

  /// HTTP status code, or 0 for transport-level failures (DNS, timeout).
  final int status;

  /// Human-readable message extracted from the response body when possible.
  final String message;

  /// Full parsed response body (or transport context) for debugging.
  final Map<String, dynamic> details;

  const NorbixError({
    required this.message,
    this.code = 'NORBIX_ERROR',
    this.status = 0,
    this.details = const {},
  });

  /// Construct the right typed subclass from an HTTP response. Used by the
  /// transport — you usually do not call this directly.
  factory NorbixError.fromHttp({
    required int status,
    required String message,
    required String code,
    Map<String, dynamic> details = const {},
  }) {
    if (status == 401 || status == 403) {
      return NorbixAuthError(
          message: message, code: code, status: status, details: details);
    }
    if (status == 404) {
      return NorbixNotFoundError(
          message: message, code: code, status: status, details: details);
    }
    if (status == 429) {
      return NorbixRateLimitError(
          message: message, code: code, status: status, details: details);
    }
    if (status >= 500) {
      return NorbixServerError(
          message: message, code: code, status: status, details: details);
    }
    if (status >= 400) {
      return NorbixClientError(
          message: message, code: code, status: status, details: details);
    }
    return NorbixError(
        message: message, code: code, status: status, details: details);
  }

  @override
  String toString() => '$runtimeType $code ($status): $message';
}

/// 401 / 403 — invalid or missing credentials.
class NorbixAuthError extends NorbixError {
  const NorbixAuthError({
    required super.message,
    super.code = 'NORBIX_AUTH_ERROR',
    super.status,
    super.details,
  });
}

/// 404 — resource does not exist.
class NorbixNotFoundError extends NorbixError {
  const NorbixNotFoundError({
    required super.message,
    super.code = 'NORBIX_NOT_FOUND',
    super.status = 404,
    super.details,
  });
}

/// 429 — rate limited. `Retry-After` (seconds) is in [details] when present.
class NorbixRateLimitError extends NorbixError {
  const NorbixRateLimitError({
    required super.message,
    super.code = 'NORBIX_RATE_LIMITED',
    super.status = 429,
    super.details,
  });

  /// Seconds the server asked us to wait, or null if unknown.
  int? get retryAfterSeconds {
    final raw = details['retryAfter'];
    if (raw is int) return raw;
    if (raw is String) return int.tryParse(raw);
    return null;
  }
}

/// 4xx other than 401/403/404/429.
class NorbixClientError extends NorbixError {
  const NorbixClientError({
    required super.message,
    super.code = 'NORBIX_CLIENT_ERROR',
    super.status,
    super.details,
  });
}

/// 5xx — server-side failure.
class NorbixServerError extends NorbixError {
  const NorbixServerError({
    required super.message,
    super.code = 'NORBIX_SERVER_ERROR',
    super.status,
    super.details,
  });
}

/// Network or timeout failure (no HTTP status).
class NorbixTransportError extends NorbixError {
  const NorbixTransportError({
    required super.message,
    super.code = 'NORBIX_TRANSPORT_ERROR',
    super.details,
  }) : super(status: 0);
}
