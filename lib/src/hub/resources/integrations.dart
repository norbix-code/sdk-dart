// Hand-written: tool/generate_resources.py (named in the Makefile) is in no
// checkout, so this resource follows the generated ones by hand.

import '../../core/resource.dart';

/// Helpers shared by the integrations of every module: keyless setup and
/// saved secrets.
class IntegrationsResource extends Resource {
  IntegrationsResource(super.transport);

  /// `GET /{version}/integrations/keyless/setup`
  ///
  /// What a developer needs before saving a keyless cloud integration.
  /// Query: `module` (files, email or code), `cloud` (azure, aws or google),
  /// optional `integrationId` (an existing integration). The answer carries
  /// `integrationId` (save with it), `env`, `module`, `cloud`, `issuer`,
  /// `subject`, `audience`, `available` (with `unavailableReason` when
  /// false) and the cloud setup `script`.
  /// `templates`: ready CloudFormation / Bicep / Terraform files for this
  /// integration (a list of `{kind, fileName, content}` maps).
  Future<Object?> getKeylessIntegrationSetup(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/integrations/keyless/setup',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/integrations/{IntegrationId}/secrets`
  ///
  /// Which secrets of an integration (any module) are saved and which are
  /// optional — never a value or any part of one. The answer's `result` is a
  /// list of `{key, field, isSet, isOptional}` maps (`field` is the save
  /// request property that fills the key). Empty for keyless and
  /// Norbix-owned integrations and for MCP, Marketplace and Webhook
  /// integrations. Query: optional `env`.
  Future<Object?> getIntegrationSecrets(
      {required Object integrationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/integrations/{IntegrationId}/secrets',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationId': integrationId},
    );
  }

  /// `POST /{version}/integrations/{IntegrationId}/secrets/remove`
  ///
  /// Removes optional secrets: body `{keys: [...]}` (as
  /// [getIntegrationSecrets] lists them; optional `env`). A key the
  /// integration needs is refused with `CM-ERRORS-SECRETS-012` (400) and
  /// nothing is written. Answer: `id`.
  Future<Object?> removeIntegrationSecrets(
      {required Object integrationId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/integrations/{IntegrationId}/secrets/remove',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationId': integrationId},
    );
  }
}
