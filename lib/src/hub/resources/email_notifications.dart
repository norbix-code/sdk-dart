// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Email templates, campaigns, integrations, signatures, footers, settings.
class EmailNotificationsResource extends Resource {
  EmailNotificationsResource(super.transport);

  /// `PUT /{version}/notifications/email/templates/{id}/archive`
  Future<Object?> archiveEmailTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}/archive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/email/templates/attachments`
  Future<Object?> attachFileToTemplate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/attachments',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/templates/{id}/clone`
  Future<Object?> cloneEmailTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}/clone',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/email/integrations/confirm-human-delivery`
  Future<Object?> confirmEmailIntegrationHumanDelivery({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/confirm-human-delivery',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/campaigns`
  Future<Object?> createEmailCampaign({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/templates`
  Future<Object?> createEmailTemplate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/notifications/email/campaigns/{id}`
  Future<Object?> deleteEmailCampaign({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/email/footers/{id}`
  Future<Object?> deleteEmailFooter({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/footers/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/email/integrations/{id}`
  Future<Object?> deleteEmailIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/email/signatures/{id}`
  Future<Object?> deleteEmailSignature({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/signatures/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `DELETE /{version}/notifications/email/templates/{id}`
  Future<Object?> deleteEmailTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/disable`
  Future<Object?> disableEmail({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/disable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/email/integrations/{id}/disable`
  Future<Object?> disableEmailIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/{id}/disable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/enable`
  Future<Object?> enableEmail({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/enable',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/email/integrations/{id}/enable`
  Future<Object?> enableEmailIntegration({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/{id}/enable',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/campaigns/{id}`
  Future<Object?> getEmailCampaign({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}`
  Future<Object?> getEmailCampaignBatchNotification({ required Object id, required Object batchId, required Object notificationId, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id, 'batchId': batchId, 'notificationId': notificationId},
    );
  }

  /// `GET /{version}/notifications/email/campaigns/{id}/batches/{batchId}`
  Future<Object?> getEmailCampaignBatchNotifications({ required Object id, required Object batchId, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}/batches/{batchId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id, 'batchId': batchId},
    );
  }

  /// `GET /{version}/notifications/email/campaigns/{id}/batches`
  Future<Object?> getEmailCampaignBatches({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}/batches',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/emails/campaigns/{campaignId}/messages/{id}`
  Future<Object?> getEmailCampaignMessage({ required Object campaignId, required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/emails/campaigns/{campaignId}/messages/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'campaignId': campaignId, 'id': id},
    );
  }

  /// `GET /{version}/notifications/emails/campaigns/{campaignId}/messages`
  Future<Object?> getEmailCampaignMessages({ required Object campaignId, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/emails/campaigns/{campaignId}/messages',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'campaignId': campaignId},
    );
  }

  /// `GET /{version}/notifications/email/campaigns/{id}/stats`
  Future<Object?> getEmailCampaignStatistics({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns/{id}/stats',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/campaigns`
  Future<Object?> getEmailCampaigns({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/campaigns',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/footers/{id}`
  Future<Object?> getEmailFooter({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/footers/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/footers`
  Future<Object?> getEmailFooters({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/footers',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/integrations/{id}`
  Future<Object?> getEmailIntegration({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/integrations`
  Future<Object?> getEmailIntegrations({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/settings`
  Future<Object?> getEmailSettings({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/settings',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/signatures/{id}`
  Future<Object?> getEmailSignature({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/signatures/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/signatures`
  Future<Object?> getEmailSignatures({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/signatures',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/templates/{id}`
  Future<Object?> getEmailTemplate({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/templates/{id}/tokens`
  Future<Object?> getEmailTemplateAvailableTokens({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}/tokens',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/templates`
  Future<Object?> getEmailTemplates({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/templates/mjml`
  Future<Object?> getMjml({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/mjml',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/system-templates/{id}`
  Future<Object?> getSystemEmailTemplate({ required Object id, Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/system-templates/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/notifications/email/system-templates`
  Future<Object?> getSystemEmailTemplates({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/system-templates',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/email/preview`
  Future<Object?> previewEmailNotification({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/preview',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/footers`
  Future<Object?> saveEmailFooter({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/footers',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/integrations`
  Future<Object?> saveEmailIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/email/signatures`
  Future<Object?> saveEmailSignature({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/signatures',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/email/integrations/{id}/default`
  Future<Object?> setEmailsIntegrationAsDefault({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/{id}/default',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `POST /{version}/notifications/email/integrations/test`
  Future<Object?> testEmailIntegration({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/integrations/test',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/email/templates/{id}/unarchive`
  Future<Object?> unArchiveEmailTemplate({ required Object id, Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates/{id}/unarchive',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `PUT /{version}/notifications/email/templates`
  Future<Object?> updateEmailTemplate({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/email/templates',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
