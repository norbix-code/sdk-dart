import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'errors.dart';
import 'models.dart';
import 'normalize.dart';
import 'signature.dart';

/// A typed handler: receives the normalised payload and event metadata.
typedef NorbixWebhookHandler<T> = FutureOr<void> Function(
  T payload,
  WebhookEvent event,
);

/// A raw handler: receives the envelope and delivery context.
typedef NorbixWebhookRawHandler = FutureOr<void> Function(
  WebhookEnvelope envelope,
  WebhookContext ctx,
);

String? _env(String key) {
  final v = Platform.environment[key];
  return (v == null || v.isEmpty) ? null : v;
}

/// Inbound Norbix webhook receiver.
///
/// Verifies the HMAC signature, parses the envelope, normalises the payload,
/// and dispatches to per-event handlers.
///
/// ```dart
/// final receiver = NorbixWebhookReceiver(); // reads env
///
/// receiver.on<UserDto>(NorbixWebhookEvents.membershipUserRegistered, (user, event) {
///   print(user.email ?? user.userName);
///   print(event.metadata.user?.id);
/// });
///
/// receiver.onAll(kNorbixWebhookEventNames, (envelope, ctx) => log(envelope.event));
///
/// final result = await receiver.handle(rawBody: body, headers: headers);
/// ```
class NorbixWebhookReceiver {
  final String? _secret;
  final int _toleranceSeconds;
  final String? _projectId;
  final String? _accountId;

  final Map<String, NorbixWebhookHandler<dynamic>> _handlers = {};
  final Map<String, List<NorbixWebhookRawHandler>> _onAll = {};

  /// Any argument left null falls back to its env var:
  /// `NORBIX_WEBHOOK_SIGNING_SECRET`, `NORBIX_WEBHOOK_TOLERANCE_SECONDS`,
  /// `NORBIX_PROJECT_ID`, `NORBIX_ACCOUNT_ID`.
  NorbixWebhookReceiver({
    String? secret,
    int? toleranceSeconds,
    String? projectId,
    String? accountId,
  })  : _secret = secret ?? _env('NORBIX_WEBHOOK_SIGNING_SECRET'),
        _toleranceSeconds = toleranceSeconds ??
            int.tryParse(_env('NORBIX_WEBHOOK_TOLERANCE_SECONDS') ?? '') ??
            300,
        _projectId = projectId ?? _env('NORBIX_PROJECT_ID'),
        _accountId = accountId ?? _env('NORBIX_ACCOUNT_ID');

  /// Register the typed handler for one event. The payload is cast to [T].
  ///
  /// Use the entity type for entity events (`UserDto`), `Mutation<UserDto>`
  /// for `user.updated`, `List` for batch events, etc.
  void on<T>(String event, NorbixWebhookHandler<T> handler) {
    _handlers[event] = (payload, e) => handler(payload as T, e);
  }

  /// Register a raw handler for many events. Runs after `on` for each event.
  void onAll(List<String> events, NorbixWebhookRawHandler handler) {
    for (final event in events) {
      (_onAll[event] ??= []).add(handler);
    }
  }

  /// Verify (when a secret is configured), parse, normalise, and dispatch.
  ///
  /// Throws [NorbixWebhookSignatureError] on a bad signature or guard mismatch,
  /// and [NorbixWebhookParseError] on a malformed body.
  Future<WebhookHandleResult> handle({
    required String rawBody,
    required Map<String, String> headers,
    String? path,
    bool verify = true,
  }) async {
    final dh = parseWebhookHeaders(headers);

    bool? verified;
    if (verify && _secret != null) {
      final check = verifySignature(
        secret: _secret,
        rawBody: rawBody,
        signature: dh.signature,
        timestamp: dh.timestamp,
        toleranceSeconds: _toleranceSeconds,
      );
      if (!check.ok) {
        throw NorbixWebhookSignatureError(check.reason ?? 'Invalid signature');
      }
      verified = true;
    }

    final envelope = _parseEnvelope(rawBody);

    if (_projectId != null && envelope.projectId != _projectId) {
      throw NorbixWebhookSignatureError(
        'delivery projectId ${envelope.projectId} does not match configured $_projectId',
      );
    }
    if (_accountId != null && envelope.accountId != _accountId) {
      throw NorbixWebhookSignatureError(
        'delivery accountId ${envelope.accountId} does not match configured $_accountId',
      );
    }

    final normalized = normalizeWebhook(envelope);
    final event = WebhookEvent(
      name: envelope.event,
      deliveryId: envelope.id,
      createdOn: envelope.createdOn,
      triggerId: envelope.triggerId,
      correlationId: null,
      accountId: dh.accountId ?? envelope.accountId,
      projectId: dh.projectId ?? envelope.projectId,
      integrationId: dh.integrationId,
      destinationId: dh.destinationId,
      verified: verified,
      metadata: normalized.metadata,
      raw: envelope,
    );
    final ctx = WebhookContext(
      path: path,
      verified: verified,
      accountId: dh.accountId ?? envelope.accountId,
      projectId: dh.projectId ?? envelope.projectId,
      integrationId: dh.integrationId,
      destinationId: dh.destinationId,
    );

    var handled = false;
    final handler = _handlers[envelope.event];
    if (handler != null) {
      await handler(normalized.payload, event);
      handled = true;
    }
    for (final raw in _onAll[envelope.event] ?? const []) {
      await raw(envelope, ctx);
    }

    return WebhookHandleResult(
      event: envelope.event,
      deliveryId: envelope.id,
      verified: verified,
      handled: handled,
      triggerId: envelope.triggerId,
    );
  }

  WebhookEnvelope _parseEnvelope(String rawBody) {
    final dynamic parsed;
    try {
      parsed = jsonDecode(rawBody);
    } on FormatException {
      throw const NorbixWebhookParseError('Webhook body is not valid JSON');
    }
    if (parsed is! Map<String, dynamic>) {
      throw const NorbixWebhookParseError('Webhook body must be a JSON object');
    }
    if (parsed['id'] is! String || (parsed['id'] as String).isEmpty) {
      throw const NorbixWebhookParseError('Webhook envelope missing id');
    }
    if (parsed['event'] is! String || (parsed['event'] as String).isEmpty) {
      throw const NorbixWebhookParseError('Webhook envelope missing event');
    }
    return WebhookEnvelope.fromJson(parsed);
  }
}
