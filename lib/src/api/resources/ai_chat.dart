import '../../core/resource.dart';

/// End-user AI chat for a signed-in project user.
///
/// `startEndUserChatTurn` answers at once with a `turnId`; the answer streams
/// over the gateway's SSE endpoint on the user's own channel
/// `ai-chat:{projectId}:{authId}` (events `ai.chat.turn.*` and
/// `ai.chat.session.*`). A subscription to another user's channel is refused
/// with HTTP 403 and `responseStatus.errorCode = "AiChatChannelRefused"`
/// before the stream starts — do not retry it.
class AiChatResource extends Resource {
  AiChatResource(super.transport);

  /// `GET /{version}/ai/chat/availability`
  Future<Object?> getEndUserChatAvailability(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/availability',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
    );
  }

  /// `GET /{version}/ai/chat/sessions`
  Future<Object?> listEndUserChatSessions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
    );
  }

  /// `POST /{version}/ai/chat/sessions`
  Future<Object?> createEndUserChatSession(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
    );
  }

  /// `GET /{version}/ai/chat/sessions/{SessionId}`
  Future<Object?> getEndUserChatSession(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `PATCH /{version}/ai/chat/sessions/{SessionId}`
  Future<Object?> renameEndUserChatSession(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `DELETE /{version}/ai/chat/sessions/{SessionId}`
  Future<Object?> deleteEndUserChatSession(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `PUT /{version}/ai/chat/sessions/{SessionId}/pin`
  Future<Object?> pinEndUserChatSession(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}/pin',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `PUT /{version}/ai/chat/sessions/{SessionId}/archive`
  Future<Object?> archiveEndUserChatSession(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}/archive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `GET /{version}/ai/chat/sessions/{SessionId}/entries`
  Future<Object?> getEndUserChatEntries(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}/entries',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `PUT /{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback`
  Future<Object?> setEndUserChatEntryFeedback(
      {required Object sessionId,
      required Object entryId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId, 'EntryId': entryId},
    );
  }

  /// `GET /{version}/ai/chat/sessions/{SessionId}/attachments`
  Future<Object?> listEndUserChatAttachments(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}/attachments',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `POST /{version}/ai/chat/sessions/{SessionId}/attachments`
  Future<Object?> uploadEndUserChatAttachment(
      {required Object sessionId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/sessions/{SessionId}/attachments',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'SessionId': sessionId},
    );
  }

  /// `DELETE /{version}/ai/chat/attachments/{AttachmentId}`
  Future<Object?> deleteEndUserChatAttachment(
      {required Object attachmentId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/attachments/{AttachmentId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'AttachmentId': attachmentId},
    );
  }

  /// `GET /{version}/ai/chat/memory`
  Future<Object?> listEndUserChatMemory(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/memory',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
    );
  }

  /// `DELETE /{version}/ai/chat/memory/{NoteId}`
  Future<Object?> forgetEndUserChatMemory(
      {required Object noteId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/memory/{NoteId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'NoteId': noteId},
    );
  }

  /// `POST /{version}/ai/chat/turn`
  Future<Object?> startEndUserChatTurn(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/ai/chat/turn',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
    );
  }
}
