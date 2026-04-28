// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// LLM and MCP integrations (configure, test, enable/disable).
class AiIntegrationsResource extends Resource {
  AiIntegrationsResource(super.transport);

  /// `DELETE /{version}/ai/integrations/llms/{id}`
  Future<Object?> deleteLlmIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/ai/integrations/mcp/{id}`
  Future<Object?> deleteMcpIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/ai/integrations/llms/{id}/disable`
  Future<Object?> disableLlmIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/ai/integrations/mcp/{id}/disable`
  Future<Object?> disableMcpIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/ai/integrations/llms/{id}/enable`
  Future<Object?> enableLlmIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/ai/integrations/mcp/{id}/enable`
  Future<Object?> enableMcpIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/ai/integrations/llms/{id}`
  Future<Object?> getLlmIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/ai/integrations/llms/integrations`
  Future<Object?> getLlmIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/ai/integrations/mcp/{id}`
  Future<Object?> getMcpIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/ai/integrations/mcp/integrations`
  Future<Object?> getMcpIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/ai/integrations/llms/`
  Future<Object?> saveLlmIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/ai/integrations/mcp/`
  Future<Object?> saveMcpIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/ai/integrations/llms/test`
  Future<Object?> testLlmIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/llms/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/ai/integrations/mcp/test`
  Future<Object?> testMcpIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/ai/integrations/mcp/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
