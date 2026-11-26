// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Authentication: API keys, access tokens, OAuth providers.
class AuthResource extends Resource {
  AuthResource(super.transport);

  /// `GET /auth`
  Future<Object?> authenticate(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/auth',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /auth/{provider}`
  Future<Object?> authenticate2(
      {required Object provider,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/auth/{provider}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'provider': provider},
    );
  }

  /// `GET /access-token`
  Future<Object?> getAccessToken(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/access-token',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /auth` — signs a project user in with a password.
  ///
  /// Sends `provider: 'credentials'`, [userName], [password] and
  /// [rememberMe]. With [rememberMe] false (the default) the session lives a
  /// sliding 12 hours; with true a sliding 30 days; never more than 90 days
  /// from sign-in. While the token is used the server renews it (see
  /// `NorbixConfig.onSessionToken`).
  ///
  /// The call carries no API key and no bearer token. When the answer has a
  /// `bearerToken`, the client stores it and uses it for every later call.
  /// Answers the gateway's `AuthenticateResponse` (`bearerToken`, `userId`,
  /// …). Set the project first (`projectId` / `setProjectId`).
  Future<Object?> signIn({
    required String userName,
    required String password,
    bool rememberMe = false,
    Map<String, String>? headers,
  }) async {
    final answer = await transport.send(
      route: '/auth',
      method: 'POST',
      body: <String, Object?>{
        'provider': 'credentials',
        'userName': userName,
        'password': password,
        'rememberMe': rememberMe,
      },
      headers: headers,
      authenticated: false,
    );
    if (answer is Map) {
      final token = answer['bearerToken'];
      if (token is String && token.isNotEmpty) {
        transport.config = transport.config.copyWith(bearerToken: token);
      }
    }
    return answer;
  }
}
