import '../core/errors.dart';

/// Base error for inbound webhook handling.
class NorbixWebhookError extends NorbixError {
  const NorbixWebhookError({
    required super.message,
    super.code = 'WEBHOOK_ERROR',
    super.status,
    super.details,
  });
}

/// The delivery signature could not be verified (respond HTTP 401).
class NorbixWebhookSignatureError extends NorbixWebhookError {
  const NorbixWebhookSignatureError(String message)
      : super(
          message: message,
          code: 'WEBHOOK_SIGNATURE_INVALID',
          status: 401,
        );
}

/// The delivery body was not a valid webhook envelope (respond HTTP 400).
class NorbixWebhookParseError extends NorbixWebhookError {
  const NorbixWebhookParseError(String message)
      : super(
          message: message,
          code: 'WEBHOOK_PARSE_INVALID',
          status: 400,
        );
}
