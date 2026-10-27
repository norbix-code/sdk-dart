// Written by hand in the generated-resource style: the generator
// (tool/generate_resources.*) is not on disk. Routes: references/hub.dtos.dart.

import '../../core/resource.dart';

/// Code integrations, the marketplace, cloud functions and workflows.
///
/// The workflow methods (`/{version}/code/workflows…`) are Beta: Workflows are
/// in beta; bugs may occur.
class CodeResource extends Resource {
  CodeResource(super.transport);

  /// `POST /{version}/code/integrations/confirm-human-delivery`
  Future<Object?> confirmCodeIntegrationHumanDelivery(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/confirm-human-delivery',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/code/integrations/{Id}`
  Future<Object?> deleteCodeIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `DELETE /{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}`
  Future<Object?> deleteMarketplaceFunction(
      {required Object integrationViewId,
      required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'IntegrationViewId': integrationViewId,
        'FunctionViewId': functionViewId
      },
    );
  }

  /// `DELETE /{version}/code/marketplace/integrations/{IntegrationViewId}`
  Future<Object?> deleteMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/integrations/{IntegrationViewId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `PUT /{version}/code/disable`
  Future<Object?> disableCode(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/code/integrations/{Id}/disable`
  Future<Object?> disableCodeIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/{Id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/disable`
  Future<Object?> disableMarketplaceFunction(
      {required Object integrationViewId,
      required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/disable',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'IntegrationViewId': integrationViewId,
        'FunctionViewId': functionViewId
      },
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/disable`
  Future<Object?> disableMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/disable',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `PUT /{version}/code/enable`
  Future<Object?> enableCode(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/code/integrations/{Id}/enable`
  Future<Object?> enableCodeIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/{Id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/enable`
  Future<Object?> enableMarketplaceFunction(
      {required Object integrationViewId,
      required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/enable',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'IntegrationViewId': integrationViewId,
        'FunctionViewId': functionViewId
      },
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/enable`
  Future<Object?> enableMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/enable',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `GET /{version}/code/functions/event-sample`
  Future<Object?> getCodeFunctionEventSample(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/functions/event-sample',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/functions/qualifiers`
  Future<Object?> getCodeFunctionQualifiers(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/functions/qualifiers',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/functions/runs`
  Future<Object?> getCodeFunctionRuns(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/functions/runs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/functions`
  Future<Object?> getCodeFunctions(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/functions',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/integrations/{id}`
  Future<Object?> getCodeIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/{id}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/code/integrations`
  Future<Object?> getCodeIntegrations(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}`
  Future<Object?> getMarketplaceFunction(
      {required Object integrationViewId,
      required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'IntegrationViewId': integrationViewId,
        'FunctionViewId': functionViewId
      },
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/catalog`
  Future<Object?> getMarketplaceFunctionCatalog(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/catalog',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/tokens`
  Future<Object?> getMarketplaceFunctionTokens(
      {required Object integrationViewId,
      required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/tokens',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'IntegrationViewId': integrationViewId,
        'FunctionViewId': functionViewId
      },
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/functions`
  Future<Object?> getMarketplaceFunctions(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}`
  Future<Object?> getMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/integrations/{IntegrationViewId}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `GET /{version}/code/marketplace/integrations`
  Future<Object?> getMarketplaceIntegrations(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/integrations',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/marketplace/listings/{ListingViewId}`
  Future<Object?> getMarketplaceListing(
      {required Object listingViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/listings/{ListingViewId}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'ListingViewId': listingViewId},
    );
  }

  /// `GET /{version}/code/marketplace/listings/{ListingViewId}/functions/{FunctionKey}/tokens`
  Future<Object?> getMarketplaceListingFunctionTokens(
      {required Object listingViewId,
      required Object functionKey,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/listings/{ListingViewId}/functions/{FunctionKey}/tokens',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'ListingViewId': listingViewId,
        'FunctionKey': functionKey
      },
    );
  }

  /// `GET /{version}/code/marketplace/listings`
  Future<Object?> getMarketplaceListings(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/listings',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/code/functions/invoke`
  Future<Object?> invokeCodeFunction(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/functions/invoke',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/code/marketplace/functions/{FunctionViewId}/invoke`
  Future<Object?> invokeMarketplaceFunction(
      {required Object functionViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/functions/{FunctionViewId}/invoke',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'FunctionViewId': functionViewId},
    );
  }

  /// `GET /{version}/code/marketplace/functions/runs`
  Future<Object?> getMarketplaceFunctionRuns(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/functions/runs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/tools`
  ///
  /// The stored MCP tool catalog of a connection (route 24).
  Future<Object?> getMarketplaceIntegrationTools(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/tools',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `GET /{version}/code/marketplace/integrations/{IntegrationViewId}/access`
  ///
  /// The access matrix of a connection (route 25): roles, packages, tools and functions.
  Future<Object?> getMarketplaceIntegrationAccess(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/access',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `PUT /{version}/code/marketplace/integrations/{IntegrationViewId}/access/roles`
  ///
  /// Give a role one package (None, Viewer, FunctionsOnly, ReadOnly, FullAccess)
  /// and the Manage flag (route 26). Body: `roleId`, `package`, `manage`.
  Future<Object?> setMarketplaceIntegrationRoleAccess(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/access/roles',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/access/roles/custom`
  ///
  /// A custom access policy of the connection for one role (route 27). Body:
  /// `roleId`, `basePackage`, `tools`, `functions`, `manage`,
  /// `newPolicyForThisRoleOnly`.
  Future<Object?> saveMarketplaceIntegrationCustomAccess(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/access/roles/custom',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/oauth/start`
  ///
  /// Start the OAuth sign-in of an MCP connection (route 28). Answers
  /// `authorizeUrl` (open it in a browser), `redirectUrl` and `expiresAt`.
  Future<Object?> startMarketplaceIntegrationSignIn(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/oauth/start',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/oauth/sign-out`
  ///
  /// Sign an MCP connection out of OAuth (route 30). Answers `wasSignedIn`
  /// and `revoke` (Revoked, NoRevocationEndpoint, Failed or null).
  Future<Object?> signOutMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/oauth/sign-out',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `PUT /{version}/code/marketplace/integrations/{IntegrationViewId}/secrets`
  Future<Object?> replaceMarketplaceIntegrationSecrets(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/secrets',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/secrets/reveal`
  Future<Object?> revealMarketplaceIntegrationSecrets(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/secrets/reveal',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/integrations`
  Future<Object?> saveCodeIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/functions`
  Future<Object?> saveMarketplaceFunction(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/functions',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/marketplace/integrations`
  Future<Object?> saveMarketplaceIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/marketplace/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/code/marketplace/integrations/{IntegrationViewId}/token-mappings`
  Future<Object?> setMarketplaceIntegrationTokenMappings(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/token-mappings',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  /// `POST /{version}/code/integrations/test`
  Future<Object?> testCodeIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/code/marketplace/integrations/{IntegrationViewId}/test`
  Future<Object?> testMarketplaceIntegration(
      {required Object integrationViewId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/code/marketplace/integrations/{IntegrationViewId}/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'IntegrationViewId': integrationViewId},
    );
  }

  // Workflows (beta). Workflows are in beta; bugs may occur.

  /// Beta: `GET /{version}/code/workflows`
  ///
  /// The project's workflows. Query: `isEnabled?` and paging (`pageSize`,
  /// `startingAfter`, `endingBefore`). Answers `WorkflowsResponse`.
  Future<Object?> getCodeWorkflows(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `PUT /{version}/code/workflows`
  ///
  /// Create or update a workflow draft. Body: `definition` (the workflow
  /// definition JSON). Answers `WorkflowResponse`.
  Future<Object?> saveCodeWorkflow(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `GET /{version}/code/workflows/{Id}`
  ///
  /// One workflow. Query: `pinnedVersion?`. Answers `WorkflowResponse`.
  Future<Object?> getCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `DELETE /{version}/code/workflows/{Id}`
  ///
  /// Delete a workflow. Answers `EmptyResponse`.
  Future<Object?> deleteCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `PUT /{version}/code/workflows/{Id}/enable`
  ///
  /// Turn one workflow on. Answers `WorkflowResponse`.
  Future<Object?> enableCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `PUT /{version}/code/workflows/{Id}/disable`
  ///
  /// Turn one workflow off. Answers `WorkflowResponse`.
  Future<Object?> disableCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `POST /{version}/code/workflows/{Id}/publish`
  ///
  /// Publish the draft as a new version. Answers `WorkflowResponse`.
  Future<Object?> publishCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/publish',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `GET /{version}/code/workflows/{Id}/draft`
  ///
  /// The unpublished draft of a workflow. Answers `WorkflowResponse`.
  Future<Object?> getCodeWorkflowDraft(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/draft',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `DELETE /{version}/code/workflows/{Id}/draft`
  ///
  /// Throw the draft away. Answers `EmptyResponse`.
  Future<Object?> discardCodeWorkflowDraft(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/draft',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `GET /{version}/code/workflows/{Id}/versions`
  ///
  /// The published versions. Answers `WorkflowVersionsResponse`.
  Future<Object?> getCodeWorkflowVersions(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/versions',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `GET /{version}/code/workflows/{Id}/versions/diff`
  ///
  /// Compare two versions. Query: `fromVersion`, `toVersion`. Answers
  /// `WorkflowVersionDiffResponse`.
  Future<Object?> getCodeWorkflowVersionDiff(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/versions/diff',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `POST /{version}/code/workflows/{Id}/invoke`
  ///
  /// Start a run. Body: `payload?`, `waitSeconds?` (0–30), `runVersion?`
  /// (`draft` or a version number as a string). Answers
  /// `InvokeCodeWorkflowResponse`.
  Future<Object?> invokeCodeWorkflow(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/invoke',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `GET /{version}/code/workflows/{Id}/runs`
  ///
  /// The runs of one workflow. Query: `status?`, `from?`, `to?` and paging.
  /// Answers `WorkflowRunsResponse`.
  Future<Object?> getCodeWorkflowRuns(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/runs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `POST /{version}/code/workflows/{Id}/resume`
  ///
  /// Resume the waiting run of a workflow found by its key. Body: `key`,
  /// `stepId?`, `decision?` (`approved` / `rejected`), `payload?`. Answers
  /// `WorkflowRunResponse`.
  Future<Object?> resumeCodeWorkflowRunByKey(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/{Id}/resume',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// Beta: `POST /{version}/code/workflows/validate`
  ///
  /// Check a definition without saving it. Body: `definition`. Answers
  /// `ValidateCodeWorkflowResponse`.
  Future<Object?> validateCodeWorkflow(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/validate',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `GET /{version}/code/workflows/schema`
  ///
  /// The step kinds and bindings a definition can use. Answers
  /// `WorkflowSchemaResponse`.
  Future<Object?> getCodeWorkflowSchema(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/schema',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `PUT /{version}/code/workflows/enable`
  ///
  /// Turn the Workflows feature on. Answers `EmptyResponse`.
  Future<Object?> enableCodeWorkflows(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `PUT /{version}/code/workflows/disable`
  ///
  /// Turn the Workflows feature off. Answers `EmptyResponse`.
  Future<Object?> disableCodeWorkflows(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `GET /{version}/code/workflows/runs`
  ///
  /// Runs across workflows (waiting by default). Query: `status?`,
  /// `waitingKind?`, `assignee?` (`me` or a `usr_…` id), `workflowId?`,
  /// `key?` and paging. Answers `WorkflowRunsResponse`.
  Future<Object?> getCodeWorkflowWaitingRuns(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `GET /{version}/code/workflows/runs/{RunId}`
  ///
  /// One run with its steps. Answers `WorkflowRunResponse`.
  Future<Object?> getCodeWorkflowRun(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `GET /{version}/code/workflows/runs/{RunId}/logs`
  ///
  /// The log lines of a run. Query: `stepId?`, `level?` and paging. Answers
  /// `WorkflowRunLogsResponse`.
  Future<Object?> getCodeWorkflowRunLogs(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}/logs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `POST /{version}/code/workflows/runs/{RunId}/resume`
  ///
  /// Resume a waiting run. Body: `stepId?`, `decision?` (`approved` /
  /// `rejected`), `payload?`. Answers `WorkflowRunResponse`.
  Future<Object?> resumeCodeWorkflowRun(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}/resume',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `POST /{version}/code/workflows/runs/{RunId}/retry`
  ///
  /// Retry the failed step of a run. Body: `stepId?`. Answers
  /// `WorkflowRunResponse`.
  Future<Object?> retryCodeWorkflowRunStep(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}/retry',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `POST /{version}/code/workflows/runs/{RunId}/cancel`
  ///
  /// Cancel a run. Body: `reason?`. Answers `WorkflowRunResponse`.
  Future<Object?> cancelCodeWorkflowRun(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}/cancel',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `GET /{version}/code/workflows/resume/{Token}`
  ///
  /// Open a signed resume link (an approval in an e-mail). The token is the
  /// key: no sign-in needed — auth is sent when the client has it, never
  /// required. Answers `CodeWorkflowResumeLinkResponse`.
  Future<Object?> openCodeWorkflowResumeLink(
      {required Object token,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/resume/{Token}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Token': token},
    );
  }

  /// Beta: `POST /{version}/code/workflows/resume/{Token}`
  ///
  /// Act on a signed resume link. Body: `decision?`, `payload?`. The token
  /// is the key: no sign-in needed. Answers `WorkflowRunResponse`.
  Future<Object?> useCodeWorkflowResumeLink(
      {required Object token,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/resume/{Token}',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Token': token},
    );
  }
}
