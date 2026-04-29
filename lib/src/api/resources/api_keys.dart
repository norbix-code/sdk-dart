// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// API keys for the current project / environment.
class ApiKeysResource extends Resource {
  ApiKeysResource(super.transport);

  /// `GET /apikeys`
  Future<Object?> getApiKeys({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/apikeys',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /apikeys/{environment}`
  Future<Object?> getApiKeys2({ required Object environment, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/apikeys/{environment}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'environment': environment},
    );
  }

  /// `GET /apikeys/regenerate`
  Future<Object?> regenerateApiKeys({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/apikeys/regenerate',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /apikeys/regenerate/{environment}`
  Future<Object?> regenerateApiKeys2({ required Object environment, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/apikeys/regenerate/{environment}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'environment': environment},
    );
  }
}
