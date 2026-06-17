// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// SMS notifications: integrations, templates and campaigns.
class SmsNotificationsResource extends Resource {
  SmsNotificationsResource(super.transport);

  /// `PUT /{version}/notifications/sms/templates/{id}/archive`
  Future<Object?> archiveSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}/archive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/sms/templates/{id}/clone`
  Future<Object?> cloneSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}/clone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
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

  /// `DELETE /{version}/notifications/sms/integrations/{id}`
  Future<Object?> deleteSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/sms/templates/{id}`
  Future<Object?> deleteSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/disable`
  Future<Object?> disableSms(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/integrations/{id}/disable`
  Future<Object?> disableSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/sms/enable`
  Future<Object?> enableSms(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/sms/integrations/{id}/enable`
  Future<Object?> enableSmsIntegration(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
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

  /// `GET /{version}/notifications/sms/campaigns/{campaignId}/messages/{id}`
  Future<Object?> getSmsCampaignMessage(
      {required Object campaignId,
      required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/sms/campaigns/{campaignId}/messages/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'campaignId': campaignId, 'id': id},
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

  /// `PUT /{version}/notifications/sms/integrations/{id}/default`
  Future<Object?> setSmsIntegrationAsDefault(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/sms/templates/razor-syntax-check`
  Future<Object?> smsRazorSyntaxCheck(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/razor-syntax-check',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
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

  /// `PUT /{version}/notifications/sms/templates/{id}/unarchive`
  Future<Object?> unArchiveSmsTemplate(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/sms/templates/{id}/unarchive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
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
