import '../core/transport.dart';

class ApiAssignModule {
  final Transport _transport;
  ApiAssignModule(this._transport);

  Future<dynamic> assignRolePermissions({Map<String, dynamic>? query, Map<String, dynamic>? body, Map<String, dynamic>? pathParams}) async {
    final mergedPathParams = <String, dynamic>{};
    if (pathParams != null) mergedPathParams.addAll(pathParams);
    return _transport.send(
      host: 'api',
      route: '/{version}/membership/users/assign-roles',
      method: 'PUT',
      query: query,
      body: body,
      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,
    );
  }

}
