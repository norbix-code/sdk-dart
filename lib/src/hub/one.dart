import '../core/transport.dart';

class HubOneModule {
  final Transport _transport;
  HubOneModule(this._transport);

  Future<dynamic> oneClickUnsubscribeRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/email/one-click-unsubscribe',
      method: 'POST',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
