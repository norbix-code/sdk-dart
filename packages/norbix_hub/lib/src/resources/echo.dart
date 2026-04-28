// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Health-check / echo endpoint.
class EchoResource extends Resource {
  EchoResource(super.transport);

  /// `GET /{version}/echo`
  Future<Object?> echo({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/echo',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }
}
