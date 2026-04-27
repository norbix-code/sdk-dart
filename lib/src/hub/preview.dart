import '../core/transport.dart';

class HubPreviewModule {
  final Transport _transport;
  HubPreviewModule(this._transport);

  Future<dynamic> previewEmailNotification({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/notifications/email/preview',
      method: 'GET',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
