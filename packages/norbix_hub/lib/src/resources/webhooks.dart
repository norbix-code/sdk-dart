// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Outbound webhook destinations and integration settings.
class WebhooksResource extends Resource {
  WebhooksResource(super.transport);

  /// `PUT /{version}/webhooks/destinations/{destinationId}/disable`
  Future<Object?> disableWebhookDestination({ required Object destinationId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/destinations/{destinationId}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'destinationId': destinationId},
    );
  }

  /// `PUT /{version}/webhooks/destinations/{destinationId}/enable`
  Future<Object?> enableWebhookDestination({ required Object destinationId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/destinations/{destinationId}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'destinationId': destinationId},
    );
  }

  /// `GET /{version}/webhooks/integration`
  Future<Object?> getWebhookIntegration({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/integration',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/webhooks/destinations/{destinationId}`
  Future<Object?> removeWebhookDestination({ required Object destinationId, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/destinations/{destinationId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'destinationId': destinationId},
    );
  }

  /// `GET /{version}/webhooks/integration/secret`
  Future<Object?> revealWebhookIntegrationSecret({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/integration/secret',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/webhooks/integration/secret/rotate`
  Future<Object?> rotateWebhookIntegrationSecret({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/integration/secret/rotate',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/webhooks/destinations`
  Future<Object?> saveWebhookDestination({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/destinations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/webhooks/integration/extra-headers`
  Future<Object?> updateWebhookIntegrationExtraHeaders({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/webhooks/integration/extra-headers',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
