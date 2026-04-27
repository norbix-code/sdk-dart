import '../core/transport.dart';

class HubRevealModule {
  final Transport _transport;
  HubRevealModule(this._transport);

  Future<dynamic> revealWebhookIntegrationSecretRequest({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'hub',
      route: '/{version}/webhooks/integration/secret',
      method: 'GET',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
