/// One error inside the gateway's `responseStatus.errors` list.
class NorbixErrorItem {
  /// The gateway's own code, e.g. `CM-ERRORS-FILES-016`.
  final String? errorCode;

  /// The gateway's own text.
  final String? message;

  /// The request field the error is about, when it is about one.
  final String? fieldName;

  /// Extra values the gateway attached to this error.
  final Map<String, dynamic> context;

  const NorbixErrorItem({
    this.errorCode,
    this.message,
    this.fieldName,
    this.context = const {},
  });

  factory NorbixErrorItem.fromJson(Map<String, dynamic> json) {
    final context = json['context'];
    return NorbixErrorItem(
      errorCode: _text(json['errorCode']),
      message: _text(json['message']),
      fieldName: _text(json['fieldName']),
      context: context is Map<String, dynamic> ? context : const {},
    );
  }

  @override
  String toString() => 'NorbixErrorItem($errorCode, $fieldName, $message)';
}

String? _text(Object? value) =>
    (value is String && value.isNotEmpty) ? value : null;

/// The `responseStatus` block of a body, whatever the casing of the key.
Map<String, dynamic>? _responseStatusOf(Object? body) {
  if (body is! Map<String, dynamic>) return null;
  for (final key in const ['responseStatus', 'ResponseStatus']) {
    final value = body[key];
    if (value is Map<String, dynamic>) return value;
  }
  return null;
}

/// `true` when the body carries `responseStatus.isSuccess == false`.
///
/// The gateway answers a business refusal — an unknown id, a rule that says
/// no — with HTTP 200 and that flag. Without this check the SDK would hand
/// such an answer back as a value and the caller would carry on as if the
/// call had worked (10b-files, issue #67).
bool norbixBodySaysItFailed(Object? body) {
  final status = _responseStatusOf(body);
  if (status == null) return false;
  for (final key in const ['isSuccess', 'IsSuccess']) {
    if (status.containsKey(key)) return status[key] == false;
  }
  return false;
}

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

  /// Every error the gateway sent, in the order it sent them.
  final List<NorbixErrorItem> errors;

  /// The answer exactly as it arrived, for whoever needs the rest of it.
  final Object? body;

  const NorbixError({
    required this.message,
    this.code = 'NORBIX_ERROR',
    this.status = 0,
    this.details = const {},
    this.errors = const [],
    this.body,
  });

  /// Same value as [status]. The name every Norbix SDK uses for it.
  int get httpStatus => status;

  /// Same value as [code]. The name every Norbix SDK uses for it.
  String get errorCode => code;

  /// Construct the right typed subclass from an HTTP response. Used by the
  /// transport — you usually do not call this directly.
  factory NorbixError.fromHttp({
    required int status,
    required String message,
    required String code,
    Map<String, dynamic> details = const {},
    List<NorbixErrorItem> errors = const [],
    Object? body,
  }) {
    if (status == 401 || status == 403) {
      return NorbixAuthError(
          message: message,
          code: code,
          status: status,
          details: details,
          errors: errors,
          body: body);
    }
    if (status == 404) {
      return NorbixNotFoundError(
          message: message,
          code: code,
          status: status,
          details: details,
          errors: errors,
          body: body);
    }
    if (status == 429) {
      return NorbixRateLimitError(
          message: message,
          code: code,
          status: status,
          details: details,
          errors: errors,
          body: body);
    }
    if (status >= 500) {
      return NorbixServerError(
          message: message,
          code: code,
          status: status,
          details: details,
          errors: errors,
          body: body);
    }
    if (status >= 400) {
      return NorbixClientError(
          message: message,
          code: code,
          status: status,
          details: details,
          errors: errors,
          body: body);
    }
    return NorbixError(
        message: message,
        code: code,
        status: status,
        details: details,
        errors: errors,
        body: body);
  }

  /// Build the error a gateway answer describes.
  ///
  /// The gateway puts its message and its error code inside
  /// `responseStatus.errors[]`, not at the top of the block, so that list is
  /// read first: the first entry gives [message] and [code], and every entry
  /// is kept in [errors]. Only when the body has no `responseStatus` are the
  /// top-level `message` and `errorCode` read. `Request failed (HTTP N)` is
  /// the last fallback, used when the body says nothing at all — a 500 page
  /// that is not JSON, say.
  factory NorbixError.fromBody({
    required int status,
    Object? body,
    Map<String, dynamic> extraDetails = const {},
  }) {
    final asMap = body is Map<String, dynamic> ? body : <String, dynamic>{};
    // `source` is responseStatus when the body has one, the body itself when
    // it has none — so the top-level fields are read only in the second case.
    final source = _responseStatusOf(body) ?? asMap;

    final rawList = source['errors'];
    final items = <NorbixErrorItem>[
      if (rawList is List)
        for (final entry in rawList)
          if (entry is Map<String, dynamic>) NorbixErrorItem.fromJson(entry),
    ];
    NorbixErrorItem? first;
    for (final item in items) {
      if (item.message != null || item.errorCode != null) {
        first = item;
        break;
      }
    }

    final message = first?.message ??
        _text(source['message']) ??
        'Request failed (HTTP $status)';
    // Callers switch on `code`, so it is never left empty; the gateway's own
    // code wins whenever the gateway sent one.
    final code = first?.errorCode ??
        _text(source['errorCode']) ??
        _text(source['code']) ??
        'NORBIX_HTTP_ERROR';

    final details = <String, dynamic>{
      ...asMap,
      if (body != null && body is! Map<String, dynamic>) 'body': body,
      'status': status,
      ...extraDetails,
    };

    return NorbixError.fromHttp(
      status: status,
      message: message,
      code: code,
      details: details,
      errors: items,
      body: body,
    );
  }

  @override
  String toString() => '$runtimeType $code ($status): $message';
}

/// 401 / 403 — invalid or missing credentials.
class NorbixAuthError extends NorbixError {
  const NorbixAuthError({
    required super.message,
    super.errors,
    super.body,
    super.code = 'NORBIX_AUTH_ERROR',
    super.status,
    super.details,
  });
}

/// 404 — resource does not exist.
class NorbixNotFoundError extends NorbixError {
  const NorbixNotFoundError({
    required super.message,
    super.errors,
    super.body,
    super.code = 'NORBIX_NOT_FOUND',
    super.status = 404,
    super.details,
  });
}

/// 429 — rate limited. `Retry-After` (seconds) is in [details] when present.
class NorbixRateLimitError extends NorbixError {
  const NorbixRateLimitError({
    required super.message,
    super.errors,
    super.body,
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
    super.errors,
    super.body,
    super.code = 'NORBIX_CLIENT_ERROR',
    super.status,
    super.details,
  });
}

/// 5xx — server-side failure.
class NorbixServerError extends NorbixError {
  const NorbixServerError({
    required super.message,
    super.errors,
    super.body,
    super.code = 'NORBIX_SERVER_ERROR',
    super.status,
    super.details,
  });
}

/// Network or timeout failure (no HTTP status).
class NorbixTransportError extends NorbixError {
  const NorbixTransportError({
    required super.message,
    super.errors,
    super.body,
    super.code = 'NORBIX_TRANSPORT_ERROR',
    super.details,
  }) : super(status: 0);
}
