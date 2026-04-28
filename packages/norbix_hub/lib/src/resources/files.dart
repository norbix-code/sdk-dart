// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// File storage integrations and triggers.
class FilesResource extends Resource {
  FilesResource(super.transport);

  /// `DELETE /{version}/files/integrations/{id}`
  Future<Object?> deleteFilesIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/files/triggers/{triggerId}`
  Future<Object?> deleteFilesTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers/{triggerId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/files/disable`
  Future<Object?> disableFiles({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{id}/disable`
  Future<Object?> disableFilesIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/files/triggers/{triggerId}/disable`
  Future<Object?> disableFilesTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers/{triggerId}/disable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/files/enable`
  Future<Object?> enableFiles({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{id}/enable`
  Future<Object?> enableFilesIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/files/triggers/{triggerId}/enable`
  Future<Object?> enableFilesTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers/{triggerId}/enable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/files/integrations/{id}`
  Future<Object?> getFilesIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/files/integrations`
  Future<Object?> getFilesIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/files/triggers/{id}`
  Future<Object?> getFilesTrigger({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/files/triggers`
  Future<Object?> getFilesTriggers({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/integrations`
  Future<Object?> saveFilesIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/triggers`
  Future<Object?> saveFilesTrigger({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/triggers',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{id}/default`
  Future<Object?> setFilesIntegrationAsDefault({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/files/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }
}
