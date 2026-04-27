import '../core/transport.dart';

class HubEchoModule {
  final Transport _transport;
  HubEchoModule(this._transport);

  Future<dynamic> echo({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/echo',
      method: 'GET',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
