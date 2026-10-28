// Hand-written: tool/generate_resources.py (named in the Makefile) is in no
// checkout, so this resource follows the generated ones by hand.

import '../../core/resource.dart';

/// Helpers shared by the integrations of every module (files, email, code).
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
}
