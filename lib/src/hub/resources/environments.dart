// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project environments: list, create, and delete the named environments a
/// project owns (PROD plus any TEST/STAGING/… the user adds).
///
/// These endpoints manage the *set* of environments. To make requests *inside*
/// a given environment, set `env` on the client (`NorbixHub(env: 'TEST')` or
/// `client.setEnv('TEST')`) or per call (the `env` argument), which sends the
/// `norbix-env` header.
class EnvironmentsResource extends Resource {
  EnvironmentsResource(super.transport);

  /// `GET /{version}/account/projects/environments`
  ///
  /// Lists the project's environments. The response always includes "PROD".
  Future<Object?> getProjectEnvironments(
      {Map<String, Object?>? query,
      Map<String, String>? headers,
      String? env}) {
    return transport.send(
      route: '/{version}/account/projects/environments',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
      env: env,
    );
  }

  /// `POST /{version}/account/projects/environments`
  ///
  /// Creates a new environment. The [body] must contain `environmentName`
  /// (e.g. "TEST") and an `integration` (a database integration that seeds the
  /// new env and becomes its default).
  Future<Object?> createProjectEnvironment(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers,
      String? env}) {
    return transport.send(
      route: '/{version}/account/projects/environments',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
      env: env,
    );
  }

  /// `DELETE /{version}/account/projects/environments/{environmentName}`
  ///
  /// Deletes a non-PROD environment, cascading its integrations. PROD is
  /// rejected by the backend.
  Future<Object?> deleteProjectEnvironment(
      {Object? environmentName,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers,
      String? env}) {
    return transport.send(
      route: '/{version}/account/projects/environments/{environmentName}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'environmentName': environmentName},
      env: env,
    );
  }
}
