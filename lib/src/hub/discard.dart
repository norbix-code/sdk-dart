import '../core/transport.dart';

class HubDiscardModule {
  final Transport _transport;
  HubDiscardModule(this._transport);

  Future<dynamic> discardDatabaseSchemaDraftRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/database/schemas/{Id}/draft',
      method: 'DELETE',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
