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

  /// `POST /{version}/files/{filesIntegrationId}/test`
  ///
  /// Runs a live probe against a files integration that is already saved:
  /// it uploads a small file, reads it, lists the folder and deletes the file
  /// again. The answer has one entry per step in `items` — each with
  /// `operation`, `result` (`"OK"` or `"Failed"`) and `errors`.
  ///
  /// Because the probe writes to the storage, the API key needs the
  /// `files:create` permission, not only `files:read`.
  ///
  /// This is the API-side twin of the Hub's `hub.files.testFilesIntegration`
  /// (`POST /{version}/files/integrations/test`), which tries credentials
  /// *before* they are saved. Same name, different client, different route.
  Future<Object?> testFilesIntegration(
      {required Object filesIntegrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/{filesIntegrationId}/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'filesIntegrationId': filesIntegrationId},
    );
  }

  /// `GET /{version}/files/public/{PublicId}/{Name*}`
  ///
  /// Reads a file somebody made public from the Hub side ([makeFilePublic] /
  /// [makeFolderPublic]).
  ///
  /// **No sign-in.** This is the one call in the SDK that deliberately goes
  /// out with no credentials, because the link has to work in an e-mail, in
  /// an `<img src>`, or in a browser on a stranger's phone. The unguessable
  /// `nbpf_…` id is the whole credential.
  ///
  /// Answers with the file's raw bytes. When the storage provider can sign
  /// its own links (Amazon S3, Azure Blob, Google Cloud Storage) the gateway
  /// replies `302` and the HTTP client follows it, so the bytes come straight
  /// from the provider and never pass through Norbix.
  ///
  /// Every miss — unknown id, wrong name, made private again, file gone — is
  /// the same plain `404`. That is deliberate: a more precise answer would
  /// tell a stranger that the file exists.
  ///
  /// [name] is the file's name for a file link, or the path inside the folder
  /// for a folder link (`2026/q1/report.pdf`); its slashes stay slashes.
  Future<List<int>> getPublicFile({
    required Object publicId,
    required Object name,
    Map<String, Object?>? query,
    Map<String, String>? headers,
  }) {
    return transport.sendBytes(
      route: '/{version}/files/public/{PublicId}/{Name*}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'PublicId': publicId, 'Name': name},
      authenticated: false,
    );
  }

}
