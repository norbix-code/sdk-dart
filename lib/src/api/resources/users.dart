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

  /// `POST /{version}/membership/auth/{UserId}/link-identity`
  ///
  /// Finishes a link as the same signed-in user who started it. Body:
  /// `{'code': …}`, the one-time link code from the return page.
  Future<Object?> linkIdentity(
      {required Object userId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{UserId}/link-identity',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'UserId': userId},
    );
  }

  /// `POST /{version}/membership/auth/{UserId}/link-identity/start`
  ///
  /// Starts linking a social provider to the signed-in user (yourself only).
  /// Body: `{'provider': …, 'mode'?: …, 'returnUrl'?: …}`. Answers
  /// `{'authorizeUrl': …}`; send the browser there.
  Future<Object?> startLinkIdentity(
      {required Object userId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/{UserId}/link-identity/start',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'UserId': userId},
    );
  }

  /// `POST /{version}/membership/auth/social/{Provider}/exchange`
  ///
  /// Trades the one-time code from the social sign-in return page (2
  /// minutes, once) for the project JWT. Body: `{'code': …}`. Answers
  /// `bearerToken`, `userId`, `displayName`, `expiresAt`,
  /// `meta.credentialVersion`. Sends no credentials: the gateway judges any
  /// token it gets, even here, and refuses an old one.
  Future<Object?> exchangeSocialSignInCode(
      {required Object provider,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/auth/social/{Provider}/exchange',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Provider': provider},
      authenticated: false,
    );
  }

  /// The URL that starts a project social sign-in:
  /// `GET {api}/{version}/membership/auth/social/{provider}?projectId=…[&env=…][&mode=…][&returnUrl=…]`.
  ///
  /// Not a call: open it in the system browser (ASWebAuthenticationSession /
  /// Custom Tabs, not an embedded web view) and the gateway redirects to the
  /// provider. A navigation carries no headers, so the project id and a
  /// non-PROD env travel in the query. [provider]: google, apple, microsoft,
  /// github, facebook, x or okta. [mode]: the integration's OAuth mode
  /// (default: the only one, else the first by name). [returnUrl]: the page
  /// to come back to — absolute https (http only on localhost), origin in the
  /// project's allowed origins. It gets `?code=…&provider=…` (or `?error=…`);
  /// trade the code with [exchangeSocialSignInCode] within 2 minutes.
  ///
  /// Hand-written: the start route answers a 302, so it has no call method.
  Uri socialSignInUrl(String provider, {String? mode, String? returnUrl}) {
    return transport.navigationUrl(
      route: '/{version}/membership/auth/social/{provider}',
      pathParams: <String, Object?>{'provider': provider},
      query: <String, Object?>{'mode': mode, 'returnUrl': returnUrl},
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
