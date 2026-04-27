import '../core/transport.dart';

class HubRotateModule {
  final Transport _transport;
  HubRotateModule(this._transport);

  Future<dynamic> rotateWebhookIntegrationSecretRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/webhooks/integration/secret/rotate',
      method: 'POST',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
