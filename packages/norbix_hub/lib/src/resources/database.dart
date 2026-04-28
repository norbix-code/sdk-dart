// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Database schemas, taxonomies, aggregates, integrations, schema triggers.
class DatabaseResource extends Resource {
  DatabaseResource(super.transport);

  /// `DELETE /{version}/database/aggregates/{id}`
  Future<Object?> deleteDatabaseAggregate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/aggregates/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/database/integrations/{id}`
  Future<Object?> deleteDatabaseIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/database/schemas/{id}`
  Future<Object?> deleteDatabaseSchema({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/database/taxonomies/{id}`
  Future<Object?> deleteDatabaseTaxonomy({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/database/taxonomies/{taxonomyId}/terms/{id}`
  Future<Object?> deleteDatabaseTaxonomyTerm({ required Object taxonomyId, required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyId}/terms/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyId': taxonomyId, 'id': id},
    );
  }

  /// `DELETE /{version}/database/taxonomies/{taxonomyId}/terms/many`
  Future<Object?> deleteManyDatabaseTaxonomyTerms({ required Object taxonomyId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyId}/terms/many',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyId': taxonomyId},
    );
  }

  /// `DELETE /{version}/database/schemas/triggers/{triggerId}`
  Future<Object?> deleteSchemaTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers/{triggerId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/database/disable`
  Future<Object?> disableDatabase({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/database/integrations/{id}/disable`
  Future<Object?> disableDatabaseIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/database/schemas/triggers/{triggerId}/disable`
  Future<Object?> disableSchemaTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers/{triggerId}/disable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `DELETE /{version}/database/schemas/{id}/draft`
  Future<Object?> discardDatabaseSchemaDraft({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/draft',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/enable`
  Future<Object?> enableDatabase({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/database/integrations/{id}/enable`
  Future<Object?> enableDatabaseIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/database/schemas/triggers/{triggerId}/enable`
  Future<Object?> enableSchemaTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers/{triggerId}/enable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/database/aggregates/{id}`
  Future<Object?> getDatabaseAggregate({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/aggregates/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/aggregates`
  Future<Object?> getDatabaseAggregates({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/aggregates',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/database/integrations/{id}`
  Future<Object?> getDatabaseIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/integrations`
  Future<Object?> getDatabaseIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/database/schemas/{id}`
  Future<Object?> getDatabaseSchema({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas/{id}/draft`
  Future<Object?> getDatabaseSchemaDraft({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/draft',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas/{id}/versions/diff`
  Future<Object?> getDatabaseSchemaVersionDiff({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/versions/diff',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas/{id}/versions`
  Future<Object?> getDatabaseSchemaVersions({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/versions',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas`
  Future<Object?> getDatabaseSchemas({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/database/taxonomies`
  Future<Object?> getDatabaseTaxonomies({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/database/taxonomies/{id}`
  Future<Object?> getDatabaseTaxonomy({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/taxonomies/{taxonomyId}/terms/{id}`
  Future<Object?> getDatabaseTaxonomyTerm({ required Object taxonomyId, required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyId}/terms/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyId': taxonomyId, 'id': id},
    );
  }

  /// `GET /{version}/database/schemas/triggers/{id}`
  Future<Object?> getSchemaTrigger({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas/triggers`
  Future<Object?> getSchemaTriggers({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/schemas/{id}/publish`
  Future<Object?> publishDatabaseSchema({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/publish',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/database/schemas/{id}/rename`
  Future<Object?> renameDatabaseSchema({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/rename',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/database/aggregates`
  Future<Object?> saveDatabaseAggregate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/aggregates',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/integrations`
  Future<Object?> saveDatabaseIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/schemas`
  Future<Object?> saveDatabaseSchema({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/taxonomies`
  Future<Object?> saveDatabaseTaxonomy({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/taxonomies/{taxonomyId}/terms`
  Future<Object?> saveDatabaseTaxonomyTerm({ required Object taxonomyId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyId}/terms',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyId': taxonomyId},
    );
  }

  /// `POST /{version}/database/schemas/triggers`
  Future<Object?> saveSchemaTrigger({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/triggers',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/database/integrations/{id}/default`
  Future<Object?> setDatabaseIntegrationAsDefault({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/database/aggregates/test`
  Future<Object?> testDatabaseAggregate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/aggregates/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/database/schemas/{id}/draft`
  Future<Object?> updateDatabaseSchemaDraft({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/draft',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/database/schemas/{id}/settings`
  Future<Object?> updateDatabaseSchemaSettings({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/schemas/{id}/settings',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/database/taxonomies/{taxonomyId}/terms/{id}`
  Future<Object?> updateDatabaseTaxonomyTerm({ required Object taxonomyId, required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyId}/terms/{id}',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyId': taxonomyId, 'id': id},
    );
  }
}
