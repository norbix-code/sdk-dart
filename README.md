# Norbix Dart SDKs

Two installable packages, one repo:

| Package | What it talks to | Default URL |
|---|---|---|
| [`norbix_api`](packages/norbix_api) | Project-scoped Norbix API | `https://api.norbix.ai` |
| [`norbix_hub`](packages/norbix_hub) | Account-scoped Norbix Hub | `https://hub.norbix.ai` |

A small shared package, [`norbix_core`](packages/norbix_core), holds the
HTTP transport, config, and typed errors. Both SDKs depend on it.

## Why two packages?

The two Norbix services are deployed to different hosts and used in
different contexts. Apps that only call the project API should not pull
in account-management code, and vice versa.

You install only what you need:

```bash
dart pub add norbix_api          # for app / runtime use
dart pub add norbix_hub          # for tooling / admin / dashboards
```

## Resource-style API (no namespace nesting)

Resources are direct properties on the client:

```dart
final api = NorbixApi();
await api.users.getUsers();
await api.auth.authenticate();
await api.apiKeys.getApiKeys();

final hub = NorbixHub();
await hub.projects.getProjects();
await hub.database.getDatabaseSchemas();
await hub.emailNotifications.createEmailTemplate(body: {...});
```

There is no `client.api.xxx` or `client.hub.xxx` middle layer.

## Configuration

Defaults to the public `*.norbix.ai` hosts. Override the URL when you
self-host:

```dart
// Self-hosted at your company domain
final api = NorbixApi(
  config: NorbixConfig(
    baseUrl: 'https://api.norbix.isidos.lt',
    apiKey: 'nbx_...',
  ),
);

// Local development
final dev = NorbixHub(
  config: NorbixConfig(baseUrl: 'http://localhost:5000'),
);
```

Or load everything from environment variables — no boilerplate, no
`String.fromEnvironment` compile-time defines:

```dart
final api = NorbixApi.fromEnv();   // reads NORBIX_API_*
final hub = NorbixHub.fromEnv();   // reads NORBIX_HUB_*
```

See each package README for the full list of variables.

## Repo layout

```
norbix-dart/
├── packages/
│   ├── norbix_core/              # transport, config, errors
│   │   ├── lib/
│   │   │   ├── norbix_core.dart
│   │   │   └── src/
│   │   │       ├── config.dart
│   │   │       ├── errors.dart
│   │   │       ├── http_driver.dart
│   │   │       ├── resource.dart
│   │   │       └── transport.dart
│   │   └── test/
│   ├── norbix_api/               # resources for api.norbix.ai
│   │   ├── lib/
│   │   │   ├── norbix_api.dart
│   │   │   └── src/
│   │   │       ├── client.dart
│   │   │       └── resources/
│   │   │           ├── auth.dart
│   │   │           ├── api_keys.dart
│   │   │           └── users.dart
│   │   └── test/
│   └── norbix_hub/               # resources for hub.norbix.ai
│       ├── lib/
│       │   ├── norbix_hub.dart
│       │   └── src/
│       │       ├── client.dart
│       │       └── resources/    # accounts, projects, database, emails, ...
│       └── test/
├── tool/
│   └── generate_resources.py     # codegen for resource modules
├── pubspec.yaml                  # Dart workspace root
└── Makefile                      # gen / lint / test
```

## Development

```bash
dart pub get                      # resolves all 3 packages via the workspace
make gen                          # regenerate resource modules
make test                         # run all package tests
make lint                         # dart analyze
```

## Releases

`norbix_core`, `norbix_api`, and `norbix_hub` are versioned together.
Conventional Commits + `semantic-release` drive the version bump:

- `feat:` — minor
- `fix:` — patch
- `feat!` / `BREAKING CHANGE:` — major

Channels: `main` → stable, `next` → `-rc.*`, `beta` → `-beta.*`.
