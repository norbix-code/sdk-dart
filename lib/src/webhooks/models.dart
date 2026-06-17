/// Webhook payload + metadata models.
///
/// All `fromJson` constructors are permissive: unknown keys are ignored and
/// missing keys default to null, mirroring the wire format (JSON).
library;

/// A membership user. Email / username are optional (username-only signup).
class UserDto {
  final String? id;
  final String? type;
  final String? email;
  final String? userName;
  final List<String>? roles;
  final List<String>? tags;
  final String? status;
  final String? createdOn;
  final String? modifiedOn;

  /// Unmapped fields, preserved from the wire payload.
  final Map<String, dynamic> raw;

  const UserDto({
    this.id,
    this.type,
    this.email,
    this.userName,
    this.roles,
    this.tags,
    this.status,
    this.createdOn,
    this.modifiedOn,
    this.raw = const {},
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['id'] as String?,
        type: json['type'] as String?,
        email: json['email'] as String?,
        userName: json['userName'] as String?,
        roles: (json['roles'] as List?)?.whereType<String>().toList(),
        tags: (json['tags'] as List?)?.whereType<String>().toList(),
        status: json['status'] as String?,
        createdOn: json['createdOn'] as String?,
        modifiedOn: json['modifiedOn'] as String?,
        raw: json,
      );
}

/// A file reference carried by `files.file.uploaded`.
class FileResourceRef {
  final String? path;
  final String? name;
  final int? size;
  final String? contentType;
  final Map<String, dynamic> raw;

  const FileResourceRef({
    this.path,
    this.name,
    this.size,
    this.contentType,
    this.raw = const {},
  });

  factory FileResourceRef.fromJson(Map<String, dynamic> json) => FileResourceRef(
        path: json['path'] as String?,
        name: json['name'] as String?,
        size: json['size'] as int?,
        contentType: json['contentType'] as String?,
        raw: json,
      );
}

/// `files.file.deleted` payload.
class FileDeleted {
  final String? path;
  const FileDeleted({this.path});

  factory FileDeleted.fromJson(Map<String, dynamic> json) =>
      FileDeleted(path: json['path'] as String?);
}

/// `membership.user.invited` payload (no full entity yet).
class UserInvited {
  final String? email;
  const UserInvited({this.email});

  factory UserInvited.fromJson(Map<String, dynamic> json) =>
      UserInvited(email: json['email'] as String?);
}

/// A before/after pair for a mutation event (`user.updated`, `record.updated`).
class Mutation<T> {
  final T from;
  final T to;
  const Mutation({required this.from, required this.to});
}

/// Schema identifiers for `database.*` events.
class WebhookSchemaInfo {
  final String? id;
  final String name;
  const WebhookSchemaInfo({this.id, required this.name});
}

/// A single entity id reference.
class WebhookEntityRef {
  final String id;
  const WebhookEntityRef(this.id);
}

/// Batch record ids.
class WebhookRecordIds {
  final List<String> ids;
  const WebhookRecordIds(this.ids);
}

/// Identifiers lifted off the wire payload onto [WebhookEvent.metadata].
class WebhookEventMetadata {
  final WebhookEntityRef? user;
  final WebhookSchemaInfo? schema;
  final WebhookEntityRef? record;
  final WebhookRecordIds? records;
  final String? integrationId;

  const WebhookEventMetadata({
    this.user,
    this.schema,
    this.record,
    this.records,
    this.integrationId,
  });
}

/// The raw JSON envelope POSTed to a destination.
class WebhookEnvelope {
  final String id;
  final String event;
  final String? createdOn;
  final String? accountId;
  final String? projectId;
  final String? triggerId;
  final dynamic data;

  const WebhookEnvelope({
    required this.id,
    required this.event,
    this.createdOn,
    this.accountId,
    this.projectId,
    this.triggerId,
    this.data,
  });

  factory WebhookEnvelope.fromJson(Map<String, dynamic> json) => WebhookEnvelope(
        id: json['id'] as String,
        event: json['event'] as String,
        createdOn: json['createdOn'] as String?,
        accountId: json['accountId'] as String?,
        projectId: json['projectId'] as String?,
        triggerId: json['triggerId'] as String?,
        data: json['data'],
      );
}

/// Metadata object passed as the 2nd argument to a typed handler.
class WebhookEvent {
  final String name;
  final String deliveryId;
  final String? createdOn;
  final String? triggerId;
  final String? correlationId;
  final String? accountId;
  final String? projectId;
  final String? integrationId;
  final String? destinationId;
  final bool? verified;
  final WebhookEventMetadata metadata;
  final WebhookEnvelope raw;

  const WebhookEvent({
    required this.name,
    required this.deliveryId,
    this.createdOn,
    this.triggerId,
    this.correlationId,
    this.accountId,
    this.projectId,
    this.integrationId,
    this.destinationId,
    this.verified,
    required this.metadata,
    required this.raw,
  });
}

/// Context passed to `onAll` handlers alongside the envelope.
class WebhookContext {
  final String? path;
  final bool? verified;
  final String? accountId;
  final String? projectId;
  final String? integrationId;
  final String? destinationId;

  const WebhookContext({
    this.path,
    this.verified,
    this.accountId,
    this.projectId,
    this.integrationId,
    this.destinationId,
  });
}

/// Result of handling a delivery (respond 200 to the caller).
class WebhookHandleResult {
  final bool received;
  final String event;
  final String deliveryId;
  final bool? verified;
  final bool handled;
  final String? triggerId;

  const WebhookHandleResult({
    this.received = true,
    required this.event,
    required this.deliveryId,
    this.verified,
    this.handled = false,
    this.triggerId,
  });
}
