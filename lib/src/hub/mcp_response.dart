import 'dart:convert';

import '../core/http_driver.dart';

/// The answer of the developer MCP endpoint (`/{version}/account/mcp`).
///
/// MCP is not a plain JSON API: `initialize` hands out the session id in the
/// `Mcp-Session-Id` response header, a `tools/call` may answer with an SSE
/// stream, and a notification answers `202` with no body. So the SDK keeps the
/// whole answer instead of only a parsed body.
class McpResponse {
  McpResponse(this.raw);

  /// The untouched HTTP answer.
  final HttpDriverResponse raw;

  /// HTTP status: 200 with a body, 202 for an accepted notification.
  int get statusCode => raw.statusCode;

  /// The `Mcp-Session-Id` header — set on the `initialize` answer. Send it
  /// back as `sessionId` on every later call.
  String? get sessionId => _header('mcp-session-id');

  /// The answer's content type: `application/json` or `text/event-stream`.
  String? get contentType => _header('content-type');

  /// True when the server answered with an SSE stream.
  bool get isEventStream => contentType?.contains('text/event-stream') ?? false;

  /// The raw body: JSON-RPC JSON, or SSE text (`event:` / `data:` lines).
  String get body => raw.body;

  /// The JSON-RPC message when the body is JSON; null for SSE or no body.
  Object? get json {
    if (isEventStream || raw.body.trim().isEmpty) return null;
    try {
      return jsonDecode(raw.body);
    } on FormatException {
      return null;
    }
  }

  String? _header(String name) {
    for (final entry in raw.headers.entries) {
      if (entry.key.toLowerCase() == name) return entry.value;
    }
    return null;
  }
}
