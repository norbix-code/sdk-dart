import '../core/transport.dart';

class HubAttachModule {
  final Transport _transport;
  HubAttachModule(this._transport);

  Future<dynamic> attachFileToTemplateRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/notifications/email/templates/attachments',
      method: 'POST',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
