import '../core/transport.dart';

class ApiUnblockModule {
  final Transport _transport;
  ApiUnblockModule(this._transport);

  Future<dynamic> unblockUser({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'api',
      route: '/{version}/membership/users/unblock',
      method: 'PATCH',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
