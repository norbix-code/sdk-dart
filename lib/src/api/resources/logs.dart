// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project logs: write your app's own log lines into the project's Logs.
class LogsResource extends Resource {
  LogsResource(super.transport);

  /// `POST /{version}/logs`
  ///
  /// Writes 1–100 log entries. The body carries `entries`, each
  /// `{level?, title, message?, eventCode?, correlationId?, timestamp?,
  /// meta?}`: `level` is `information` (default), `warning` or `error`;
  /// `title` 1–200 characters; `message` at most 8 000; `eventCode` lower
  /// case letters, digits and `_ . : -`, at most 64 (stored as
  /// `app:<code>`); `correlationId` at most 64 letters, digits, `_` or `-`;
  /// `timestamp` UTC, at most 7 days old and 5 minutes ahead; `meta` a
  /// string map of at most 20 keys.
  ///
  /// Answers `WriteLogsResponse` — `{ "accepted": n }`. The call returns at
  /// once: the entries are queued, not yet stored.
  ///
  /// Refusals: 400 for a broken entry, 400 `CM-ERRORS-LOGGING-002` when the
  /// Logs module is off, and 429 `CM-ERRORS-LOGGING-003` when the project's
  /// per-minute quota is used up — a `NorbixRateLimitError` whose
  /// `retryAfterSeconds` says when to send again. A POST is never resent by
  /// the SDK.
  Future<Object?> writeLogs(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
