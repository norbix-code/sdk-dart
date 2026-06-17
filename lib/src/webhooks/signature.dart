import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Outbound Norbix webhook delivery header names (gateway WebhookDeliveryClient).
abstract final class NorbixWebhookHeaders {
  static const event = 'X-Norbix-Event';
  static const delivery = 'X-Norbix-Delivery';
  static const idempotencyKey = 'Idempotency-Key';
  static const account = 'X-Norbix-Account';
  static const project = 'X-Norbix-Project';
  static const integration = 'X-Norbix-Integration';
  static const destination = 'X-Norbix-Destination';
  static const signature = 'X-Norbix-Signature';
  static const timestamp = 'X-Norbix-Timestamp';
}

/// Parsed Norbix delivery headers from an inbound request.
class DeliveryHeaders {
  final String? event;
  final String? deliveryId;
  final String? idempotencyKey;
  final String? accountId;
  final String? projectId;
  final String? integrationId;
  final String? destinationId;
  final String? signature;
  final String? timestamp;

  const DeliveryHeaders({
    this.event,
    this.deliveryId,
    this.idempotencyKey,
    this.accountId,
    this.projectId,
    this.integrationId,
    this.destinationId,
    this.signature,
    this.timestamp,
  });
}

String? _header(Map<String, String> headers, String name) {
  final direct = headers[name];
  if (direct != null) return direct;
  final lower = name.toLowerCase();
  for (final entry in headers.entries) {
    if (entry.key.toLowerCase() == lower) return entry.value;
  }
  return null;
}

/// Read Norbix delivery headers from an inbound request (case-insensitive).
DeliveryHeaders parseWebhookHeaders(Map<String, String> headers) {
  return DeliveryHeaders(
    event: _header(headers, NorbixWebhookHeaders.event),
    deliveryId: _header(headers, NorbixWebhookHeaders.delivery) ??
        _header(headers, NorbixWebhookHeaders.idempotencyKey),
    idempotencyKey: _header(headers, NorbixWebhookHeaders.idempotencyKey),
    accountId: _header(headers, NorbixWebhookHeaders.account),
    projectId: _header(headers, NorbixWebhookHeaders.project),
    integrationId: _header(headers, NorbixWebhookHeaders.integration),
    destinationId: _header(headers, NorbixWebhookHeaders.destination),
    signature: _header(headers, NorbixWebhookHeaders.signature),
    timestamp: _header(headers, NorbixWebhookHeaders.timestamp),
  );
}

/// `sha256=<hex>` HMAC-SHA256 of `"<timestamp>.<rawBody>"`.
String computeSignature(String secret, String timestamp, String rawBody) {
  final mac = Hmac(sha256, utf8.encode(secret));
  final digest = mac.convert(utf8.encode('$timestamp.$rawBody'));
  return 'sha256=$digest';
}

/// Result of a signature check.
class SignatureCheck {
  final bool ok;
  final String? reason;
  const SignatureCheck(this.ok, [this.reason]);
}

/// Verify `X-Norbix-Signature` against the raw body.
SignatureCheck verifySignature({
  required String secret,
  required String rawBody,
  String? signature,
  String? timestamp,
  int toleranceSeconds = 300,
}) {
  if (signature == null || signature.isEmpty) {
    return const SignatureCheck(false, 'missing X-Norbix-Signature header');
  }
  if (timestamp == null || timestamp.isEmpty) {
    return const SignatureCheck(false, 'missing X-Norbix-Timestamp header');
  }

  if (toleranceSeconds > 0) {
    final sent = double.tryParse(timestamp);
    if (sent == null) {
      return const SignatureCheck(false, 'X-Norbix-Timestamp is not a number');
    }
    final nowSeconds = DateTime.now().millisecondsSinceEpoch / 1000.0;
    final age = (nowSeconds - sent).abs();
    if (age > toleranceSeconds) {
      return SignatureCheck(
        false,
        'timestamp outside ${toleranceSeconds}s tolerance (age ${age.round()}s)',
      );
    }
  }

  final expected = computeSignature(secret, timestamp, rawBody);
  if (!_constantTimeEquals(expected, signature)) {
    return const SignatureCheck(false, 'signature mismatch');
  }
  return const SignatureCheck(true);
}

bool _constantTimeEquals(String a, String b) {
  if (a.length != b.length) return false;
  var result = 0;
  for (var i = 0; i < a.length; i++) {
    result |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
  }
  return result == 0;
}
