// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Membership integrations, roles, policies, triggers.
class MembershipResource extends Resource {
  MembershipResource(super.transport);

  /// `POST /{version}/membership/policies`
  Future<Object?> createPolicy({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/policies',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/roles`
  Future<Object?> createRole({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/roles',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/membership/integrations/{id}`
  Future<Object?> deleteMembershipIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/membership/triggers/{triggerId}`
  Future<Object?> deleteMembershipTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers/{triggerId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `DELETE /{version}/membership/policies`
  Future<Object?> deletePolicy({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/policies',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/membership/roles`
  Future<Object?> deleteRole({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/roles',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/disable`
  Future<Object?> disableMembership({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/integrations/{id}/disable`
  Future<Object?> disableMembershipIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/membership/triggers/{triggerId}/disable`
  Future<Object?> disableMembershipTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers/{triggerId}/disable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/membership/enable`
  Future<Object?> enableMembership({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/integrations/{id}/enable`
  Future<Object?> enableMembershipIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PATCH /{version}/membership/triggers/{triggerId}/enable`
  Future<Object?> enableMembershipTrigger({ required Object triggerId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers/{triggerId}/enable',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'triggerId': triggerId},
    );
  }

  /// `GET /{version}/membership/integrations/{id}`
  Future<Object?> getMembershipIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/integrations`
  Future<Object?> getMembershipIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/triggers/{id}`
  Future<Object?> getMembershipTrigger({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/triggers`
  Future<Object?> getMembershipTriggers({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/policies`
  Future<Object?> getPolicies({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/policies',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/policies/{id}`
  Future<Object?> getPolicy({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/policies/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/roles/{id}`
  Future<Object?> getRole({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/roles/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/roles`
  Future<Object?> getRoles({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/roles',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/integrations`
  Future<Object?> saveMembershipIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/triggers`
  Future<Object?> saveMembershipTrigger({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/triggers',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/integrations/{id}/default`
  Future<Object?> setMembershipIntegrationAsDefault({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/membership/policies`
  Future<Object?> updatePolicy({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/policies',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PATCH /{version}/membership/roles`
  Future<Object?> updateRolePolicies({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/roles',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
