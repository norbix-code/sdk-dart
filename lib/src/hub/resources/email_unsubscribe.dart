// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// RFC-8058 one-click unsubscribe endpoint.
class EmailUnsubscribeResource extends Resource {
  EmailUnsubscribeResource(super.transport);

  /// `POST /{version}/email/one-click-unsubscribe`
  Future<Object?> oneClickUnsubscribe({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/email/one-click-unsubscribe',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
