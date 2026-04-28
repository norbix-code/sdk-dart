// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import 'package:norbix_core/norbix_core.dart';

/// Push templates, integrations, devices.
class PushNotificationsResource extends Resource {
  PushNotificationsResource(super.transport);

  /// `PUT /{version}/notifications/push/templates/{id}/archive`
  Future<Object?> archivePushTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}/archive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/push/templates/{id}/clone`
  Future<Object?> clonePushTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}/clone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/push/integrations/confirm-human-delivery`
  Future<Object?> confirmPushIntegrationHumanDelivery({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/confirm-human-delivery',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/push/templates`
  Future<Object?> createPushTemplate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/notifications/push/integrations/{id}`
  Future<Object?> deletePushIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/push/templates/{id}`
  Future<Object?> deletePushTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/disable`
  Future<Object?> disablePush({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/push/integrations/{id}/disable`
  Future<Object?> disablePushIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/enable`
  Future<Object?> enablePush({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/push/integrations/{id}/enable`
  Future<Object?> enablePushIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/integrations/{id}`
  Future<Object?> getPushIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/integrations`
  Future<Object?> getPushIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/push/templates/{id}/tokens`
  Future<Object?> getPushMessageContentTokens({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}/tokens',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/templates/{id}`
  Future<Object?> getPushTemplate({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/push/templates`
  Future<Object?> getPushTemplates({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/push/integrations/app/request`
  Future<Object?> registerCodeMashAppPushIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/app/request',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/push/devices`
  Future<Object?> registerDevice({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/devices',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/push/integrations`
  Future<Object?> savePushIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/push/integrations/{id}/default`
  Future<Object?> setPushIntegrationAsDefault({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/push/integrations/test`
  Future<Object?> testPushIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/push/templates/{id}/unarchive`
  Future<Object?> unArchivePushTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates/{id}/unarchive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/notifications/push/templates`
  Future<Object?> updatePushTemplate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/push/templates',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
