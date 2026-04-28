// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

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

  /// `POST /v3/auth`
  Future<Object?> authenticate3({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/v3/auth',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /v3/auth/{provider}`
  Future<Object?> authenticate4({ required Object provider, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/v3/auth/{provider}',
      method: 'POST',
      query: query,
      body: body,
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
