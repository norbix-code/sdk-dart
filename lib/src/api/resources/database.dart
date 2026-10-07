// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/expanded_reference.dart' show ExpandedReference;
import '../../core/record_requests.dart';
import '../../core/resource.dart';

/// Project database: collection CRUD, aggregates, schemas and taxonomy terms.
class DatabaseResource extends Resource {
  DatabaseResource(super.transport);

  /// `POST /{version}/database/collections/{collectionName}/aggregate`
  Future<Object?> aggregate(
      {required Object collectionName,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/aggregate',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `PUT /{version}/database/collections/{collectionName}/{id}/responsibility`
  Future<Object?> changeResponsibility(
      {required Object collectionName,
      required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/database/collections/{collectionName}/{id}/responsibility',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName, 'id': id},
    );
  }

  /// `GET /{version}/database/collections/{collectionName}/count`
  Future<Object?> count(
      {required Object collectionName,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/count',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `DELETE /{version}/database/collections/{collectionName}/many`
  Future<Object?> deleteMany(
      {required Object collectionName,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/many',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `DELETE /{version}/database/collections/{collectionName}/{id}`
  Future<Object?> deleteOne(
      {required Object collectionName,
      required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName, 'id': id},
    );
  }

  /// `GET /{version}/database/collections/{collectionName}/distinct`
  Future<Object?> distinct(
      {required Object collectionName,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/distinct',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `POST /{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute`
  Future<Object?> executeAggregate(
      {required Object collectionName,
      required Object aggregateId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'collectionName': collectionName,
        'aggregateId': aggregateId
      },
    );
  }

  /// `GET /{version}/database/collections/{collectionName}`
  ///
  /// [expandReferences] — set true to get every reference value as
  /// `{ id, display }` (see [ExpandedReference]); left unset, the stored ids
  /// come back as before. Needs read permission on every source the schema
  /// links to, else the read is refused with `CM-ERRORS-DATABASE-056`.
  Future<Object?> find(
      {required Object collectionName,
      Map<String, Object?>? query,
      bool? expandReferences,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}',
      method: 'GET',
      query: withExpandReferences(query, expandReferences),
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `GET /{version}/database/collections/{collectionName}/{id}`
  ///
  /// [expandReferences] — set true to get every reference value as
  /// `{ id, display }` (see [ExpandedReference]); left unset, the stored ids
  /// come back as before. Needs read permission on every source the schema
  /// links to, else the read is refused with `CM-ERRORS-DATABASE-056`.
  Future<Object?> findOne(
      {required Object collectionName,
      required Object id,
      Map<String, Object?>? query,
      bool? expandReferences,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/{id}',
      method: 'GET',
      query: withExpandReferences(query, expandReferences),
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName, 'id': id},
    );
  }

  /// `GET /{version}/database/taxonomies/{taxonomyName}/terms`
  Future<Object?> findTerms(
      {required Object taxonomyName,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyName}/terms',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyName': taxonomyName},
    );
  }

  /// `GET /{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children`
  Future<Object?> findTermsChildren(
      {required Object taxonomyName,
      required Object parentId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{
        'taxonomyName': taxonomyName,
        'parentId': parentId
      },
    );
  }

  /// `GET /{version}/database/taxonomies/{taxonomyName}/terms/tree`
  Future<Object?> findTermTree(
      {required Object taxonomyName,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyName}/terms/tree',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyName': taxonomyName},
    );
  }

  /// `GET /{version}/database/taxonomies/tree`
  Future<Object?> findTaxonomyTree(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/taxonomies/tree',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/database/schemas/{id}`
  Future<Object?> getDatabaseSchema(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/schemas/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/database/schemas`
  Future<Object?> getDatabaseSchemas(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/schemas',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/database/collections/{collectionName}/many`
  Future<Object?> insertMany(
      {required Object collectionName,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/many',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `POST /{version}/database/collections/{collectionName}`
  Future<Object?> insertOne(
      {required Object collectionName,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `PUT /{version}/database/collections/{collectionName}/{id}/replace`
  Future<Object?> replaceOne(
      {required Object collectionName,
      required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/{id}/replace',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName, 'id': id},
    );
  }

  /// `PUT /{version}/database/collections/{collectionName}/many`
  ///
  /// [arrayFilters] — MongoDB `arrayFilters` for `$[name]` paths in the
  /// update (`{"lines.$[line].qty": 3}` with `[{'line.sku': 'A-1'}]`): a
  /// list of filter documents, encoded to the JSON string the gateway reads,
  /// or that string itself. Added to the map [body] as `arrayFilters`.
  Future<Object?> updateMany(
      {required Object collectionName,
      Map<String, Object?>? query,
      Object? body,
      Object? arrayFilters,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/many',
      method: 'PUT',
      query: query,
      body: withArrayFilters(body, arrayFilters),
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `PUT /{version}/database/collections/{collectionName}/{id}`
  ///
  /// [arrayFilters] — MongoDB `arrayFilters` for `$[name]` paths in the
  /// update (`{"lines.$[line].qty": 3}` with `[{'line.sku': 'A-1'}]`): a
  /// list of filter documents, encoded to the JSON string the gateway reads,
  /// or that string itself. Added to the map [body] as `arrayFilters`.
  Future<Object?> updateOne(
      {required Object collectionName,
      required Object id,
      Map<String, Object?>? query,
      Object? body,
      Object? arrayFilters,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/{id}',
      method: 'PUT',
      query: query,
      body: withArrayFilters(body, arrayFilters),
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName, 'id': id},
    );
  }

  /// `GET /{version}/database/collections/{collectionName}/own`
  ///
  /// [expandReferences] — set true to get every reference value as
  /// `{ id, display }` (see [ExpandedReference]); left unset, the stored ids
  /// come back as before. Needs read permission on every source the schema
  /// links to, else the read is refused with `CM-ERRORS-DATABASE-056`.
  Future<Object?> findOwn(
      {required Object collectionName,
      Map<String, Object?>? query,
      bool? expandReferences,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/collections/{collectionName}/own',
      method: 'GET',
      query: withExpandReferences(query, expandReferences),
      headers: headers,
      pathParams: <String, Object?>{'collectionName': collectionName},
    );
  }

  /// `GET /{version}/database/taxonomies/{taxonomyName}/merged-tree`
  Future<Object?> findMergedTermTree(
      {required Object taxonomyName,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/database/taxonomies/{taxonomyName}/merged-tree',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'taxonomyName': taxonomyName},
    );
  }
}
