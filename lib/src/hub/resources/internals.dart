// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Internal Norbix utilities (typegen, debug).
class InternalsResource extends Resource {
  InternalsResource(super.transport);

  /// `GET /internal/_typegen`
  Future<Object?> internalsTypeGen({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/internal/_typegen',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }
}
