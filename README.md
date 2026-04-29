# Norbix Dart SDK

One package, two importable libraries:

| Import | What it talks to | Default URL |
|---|---|---|
| `package:norbix/norbix_api.dart` | Project-scoped Norbix API | `https://api.norbix.ai` |
| `package:norbix/norbix_hub.dart` | Account-scoped Norbix Hub | `https://hub.norbix.ai` |

A single shared core (HTTP transport, config, typed errors) lives under
`lib/src/core/` and is re-exported from both entry-point libraries — you
never need to import it directly.

## Install

```bash
dart pub add norbix
```

Import the gateway you use:

```dart
import 'package:norbix/norbix_api.dart';   // project-scoped API
import 'package:norbix/norbix_hub.dart';   // account-scoped Hub
```

If you need both in the same file, import one with a prefix to avoid
name collisions on resources that exist in both gateways (e.g. `auth`,
`apiKeys`):

```dart
import 'package:norbix/norbix_api.dart';
import 'package:norbix/norbix_hub.dart' as hub;

final api = NorbixApi();
final h   = hub.NorbixHub();
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

## Repo layout

```
norbix-dart/
├── lib/
│   ├── norbix_api.dart           # API entry point (re-exports core + api client + resources)
│   ├── norbix_hub.dart           # Hub entry point (re-exports core + hub client + resources)
│   └── src/
│       ├── core/                 # handwritten: transport, config, errors
│       ├── api/                  # GENERATED — gitignored
│       └── hub/                  # GENERATED — gitignored
├── test/
│   ├── _fake_driver.dart
│   ├── core/                     # core tests
│   ├── api/                      # API client tests
│   └── hub/                      # Hub client tests
├── tool/
│   └── generate_resources.py     # codegen for resource modules (dev-task, never runs in CI)
├── pubspec.yaml                  # single `norbix` package
└── Makefile                      # gen / lint / test
```

## Development

```bash
dart pub get                      # install deps
make gen                          # regenerate resource modules (dev-only)
make test                         # run all tests
make lint                         # dart analyze
```

CI never runs `make gen`. The generated files under `lib/src/api/` and
`lib/src/hub/` are gitignored. The dev runs the gen script locally and
ships the SDK with the generated artifacts produced from the canonical
route files.

## Releases

Versioned with Conventional Commits + `semantic-release`:

- `feat:` — minor
- `fix:` — patch
- `feat!` / `BREAKING CHANGE:` — major

Channels: `main` → stable, `next` → `-rc.*`, `beta` → `-beta.*`.
