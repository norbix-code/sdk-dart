// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project file storage: upload URLs, commit, sign, download, info, list and delete.
class FilesResource extends Resource {
  FilesResource(super.transport);

  /// `POST /{version}/files/{filesIntegrationId}/commit`
  Future<Object?> commitUpload(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/commit',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `DELETE /{version}/files/{filesIntegrationId}`
  Future<Object?> deleteFileApi(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `DELETE /{version}/files/{filesIntegrationId}/bulk`
  Future<Object?> deleteManyFilesApi(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/bulk',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `GET /{version}/files/{filesIntegrationId}/download`
  Future<Object?> downloadFileApi(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/download',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `GET /{version}/files/{filesIntegrationId}/info`
  Future<Object?> getFileInfo(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/info',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `GET /{version}/files/{filesIntegrationId}/sign`
  Future<Object?> getSignedUrl(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/sign',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `GET /{version}/files/{filesIntegrationId}`
  Future<Object?> listFiles(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `POST /{version}/files/{filesIntegrationId}/upload-url`
  Future<Object?> requestUploadUrl(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/upload-url',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }
}
