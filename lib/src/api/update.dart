import '../core/transport.dart';

class ApiUpdateModule {
  final Transport _transport;
  ApiUpdateModule(this._transport);

  Future<dynamic> updateUser({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'api',
      route: '/{version}/membership/users',
      method: 'PUT',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
