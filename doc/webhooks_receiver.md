# Webhook receiver (`package:norbix/norbix_webhooks.dart`)

Handle **inbound** Norbix webhook deliveries at your HTTP endpoint. This is the
subscriber side — distinct from the Hub `webhooks` resource, which configures
destinations.

## Quick start

```dart
import 'package:norbix/norbix_webhooks.dart';

// No arguments → reads NORBIX_WEBHOOK_SIGNING_SECRET (and friends) from env.
final receiver = NorbixWebhookReceiver();

// Typed: the first arg IS the payload, the second is metadata.
receiver.on<UserDto>(NorbixWebhookEvents.membershipUserRegistered, (user, event) {
  print(user.email ?? user.userName);   // UserDto, directly
  print(event.metadata.user?.id);       // wrapper id moved onto metadata
});

// Database insert — payload is the document map.
receiver.on<Map<String, dynamic>>(
  NorbixWebhookEvents.databaseRecordInserted,
  (record, event) => print('${event.metadata.schema?.id}: ${record['email']}'),
);

// One raw logger for every event — runs in addition to any `on` handler.
receiver.onAll(kNorbixWebhookEventNames, (envelope, ctx) => print(envelope.event));

// In your server (shelf/dart_frog/etc.), pass the raw body + headers:
final result = await receiver.handle(rawBody: body, headers: headers);
```

## Configuration

`NorbixWebhookReceiver(...)` reads these env vars; any argument you pass
overrides the env var.

| Env var | Argument | Default |
|---------|----------|---------|
| `NORBIX_WEBHOOK_SIGNING_SECRET` | `secret` | — (verify skipped if unset) |
| `NORBIX_WEBHOOK_TOLERANCE_SECONDS` | `toleranceSeconds` | `300` |
| `NORBIX_PROJECT_ID` | `projectId` (guard) | — |
| `NORBIX_ACCOUNT_ID` | `accountId` (guard) | — |

When `projectId` / `accountId` are set, a delivery whose envelope does not match
throws `NorbixWebhookSignatureError`.

## Payloads — `from`/`to` only when you must compare

The payload differs by trigger kind. Create, delete, and single-property state
flips give the **entity directly**; only an arbitrary mutation gives a
`Mutation<T>` (`.from`, `.to`). Batch events give a `List`.

| Event | Kind | `on<T>` payload (`T`) |
|-------|------|-----------------------|
| `membership.user.registered` | entity | `UserDto` |
| `membership.user.verified` / `blocked` / `reactivated` | entity (state flip) | `UserDto` |
| `membership.user.deleted` | entity | `UserDto` |
| `membership.user.updated` | mutation | `Mutation<UserDto>` |
| `database.record.inserted` / `deleted` | entity | `Map<String, dynamic>` (document) |
| `database.record.updated` / `replaced` | mutation | `Mutation<Map<String, dynamic>>` |
| `database.records.inserted` | batch | `List` of documents |
| `files.file.uploaded` | entity | `FileResourceRef` |

Wrapper identifiers (entity id, schema, record ids) are lifted onto
`event.metadata` (`event.metadata.user`, `.schema`, `.record`, `.records`).

```dart
receiver.on<Mutation<UserDto>>(NorbixWebhookEvents.membershipUserUpdated, (m, event) {
  if (m.from.email != m.to.email) {
    // email changed
  }
});
```

> The `on<T>` payload is cast to `T`. Pick the type from the table above —
> a wrong `T` throws a clear cast error at dispatch time.

## Signature verification

Norbix signs each delivery with `X-Norbix-Signature: sha256=<hex>` over
`"<timestamp>.<rawBody>"` (HMAC-SHA256, `package:crypto`). Configure the project
signing secret or set `NORBIX_WEBHOOK_SIGNING_SECRET`. With no secret configured,
verification is skipped and `result.verified` is `null`.

## API

| Export | Description |
|--------|-------------|
| `NorbixWebhookReceiver` | `on<T>`, `onAll`, `handle()` |
| `NorbixWebhookEvents` | Named event constants |
| `kNorbixWebhookEventNames` | Closed catalog of event names |
| `UserDto`, `FileResourceRef`, `Mutation<T>` | Payload models |
| `WebhookEvent`, `WebhookContext`, `WebhookEnvelope` | Metadata / raw models |
| `verifySignature`, `computeSignature`, `parseWebhookHeaders` | Low-level helpers |
| `normalizeWebhook` | Envelope → `Normalized(payload, metadata)` |

Errors: `NorbixWebhookSignatureError`, `NorbixWebhookParseError`
(both extend `NorbixWebhookError` → `NorbixError`).
