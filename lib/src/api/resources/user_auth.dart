// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// End-user authentication: passkeys, email verification, recovery and tokens.
class UserAuthResource extends Resource {
  UserAuthResource(super.transport);

  /// `POST /{version}/membership/userauth/email/confirm-verification`
  Future<Object?> confirmEmailVerification(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/email/confirm-verification',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/recovery/magic-link/consume`
  Future<Object?> consumeMagicLink(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/recovery/magic-link/consume',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/has-passkey`
  Future<Object?> hasPasskey(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/has-passkey',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/userauth/passkeys`
  Future<Object?> listPasskeys(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkeys',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkey/authentication-options`
  Future<Object?> passkeyAuthenticationOptions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkey/authentication-options',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/logout`
  Future<Object?> passkeyLogout(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/logout',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkey/registration-options`
  Future<Object?> passkeyRegistrationOptions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkey/registration-options',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/token/refresh`
  Future<Object?> refreshPasskeyToken(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/token/refresh',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkeys/{credentialId}/rename`
  Future<Object?> renamePasskey(
      {required Object credentialId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkeys/{credentialId}/rename',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'credentialId': credentialId},
    );
  }

  /// `POST /{version}/membership/userauth/recovery/magic-link/request`
  Future<Object?> requestMagicLink(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/recovery/magic-link/request',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkeys/{credentialId}/revoke`
  Future<Object?> revokePasskey(
      {required Object credentialId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkeys/{credentialId}/revoke',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'credentialId': credentialId},
    );
  }

  /// `POST /{version}/membership/userauth/email/start-verification`
  Future<Object?> startEmailVerification(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/email/start-verification',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/recovery/use-code`
  Future<Object?> useRecoveryCode(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/recovery/use-code',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkey/verify-authentication`
  Future<Object?> verifyPasskeyAuthentication(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkey/verify-authentication',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/passkey/verify-registration`
  Future<Object?> verifyPasskeyRegistration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/passkey/verify-registration',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/password/change`
  Future<Object?> changePassword(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/password/change',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/password/reset/request`
  Future<Object?> requestPasswordReset(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/password/reset/request',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/userauth/password/reset/confirm`
  Future<Object?> confirmPasswordReset(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/userauth/password/reset/confirm',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
