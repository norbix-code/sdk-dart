// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Project membership users (create, list, block, invite, register variants).
class UsersResource extends Resource {
  UsersResource(super.transport);

  /// `PUT /{version}/membership/users/assign-roles`
  Future<Object?> assignRolePermissions({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/assign-roles',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PATCH /{version}/membership/users/block`
  Future<Object?> blockUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/block',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/membership/users`
  Future<Object?> deleteUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/users/{id}`
  Future<Object?> getUser({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/users`
  Future<Object?> getUsers({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/invite`
  Future<Object?> inviteUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/invite',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/email`
  Future<Object?> saveEmailUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/email',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/email-with-permissions`
  Future<Object?> saveEmailUserNameWithPermissions({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/email-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/guest`
  Future<Object?> saveGuestUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/guest',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/phone`
  Future<Object?> savePhoneUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/phone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/phone-with-permissions`
  Future<Object?> savePhoneUserNameWithPermissions({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/phone-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/service`
  Future<Object?> saveSystemUserWithPermissions({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/service',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/user-name`
  Future<Object?> saveUserNameUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/user-name',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/register/user-name-with-permissions`
  Future<Object?> saveUserNameWithPermissions({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/register/user-name-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PATCH /{version}/membership/users/unblock`
  Future<Object?> unblockUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users/unblock',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/users`
  Future<Object?> updateUser({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/membership/users',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
