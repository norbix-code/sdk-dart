// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Account projects: CRUD, settings, notifications, tokens.
class ProjectsResource extends Resource {
  ProjectsResource(super.transport);

  /// `POST /{version}/account/projects`
  Future<Object?> createProject({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/account/projects/{projectId}/notifications/settings/group`
  Future<Object?> deleteNotificationsGroup({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/notifications/settings/group',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `DELETE /{version}/account/projects/{projectId}/notifications/settings/tag`
  Future<Object?> deleteNotificationsTag({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/notifications/settings/tag',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `DELETE /{version}/account/projects/{projectId}`
  Future<Object?> deleteProject({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/disable`
  Future<Object?> disableProject({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/disable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/enable`
  Future<Object?> enableProject({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/enable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `GET /{version}/account/projects/{projectId}`
  Future<Object?> getProject({ required Object projectId, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `GET /{version}/account/projects/{projectId}/tokens`
  Future<Object?> getProjectTokens({ required Object projectId, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/tokens',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `GET /{version}/account/projects`
  Future<Object?> getProjects({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/account/projects/{projectId}/notifications/settings/group/tag`
  Future<Object?> removeTagFromNotificationsGroup({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/notifications/settings/group/tag',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `POST /{version}/account/projects/{projectId}/notifications/settings/group`
  Future<Object?> saveNotificationsGroup({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/notifications/settings/group',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `POST /{version}/account/projects/{projectId}/notifications/settings/tag`
  Future<Object?> saveNotificationsTag({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/notifications/settings/tag',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/accent-color`
  Future<Object?> updateProjectAccentColor({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/accent-color',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/origins`
  Future<Object?> updateProjectAllowedOrigins({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/origins',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/default-language`
  Future<Object?> updateProjectDefaultLanguage({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/default-language',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/description`
  Future<Object?> updateProjectDescription({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/description',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/icon`
  Future<Object?> updateProjectIcon({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/icon',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/languages`
  Future<Object?> updateProjectLanguages({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/languages',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/logo`
  Future<Object?> updateProjectLogo({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/logo',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/main-color`
  Future<Object?> updateProjectMainColor({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/main-color',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/name`
  Future<Object?> updateProjectName({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/name',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/regions`
  Future<Object?> updateProjectRegions({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/regions',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }

  /// `PATCH /{version}/account/projects/{projectId}/settings/url`
  Future<Object?> updateProjectUrl({ required Object projectId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/account/projects/{projectId}/settings/url',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'projectId': projectId},
    );
  }
}
