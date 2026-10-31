import '../../core/resource.dart';

/// Trigger endpoints that span every module. Hand-written: the resource
/// generator is in no checkout. Saving a trigger stays on its own resource.
class TriggersResource extends Resource {
  TriggersResource(super.transport);

  /// `POST /{version}/triggers/execution-identity/check`
  ///
  /// What an identity lacks for a `triggerType` and `action`. Nothing is saved.
  Future<Object?> checkTriggerExecutionIdentity(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/triggers/execution-identity/check',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/triggers/runs`
  ///
  /// One trigger's runs, newest first: `triggerType`, `triggerId`, optional `status`, paging.
  Future<Object?> getTriggerRuns(
      {Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/triggers/runs',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/triggers/runs/{id}`
  ///
  /// One run (`trr_…`). The `triggerType` query value is required.
  Future<Object?> getTriggerRun(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/triggers/runs/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }
}
