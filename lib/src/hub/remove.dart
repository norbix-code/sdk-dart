import '../core/transport.dart';

class HubRemoveModule {
  final Transport _transport;
  HubRemoveModule(this._transport);

  Future<dynamic> removeTagFromNotificationsGroup({Map<String, dynamic>? query, Map<String, dynamic>? body, String? projectId, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (projectId != null) mergedPathParams['projectId'] = projectId;
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/account/projects/{projectId}/notifications/settings/group/tag',
      method: 'DELETE',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

  Future<dynamic> removeWebhookDestinationRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/webhooks/destinations/{DestinationId}',
      method: 'DELETE',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
