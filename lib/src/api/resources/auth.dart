// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Authentication: API keys, access tokens, OAuth providers.
class AuthResource extends Resource {
  AuthResource(super.transport);

  /// `GET /auth`
  Future<Object?> authenticate({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/auth',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /auth/{provider}`
  Future<Object?> authenticate2({ required Object provider, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/auth/{provider}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'provider': provider},
    );
  }

  /// `GET /access-token`
  Future<Object?> getAccessToken({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/access-token',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }
}
