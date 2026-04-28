# norbix_hub

Official Dart SDK for the account-scoped **Norbix Hub** (`hub.norbix.ai`).

```bash
dart pub add norbix_hub
```

## Quickstart

```dart
import 'package:norbix_hub/norbix_hub.dart';

Future<void> main() async {
  // Defaults to https://hub.norbix.ai
  final client = NorbixHub(
    config: NorbixConfig(
      baseUrl: kNorbixHubDefaultBaseUrl,
      bearerToken: 'eyJ...',
    ),
  );

  final projects = await client.projects.getProjects();
  print(projects);

  final schemas = await client.database.getDatabaseSchemas();
  print(schemas);

  client.close();
}
```

Calls go straight to the resource: `client.projects`, `client.database`,
`client.emailNotifications` — no `client.hub.projects.*` indirection.

## Configuration

### 1. Default (public Norbix)

```dart
final client = NorbixHub(
  config: NorbixConfig(
    baseUrl: kNorbixHubDefaultBaseUrl,   // https://hub.norbix.ai
    bearerToken: 'eyJ...',
  ),
);
```

### 2. Self-hosted

```dart
final client = NorbixHub(
  config: NorbixConfig(
    baseUrl: 'https://hub.norbix.isidos.lt', // your company domain
    bearerToken: 'eyJ...',
  ),
);

// local development
final dev = NorbixHub(
  config: NorbixConfig(baseUrl: 'http://localhost:5000'),
);
```

### 3. From environment variables

```dart
final client = NorbixHub.fromEnv();
```

| Variable | Default | Purpose |
|---|---|---|
| `NORBIX_HUB_BASE_URL` | `https://hub.norbix.ai` | Host URL |
| `NORBIX_HUB_API_KEY` | — | API key (`x-api-key`) |
| `NORBIX_HUB_BEARER_TOKEN` | — | JWT (overrides API key) |
| `NORBIX_HUB_VERSION` | `v1` | API version segment |
| `NORBIX_HUB_TIMEOUT_MS` | `30000` | HTTP timeout |
| `NORBIX_HUB_MAX_RETRIES` | `0` | Retries on 5xx / 429 / network |

## Resources

| Resource | What it covers |
|---|---|
| `client.accounts` | Account profile, team, licenses, regions, status, Stripe billing, AI chat |
| `client.projects` | Account projects: CRUD, settings, notifications, tokens |
| `client.aiIntegrations` | LLM and MCP integrations |
| `client.apiKeys` | Account-level API keys |
| `client.auth` | OAuth providers, access tokens (v1 + v3) |
| `client.database` | Schemas, taxonomies, aggregates, schema triggers |
| `client.echo` | Health-check endpoint |
| `client.emailNotifications` | Email templates, campaigns, integrations, signatures, footers |
| `client.emailUnsubscribe` | RFC-8058 one-click unsubscribe |
| `client.files` | File-storage integrations and triggers |
| `client.internals` | Internal Norbix utilities (typegen) |
| `client.logs` | Logging integrations |
| `client.membership` | Roles, policies, membership integrations and triggers |
| `client.payments` | Payments integrations and triggers |
| `client.pushNotifications` | Push templates, integrations, devices |
| `client.scheduler` | Scheduled tasks |
| `client.triggers` | Cross-module unified triggers endpoints |
| `client.userNotificationPreferences` | Per-user notification opt-ins |
| `client.webhooks` | Outbound webhook destinations |

## Errors

Same typed exception hierarchy as `norbix_api`:

```dart
try {
  await client.projects.getProject(projectId: 'prj_missing');
} on NorbixNotFoundError {
  // 404
} on NorbixAuthError {
  // 401 / 403
} on NorbixRateLimitError catch (e) {
  await Future.delayed(Duration(seconds: e.retryAfterSeconds ?? 5));
}
```
