// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project membership users (create, list, block, invite, register variants).
class UsersResource extends Resource {
  UsersResource(super.transport);

  /// `PUT /{version}/membership/auth/assign-roles`
  Future<Object?> assignRolePermissions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/assign-roles',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PATCH /{version}/membership/auth/block`
  Future<Object?> blockUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/block',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/membership/auth`
  Future<Object?> deleteUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/auth/{id}`
  Future<Object?> getUser(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/auth/{id}/preferences`
  Future<Object?> getUserPreferences(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{id}/preferences',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/membership/auth`
  Future<Object?> getUsers(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/invite`
  Future<Object?> inviteUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/invite',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/{userId}/link-identity`
  Future<Object?> linkIdentity(
      {required Object userId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{userId}/link-identity',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'userId': userId},
    );
  }

  /// `POST /{version}/membership/auth/register/email`
  Future<Object?> saveEmailUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/email',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/email-with-permissions`
  Future<Object?> saveEmailUserNameWithPermissions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/email-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/guest`
  Future<Object?> saveGuestUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/guest',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/phone`
  Future<Object?> savePhoneUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/phone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/phone-with-permissions`
  Future<Object?> savePhoneUserNameWithPermissions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/phone-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/service`
  Future<Object?> saveSystemUserWithPermissions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/service',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/user-name`
  Future<Object?> saveUserNameUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/user-name',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/auth/register/user-name-with-permissions`
  Future<Object?> saveUserNameWithPermissions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/register/user-name-with-permissions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PATCH /{version}/membership/auth/unblock`
  Future<Object?> unblockUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/unblock',
      method: 'PATCH',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/auth`
  Future<Object?> updateUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/membership/auth/{id}/preferences`
  Future<Object?> updateUserPreferences(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{id}/preferences',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/membership/users/{userId}/map-auth`
  Future<Object?> mapAuthToUser(
      {required Object userId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{userId}/map-auth',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'userId': userId},
    );
  }

  /// `PUT /{version}/membership/users/{userId}/roles`
  Future<Object?> setContactRoles(
      {required Object userId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{userId}/roles',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'userId': userId},
    );
  }

  /// `POST /{version}/membership/users/{contactId}/marketing-state/{channel}/consent`
  Future<Object?> grantContactConsent(
      {required Object contactId,
      required Object channel,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/membership/users/{contactId}/marketing-state/{channel}/consent',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'channel': channel},
    );
  }

  /// `POST /{version}/membership/users/{contactId}/marketing-state/{channel}/unsubscribe`
  Future<Object?> unsubscribeContact(
      {required Object contactId,
      required Object channel,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/membership/users/{contactId}/marketing-state/{channel}/unsubscribe',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'channel': channel},
    );
  }

  /// `PUT /{version}/membership/users/{contactId}/marketing-state/{commChannel}/{channel}/tags/{tag}`
  Future<Object?> setContactTagSubscription(
      {required Object contactId,
      required Object commChannel,
      required Object channel,
      required Object tag,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/membership/users/{contactId}/marketing-state/{commChannel}/{channel}/tags/{tag}',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'contactId': contactId,
        'commChannel': commChannel,
        'channel': channel,
        'tag': tag,
      },
    );
  }
}
