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

### Regions

Pin a client to a Norbix region (a region code such as `nb-eu-germany`).
**There is no default region**: when none is set, no region header is
sent and requests go to the plain host — existing and self-hosted setups
are unaffected.

```dart
// 1) At construction
final hub = NorbixHub(region: 'nb-eu-germany');
final api = NorbixApi(region: 'nb-eu-germany');

// 2) From environment variables
final hub = NorbixHub.fromEnv();   // reads NORBIX_HUB_REGION
final api = NorbixApi.fromEnv();   // reads NORBIX_API_REGION

// 3) At runtime
hub.setRegion('nb-us-east');       // subsequent requests target nb-us-east
print(hub.region);                 // 'nb-us-east'
hub.setRegion(null);               // clear — no header, default host
```

(`NorbixConfig.fromEnv` also takes a `regionVar:` name, default
`NORBIX_REGION`; the per-host factories above set it for you.)

Every request with a resolved region carries the `nb-region` header.
When the client's base URL is one of the SDK defaults
(`https://api.norbix.ai`, `https://hub.norbix.ai` —
`kNorbixRegionalDefaultBaseUrls`), the client region also routes the
request to the regional host:

```
https://hub.norbix.ai  +  region nb-eu-germany  →  https://nb-eu-germany.hub.norbix.ai
```

A custom base URL (self-hosted, localhost) is **never rewritten** — the
region then only adds the `nb-region` header.

The two region-aware endpoints also accept a per-call `region:` argument
that overrides the client region for that single request. A per-call
override sets the **header only**; the URL is not recomposed:

```dart
await hub.accounts.getAccountRegions(region: 'nb-us-east');
```

### Regions endpoints

Regions live on the existing `accounts` and `projects` resources — there
is no separate `hub.regions` module:

```dart
// GET /{version}/account/regions — regions available to the account.
// Response: {'items': [{'id': 'nb-eu-germany', 'continent': ..., 'name': ...}, ...]}
// 'id' is the region code; 'continent' and 'name' are optional.
final regions = await hub.accounts.getAccountRegions();

// PATCH /{version}/account/projects/{projectId}/settings/regions
// Body takes 'primaryRegion' (a region code) and/or 'additionalRegions'
// (a list of region codes). The response is empty.
await hub.projects.updateProjectRegions(
  projectId: 'p1',
  body: {
    'primaryRegion': 'nb-eu-germany',
    'additionalRegions': ['nb-us-east'],
  },
);
```

`hub.projects.createProject` also accepts optional `primaryRegion` /
`additionalRegions` keys in its `body` to place a new project in
specific regions at creation time.

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
