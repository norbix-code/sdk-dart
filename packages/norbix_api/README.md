# norbix_api

Official Dart SDK for the project-scoped **Norbix API** (`api.norbix.ai`).

```bash
dart pub add norbix_api
```

## Quickstart

```dart
import 'package:norbix_api/norbix_api.dart';

Future<void> main() async {
  // Defaults to https://api.norbix.ai
  final client = NorbixApi(
    config: NorbixConfig(
      baseUrl: kNorbixApiDefaultBaseUrl,
      apiKey: 'nbx_...',
    ),
  );

  final users = await client.users.getUsers(query: {'take': 20});
  print(users);

  client.close();
}
```

Notice the call is `client.users.getUsers(...)` — there is no
`client.api.users.*` indirection.

## Configuration

Three ways to configure, pick the one that fits your deployment:

### 1. Default (public Norbix)

```dart
final client = NorbixApi(
  config: NorbixConfig(
    baseUrl: kNorbixApiDefaultBaseUrl,   // https://api.norbix.ai
    apiKey: 'nbx_...',
  ),
);
```

### 2. Self-hosted

You deployed Norbix to your own domain or to localhost? Just change the URL:

```dart
final client = NorbixApi(
  config: NorbixConfig(
    baseUrl: 'https://api.norbix.isidos.lt', // your company domain
    apiKey: 'nbx_...',
  ),
);

// or for local development
final dev = NorbixApi(
  config: NorbixConfig(
    baseUrl: 'http://localhost:5000',
    apiKey: 'nbx_dev_...',
  ),
);
```

### 3. From environment variables (recommended for production)

```dart
final client = NorbixApi.fromEnv();
```

Reads (all optional):

| Variable | Default | Purpose |
|---|---|---|
| `NORBIX_API_BASE_URL` | `https://api.norbix.ai` | Host URL |
| `NORBIX_API_KEY` | — | API key (`x-api-key`) |
| `NORBIX_API_BEARER_TOKEN` | — | JWT (overrides API key) |
| `NORBIX_API_VERSION` | `v1` | API version segment |
| `NORBIX_API_TIMEOUT_MS` | `30000` | HTTP timeout |
| `NORBIX_API_MAX_RETRIES` | `0` | Retries on 5xx / 429 / network |

## Resources

- `client.auth` — authentication, OAuth providers, access tokens
- `client.apiKeys` — API key management for the project / environment
- `client.users` — membership users (CRUD, register variants, block / unblock, invite, role assignment)

## Errors

All requests throw a typed `NorbixError` subclass on failure:

```dart
try {
  await client.users.getUser(id: 'usr_missing');
} on NorbixNotFoundError {
  // 404
} on NorbixAuthError {
  // 401 / 403
} on NorbixRateLimitError catch (e) {
  await Future.delayed(Duration(seconds: e.retryAfterSeconds ?? 5));
} on NorbixError catch (e) {
  // anything else (server error, transport, ...)
  print('${e.code} (${e.status}): ${e.message}');
}
```
