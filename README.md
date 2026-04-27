# norbix-dart

Official Dart SDK for Norbix APIs. The client exposes both:

- `api` namespace for project-scoped API endpoints
- `hub` namespace for account-scoped management endpoints

## Install

```bash
dart pub add norbix_dart
```

## Quickstart

```dart
import 'package:norbix_dart/norbix_dart.dart';

Future<void> main() async {
  final norbix = Norbix(
    apiKey: const String.fromEnvironment('NORBIX_API_KEY'),
  );

  // Example API call (database module)
  final db = await norbix.api.database.getDatabases(
    projectId: 'proj_123',
  );
  print(db);

  // Example HUB call (accounts module)
  final account = await norbix.hub.accounts.getAccount(
    accountId: 'acc_123',
  );
  print(account);
}
```

## Authentication

Use either API key or bearer token:

```dart
final client = Norbix(apiKey: 'nbx_...');
client.setBearerToken('eyJ...');
```

## SDK maintenance

Endpoint wrappers and module docs are generated as part of the SDK maintenance workflow.

## Real-world examples

### 1) List project datasets

```dart
final datasets = await client.api.dataset.getDatasets(projectId: 'proj_123');
for (final item in (datasets['items'] ?? const [])) {
  print(item);
}
```

### 2) Rotate access token with account scope

```dart
final token = await client.hub.accessToken.createAccessToken(
  accountId: 'acc_123',
  body: {'name': 'ci-token', 'scopes': ['read', 'write']},
);
print(token);
```

### 3) Use query parameters and path parameters

```dart
final result = await client.api.membership.getMembershipUsers(
  projectId: 'proj_123',
  query: {'take': 20, 'skip': 0},
);
print(result);
```

## Development

```bash
dart pub get
dart analyze
dart test
```

## Releases (semantic versioning)

`norbix-dart` uses Conventional Commits + `semantic-release`:

- `feat:` -> minor release
- `fix:` -> patch release
- `feat!` / `BREAKING CHANGE:` -> major release

Release channels:

- `main` -> stable
- `next` -> `-rc.*` pre-releases
- `beta` -> `-beta.*` pre-releases
