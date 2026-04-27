import '../core/transport.dart';

class ApiInviteModule {
  final Transport _transport;
  ApiInviteModule(this._transport);

  Future<dynamic> inviteUser({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'api',
      route: '/{version}/membership/users/invite',
      method: 'POST',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
