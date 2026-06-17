/// Inbound Norbix webhook receiver.
///
/// Handle webhook deliveries (trigger → destination POST) at your HTTP
/// endpoint. This is the subscriber side — distinct from the Hub
/// `webhooks` resource, which configures destinations.
///
/// ```dart
/// import 'package:norbix/norbix_webhooks.dart';
///
/// final receiver = NorbixWebhookReceiver(); // reads env
///
/// receiver.on<UserDto>(NorbixWebhookEvents.membershipUserRegistered, (user, event) {
///   print(user.email ?? user.userName);
/// });
///
/// receiver.onAll(kNorbixWebhookEventNames, (envelope, ctx) => log(envelope.event));
///
/// final result = await receiver.handle(rawBody: body, headers: headers);
/// ```
library;

export 'src/core/errors.dart';
export 'src/webhooks/errors.dart';
export 'src/webhooks/events.dart';
export 'src/webhooks/models.dart';
export 'src/webhooks/normalize.dart' show normalizeWebhook, Normalized;
export 'src/webhooks/receiver.dart';
export 'src/webhooks/signature.dart'
    show
        NorbixWebhookHeaders,
        DeliveryHeaders,
        SignatureCheck,
        parseWebhookHeaders,
        computeSignature,
        verifySignature;
