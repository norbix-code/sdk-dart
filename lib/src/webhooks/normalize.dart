import 'models.dart';

/// The payload + metadata produced from a raw envelope.
class Normalized {
  final dynamic payload;
  final WebhookEventMetadata metadata;
  const Normalized(this.payload, this.metadata);
}

Map<String, dynamic> _asMap(dynamic value) =>
    value is Map<String, dynamic> ? value : const {};

/// Turn a raw envelope into `(payload, metadata)`.
///
/// - Entity events   -> `payload` is the entity (user / document / file).
/// - Mutation events -> `payload` is a [Mutation] (`from` / `to`).
/// - Batch events    -> `payload` is the list.
///
/// Wrapper ids (record id, schema, user id, ...) are moved onto `metadata`.
/// Unknown events fall back to `payload = envelope.data`, `metadata = {}`.
Normalized normalizeWebhook(WebhookEnvelope envelope) {
  final event = envelope.event;
  final data = _asMap(envelope.data);

  if (event.startsWith('database.')) {
    WebhookSchemaInfo? schema;
    final schemaName = data['schemaName'];
    if (schemaName is String) {
      final s = _asMap(data['schema']);
      schema = WebhookSchemaInfo(
        id: s['id'] is String ? s['id'] as String : null,
        name: schemaName,
      );
    }
    final metadata = WebhookEventMetadata(
      schema: schema,
      integrationId: data['integrationId'] is String
          ? data['integrationId'] as String
          : null,
      record: data['id'] is String ? WebhookEntityRef(data['id'] as String) : null,
      records: data['ids'] is List
          ? WebhookRecordIds((data['ids'] as List).whereType<String>().toList())
          : null,
    );

    switch (event) {
      case 'database.record.inserted':
      case 'database.record.deleted':
        return Normalized(data['document'], metadata);
      case 'database.record.updated':
      case 'database.record.replaced':
        return Normalized(
          Mutation<dynamic>(from: data['from'], to: data['to']),
          metadata,
        );
      case 'database.records.inserted':
        return Normalized(data['documents'] ?? const [], metadata);
      default:
        return Normalized(envelope.data, metadata);
    }
  }

  if (event.startsWith('membership.')) {
    final metadata = WebhookEventMetadata(
      user: data['id'] is String ? WebhookEntityRef(data['id'] as String) : null,
    );

    switch (event) {
      case 'membership.user.registered':
      case 'membership.user.verified':
      case 'membership.user.blocked':
      case 'membership.user.reactivated':
        return Normalized(UserDto.fromJson(_asMap(data['to'])), metadata);
      case 'membership.user.deleted':
        return Normalized(UserDto.fromJson(_asMap(data['from'])), metadata);
      case 'membership.user.updated':
        return Normalized(
          Mutation<UserDto>(
            from: UserDto.fromJson(_asMap(data['from'])),
            to: UserDto.fromJson(_asMap(data['to'])),
          ),
          metadata,
        );
      case 'membership.user.invited':
        return Normalized(UserInvited(email: data['email'] as String?), metadata);
      default:
        return Normalized(envelope.data, metadata);
    }
  }

  if (event.startsWith('files.')) {
    final metadata = WebhookEventMetadata(
      integrationId: data['integrationId'] is String
          ? data['integrationId'] as String
          : null,
    );
    switch (event) {
      case 'files.file.uploaded':
        return Normalized(FileResourceRef.fromJson(_asMap(data['file'])), metadata);
      case 'files.file.deleted':
        return Normalized(FileDeleted(path: data['path'] as String?), metadata);
      default:
        return Normalized(envelope.data, metadata);
    }
  }

  return Normalized(envelope.data, const WebhookEventMetadata());
}
