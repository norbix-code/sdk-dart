// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// File storage integrations and triggers.
class FilesResource extends Resource {
  FilesResource(super.transport);

  /// `DELETE /{version}/files/integrations/{Id}`
  Future<Object?> deleteFilesIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `DELETE /{version}/files/triggers/{triggerId}`
  Future<Object?> deleteFilesTrigger(
      {required Object triggerId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
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
  Future<Object?> disableFiles(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{Id}/disable`
  Future<Object?> disableFilesIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/{Id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `PATCH /{version}/files/triggers/{triggerId}/disable`
  Future<Object?> disableFilesTrigger(
      {required Object triggerId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
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
  Future<Object?> enableFiles(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{Id}/enable`
  Future<Object?> enableFilesIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/{Id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `PATCH /{version}/files/triggers/{triggerId}/enable`
  Future<Object?> enableFilesTrigger(
      {required Object triggerId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/triggers/{triggerId}/enable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/files/item`
  Future<Object?> getFile(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/item',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/files/integrations/{id}`
  Future<Object?> getFilesIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/files/integrations`
  Future<Object?> getFilesIntegrations(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/files/triggers/{id}`
  Future<Object?> getFilesTrigger(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/triggers/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/files/triggers`
  Future<Object?> getFilesTriggers(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/triggers',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/files/folder`
  Future<Object?> getFolderFiles(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/folder',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/integrations`
  Future<Object?> saveFilesIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
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
  Future<Object?> saveFilesTrigger(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/triggers',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/files/integrations/{Id}/default`
  Future<Object?> setFilesIntegrationAsDefault(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/{Id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/files/integrations/test`
  ///
  /// Tries the credentials of a files integration against the storage
  /// provider and answers whether they work. Nothing is saved — call it
  /// before [saveFilesIntegration] to tell a bad key from a bad bucket.
  Future<Object?> testFilesIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/item/public`
  ///
  /// Makes one file readable by anyone holding its link. Answers with the
  /// `nbpf_…` public id; the link itself arrives on the file's `publicUrl`
  /// the next time you read the file. Send `filesIntegrationId` and `path`
  /// in [body].
  Future<Object?> makeFilePublic(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/item/public',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/item/private`
  ///
  /// Takes a file's public link away. It is refused while a folder above the
  /// file is public — switch the folder off with [makeFolderPrivate] instead.
  Future<Object?> makeFilePrivate(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/item/private',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/folder/public`
  ///
  /// Publishes a whole folder prefix — one record, however many files sit
  /// under it, at any depth. The root cannot be published.
  Future<Object?> makeFolderPublic(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/folder/public',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/files/folder/private`
  ///
  /// Takes back every link inside the folder, including per-file ones.
  Future<Object?> makeFolderPrivate(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/files/folder/private',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

}
