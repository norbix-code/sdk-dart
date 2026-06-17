// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Reference resolution for cross-module resources.
class ResourcesResource extends Resource {
  ResourcesResource(super.transport);

  /// `POST /{version}/resources/resolve`
  Future<Object?> resolveResources(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/resources/resolve',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
