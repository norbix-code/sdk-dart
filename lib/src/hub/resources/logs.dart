// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project logs: read and clean the log entries, the log settings, and the
/// logging integrations.
///
/// Nothing is delivered to a logging integration until its last
/// [testLoggingIntegration] passed — after saving or changing one, test it.
class LogsResource extends Resource {
  LogsResource(super.transport);

  /// `POST /{version}/logs/clean`
  ///
  /// Permanently deletes every log entry stored in the project's Norbix
  /// Logging integration. Answers `CleanLogsResponse` (no fields).
  Future<Object?> cleanLogs(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/clean',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/logs/integrations/{id}`
  Future<Object?> deleteLoggingIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/logs/disable`
  Future<Object?> disableLogging(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/logs/integrations/{id}/disable`
  Future<Object?> disableLoggingIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/logs/enable`
  Future<Object?> enableLogging(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/logs/integrations/{id}/enable`
  Future<Object?> enableLoggingIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/logs/{id}`
  ///
  /// Reads one log entry by its id (24 hex characters, from a [getLogs] row).
  /// Answers `GetLogResponse` — `{ "item": TenantLogEntryDto }`.
  Future<Object?> getLog(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/logs/settings`
  ///
  /// Reads the project's log settings. Answers `GetLogSettingsResponse` —
  /// `skipCloudDashboardLogs`, `skipHttpBodyMeta`, `aiChatLoggingEnabled`,
  /// `hasNorbixLogging`.
  Future<Object?> getLogSettings(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/settings',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/logs/integrations/{id}`
  Future<Object?> getLoggingIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/logs/integrations`
  Future<Object?> getLoggingIntegrations(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/logs`
  ///
  /// Lists the project's log entries, newest first, cursor-paged. Query
  /// filters (all optional): `level` (Information, Warning, Error), `module`,
  /// `logCorrelationId`, `eventCode`, `search`, `metaKey` + `metaValue`,
  /// `fromUtc`, `toUtc`; paging: `pageSize`, `startingAfter`, `endingBefore`.
  /// Answers `GetLogsResponse` — `{ "list": PaginatedResponse }`.
  Future<Object?> getLogs(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/logs/audit`
  ///
  /// The full request trail of one correlation id, oldest first. Query:
  /// `targetCorrelationId`.
  Future<Object?> getLogsByCorrelationId(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/audit',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/logs/settings`
  ///
  /// Updates the project's log settings. Body (each optional, not sent =
  /// unchanged): `skipCloudDashboardLogs`, `skipHttpBodyMeta`,
  /// `aiChatLoggingEnabled`. Answers `SaveLogSettingsResponse`.
  Future<Object?> saveLogSettings(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/settings',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/logs/integrations`
  ///
  /// Saves a logging integration (Datadog, AWS CloudWatch, MongoDB, …).
  /// Nothing is delivered to it until [testLoggingIntegration] passed.
  Future<Object?> saveLoggingIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/logs/integrations/test`
  ///
  /// Tests a logging integration. Only an integration whose last test passed
  /// receives log entries.
  Future<Object?> testLoggingIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/logs/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
