// Written by hand in the generated-resource style: the generator
// (tool/generate_resources.*) is not on disk. Routes: references/hub.dtos.dart.

import '../../core/resource.dart';

/// Code integrations, the marketplace and cloud functions.
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
}
