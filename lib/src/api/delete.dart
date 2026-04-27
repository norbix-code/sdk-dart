import '../core/transport.dart';

class ApiDeleteModule {
  final Transport _transport;
  ApiDeleteModule(this._transport);

  Future<dynamic> deleteUser({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'api',
      route: '/{version}/membership/users',
      method: 'DELETE',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
