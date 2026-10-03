import '../../core/resource.dart';

/// Public project routes on the API host — no sign-in needed. The admin
/// portal reads them before anyone signs in; safety is the answer's shape and
/// the project's own opt-in flags, not the caller's credentials. Like the
/// public file link, these calls go out with no credentials at all
/// (`authenticated: false`), even when the client has a key.
class PublicProjectsResource extends Resource {
  PublicProjectsResource(super.transport);

  /// `GET /{version}/public/projects/{ProjectId}/config`
  ///
  /// The project's public, non-sensitive config for the admin portal: display name, brand, social providers, passkey, and — only when the project opts in — sign-in methods and password policy. No sign-in needed.
  Future<Object?> getPublicProjectConfig(
      {required Object projectId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/public/projects/{ProjectId}/config',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'ProjectId': projectId},
      authenticated: false,
    );
  }

  /// `GET /{version}/public/projects/{ProjectId}/legal/{Kind}`
  ///
  /// One public legal document; [kind] is `terms` or `privacy`. When the project does not expose it, the answer has `available: false` — it never says why.
  Future<Object?> getPublicProjectLegal(
      {required Object projectId,
      required Object kind,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/public/projects/{ProjectId}/legal/{Kind}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'ProjectId': projectId, 'Kind': kind},
      authenticated: false,
    );
  }
}
