// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// AI chat completions for the current project.
class ChatResource extends Resource {
  ChatResource(super.transport);

  /// `POST /{version}/chat/complete`
  Future<Object?> askChat(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/chat/complete',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
