// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Account profile, team, licenses, regions, status, Stripe billing.
class AccountsResource extends Resource {
  AccountsResource(super.transport);

  /// `POST /{version}/account`
  Future<Object?> createAccount(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/stripe/create-checkout-session`
  Future<Object?> createStripeCheckoutSession(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/stripe/create-checkout-session',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/team/member`
  Future<Object?> createTeamMemberFromInvitation(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/team/member',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/collaborators`
  Future<Object?> getAccountCollaborators(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/collaborators',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/profile`
  Future<Object?> getAccountProfile(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/profile',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/regions`
  ///
  /// Lists the Norbix regions available to the account. The response carries
  /// `items`, each with `id` (the region code, e.g. "nb-eu-germany") and
  /// optional `continent` and `name`.
  ///
  /// To make requests *target* a given region, set `region` on the client
  /// (`NorbixHub(region: 'nb-eu-germany')` or `client.setRegion(...)`) or per
  /// call (the `region` argument), which sends the `nb-region` header.
  Future<Object?> getAccountRegions(
      {Map<String, Object?>? query,
      Map<String, String>? headers,
      String? region}) {
    return transport.send(
      route: '/{version}/account/regions',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
      region: region,
    );
  }

  /// `GET /{version}/account/status`
  Future<Object?> getAccountStatus(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/status',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/licenses`
  Future<Object?> getLicenses(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/licenses',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/stripe/get-portal-url`
  Future<Object?> getStripeBillingPortalUrl(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/stripe/get-portal-url',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/payments/stripe/webhook`
  Future<Object?> receiveStripeWebHook(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/payments/stripe/webhook',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/verify/resend`
  Future<Object?> resendAccountVerificationToken(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/verify/resend',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/team/member/invite`
  Future<Object?> sendInviteToTeamMember(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/team/member/invite',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/account/profile`
  Future<Object?> updateAccountProfile(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/profile',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/verify`
  Future<Object?> verifyAccount(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/verify',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/mcp`
  ///
  /// Developer MCP endpoint (Streamable HTTP, MCP revision 2025-11-25): send one JSON-RPC 2.0 message as [body] (`initialize`, `tools/list`, `tools/call`, ...). Pass the `mcp-session-id` header after `initialize`, and `accept: application/json, text/event-stream`. The answer is parsed JSON, or the raw SSE text when the server streams. An AI service user key (`nbsu_...`) narrows the tools to its scope; `query: {'toolsets': 'ai:campaigns'}` filters `tools/list`.
  Future<Object?> sendMcpMessage(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/mcp',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/mcp`
  ///
  /// Open the server-to-client SSE stream of an MCP session (`mcp-session-id` header; `last-event-id` resumes). This SDK has no SSE client: the future completes only when the server closes the stream, with the raw SSE text.
  Future<Object?> openMcpStream(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/mcp',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/account/mcp`
  ///
  /// End the MCP session named by the `mcp-session-id` header.
  Future<Object?> endMcpSession(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/mcp',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/ai/service-users`
  ///
  /// Create an AI service user (a scoped key for MCP and AI tools). Body: `{'name': '...', 'scope': {...}}`. The answer holds the key once — store it.
  Future<Object?> createAiServiceUser(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/ai/service-users',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/account/ai/service-users`
  ///
  /// List the account's AI service users and their keys (no secrets).
  Future<Object?> listAiServiceUsers(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/ai/service-users',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/account/ai/service-users/{Id}/keys`
  ///
  /// Issue a new key for the service user. Body may carry `{'revokeKeyId': '...'}` to revoke an old key in the same call.
  Future<Object?> rotateAiServiceUserKey(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/ai/service-users/{Id}/keys',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `DELETE /{version}/account/ai/service-users/{Id}/keys/{KeyId}`
  ///
  /// Revoke one key of the service user.
  Future<Object?> revokeAiServiceUserKey(
      {required Object id,
      required Object keyId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/ai/service-users/{Id}/keys/{KeyId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id, 'KeyId': keyId},
    );
  }

  /// `DELETE /{version}/account/ai/service-users/{Id}`
  ///
  /// Delete the service user and all its keys.
  Future<Object?> deleteAiServiceUser(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/account/ai/service-users/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }
}
