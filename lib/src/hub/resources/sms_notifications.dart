// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// SMS notifications: integrations, templates and campaigns.
class SmsNotificationsResource extends Resource {
  SmsNotificationsResource(super.transport);

  /// `PUT /{version}/notifications/sms/templates/{Id}/archive`
  Future<Object?> archiveSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{Id}/archive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/notifications/sms/templates/{Id}/clone`
  Future<Object?> cloneSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{Id}/clone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/notifications/sms/integrations/confirm-human-delivery`
  Future<Object?> confirmSmsIntegrationHumanDelivery(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/confirm-human-delivery',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/sms/campaigns`
  Future<Object?> createSmsCampaign(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/sms/templates`
  Future<Object?> createSmsTemplate(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/notifications/sms/campaigns/{id}`
  Future<Object?> deleteSmsCampaign(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/sms/integrations/{Id}`
  Future<Object?> deleteSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `DELETE /{version}/notifications/sms/templates/{Id}`
  Future<Object?> deleteSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{Id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `PUT /{version}/notifications/sms/disable`
  Future<Object?> disableSms(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/integrations/{Id}/disable`
  Future<Object?> disableSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{Id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `PUT /{version}/notifications/sms/enable`
  Future<Object?> enableSms(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/integrations/{Id}/enable`
  Future<Object?> enableSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{Id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{id}`
  Future<Object?> getSmsCampaign(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{id}/batches/{batchId}/{notificationId}`
  Future<Object?> getSmsCampaignBatchNotification(
      {required Object id,
      required Object batchId,
      required Object notificationId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/sms/campaigns/{id}/batches/{batchId}/{notificationId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{
        'id': id,
        'batchId': batchId,
        'notificationId': notificationId
      },
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{id}/batches/{batchId}`
  Future<Object?> getSmsCampaignBatchNotifications(
      {required Object id,
      required Object batchId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{id}/batches/{batchId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id, 'batchId': batchId},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{id}/batches`
  Future<Object?> getSmsCampaignBatches(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{id}/batches',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{campaignId}/messages`
  Future<Object?> getSmsCampaignMessages(
      {required Object campaignId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{campaignId}/messages',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'campaignId': campaignId},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns/{id}/stats`
  Future<Object?> getSmsCampaignStatistics(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{id}/stats',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/campaigns`
  Future<Object?> getSmsCampaigns(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/sms/disable-dependencies`
  ///
  /// What disabling the SMS module would affect (running campaigns,
  /// integrations). Call it before `disableSms` so the user can be warned.
  Future<Object?> getSmsDisableDependencies(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/disable-dependencies',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/sms/integrations/{id}`
  Future<Object?> getSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/integrations`
  Future<Object?> getSmsIntegrations(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/sms/templates/{id}/tokens`
  Future<Object?> getSmsMessageContentTokens(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}/tokens',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/settings`
  Future<Object?> getSmsSettings(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/settings',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/sms/templates/{id}`
  Future<Object?> getSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/templates`
  Future<Object?> getSmsTemplates(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/sms/preview`
  ///
  /// Opens with the signed preview link alone: pass `query: {'hash': link}`
  /// and no credentials are needed — auth is sent when the client has a
  /// token, never required. A signed-in member can pass `projectId` +
  /// `notificationId` instead.
  Future<Object?> previewSmsNotification(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/preview',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/sms/templates/render`
  ///
  /// Runs the Razor SMS template `code` with the given `tokens`
  /// (`[{'name': ..., 'value': ...}]`) and answers the bound text, or the
  /// list of tokens that are still unresolved. `isForPreview: true` relaxes
  /// some validation.
  Future<Object?> renderSms(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/render',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/sms/integrations`
  Future<Object?> saveSmsIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/integrations/{Id}/default`
  Future<Object?> setSmsIntegrationAsDefault(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{Id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/notifications/sms/campaigns/{Id}/stop`
  ///
  /// Stops a scheduled or running campaign: no further messages are sent.
  /// Cannot be undone — a stopped campaign is not resumed; create a new one.
  Future<Object?> stopSmsCampaign(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/campaigns/{Id}/stop',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `POST /{version}/notifications/sms/integrations/test`
  Future<Object?> testSmsIntegration(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/templates/{Id}/unarchive`
  Future<Object?> unArchiveSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{Id}/unarchive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Id': id},
    );
  }

  /// `PUT /{version}/notifications/sms/templates`
  Future<Object?> updateSmsTemplate(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
