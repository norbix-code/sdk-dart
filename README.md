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

## Working with terms

A **taxonomy** is a named tree of **terms** (labels). A term can have one parent (a clean hierarchy) or several parents (the same item under many categories). Pick the call that matches what you want:

| I want to… | Call | Returns |
| --- | --- | --- |
| Get a taxonomy's terms as a flat list | `findTerms` | a paginated `list` of terms |
| Get only the children of one term | `findTermsChildren` | a `list` of child terms (direct + multi-parent) |
| Get a taxonomy's terms as a ready-made tree | `findTermTree` | a `tree` of nested term nodes |
| Get the taxonomy structure (e.g. Countries → Cities) | `findTaxonomyTree` | a `tree` of taxonomy nodes |

The examples below all use one example `services` taxonomy shaped like this:

```text
Indoors
  └─ Air conditioning
       └─ Wall-mounted
Outdoors
  └─ Solar panels
```

---

### List a taxonomy's terms (flat)
**Goal:** show every term of `services` in a simple list, in display order.
```dart
final res = await hub.database.findTerms(taxonomyName: 'services');
```
```json
{
  "list": {
    "items": [
      { "id": "term_indoors",   "taxonomyName": "services", "parentId": null,           "order": 1, "name": "Indoors" },
      { "id": "term_air_con",   "taxonomyName": "services", "parentId": "term_indoors", "order": 1, "name": "Air conditioning" },
      { "id": "term_wall",      "taxonomyName": "services", "parentId": "term_air_con", "order": 1, "name": "Wall-mounted" },
      { "id": "term_outdoors",  "taxonomyName": "services", "parentId": null,           "order": 2, "name": "Outdoors" },
      { "id": "term_solar",     "taxonomyName": "services", "parentId": "term_outdoors","order": 1, "name": "Solar panels" }
    ],
    "hasMore": false, "hasPrevious": false, "startingAfter": null, "endingBefore": null
  },
  "responseStatus": { "isSuccess": true }
}
```
The list is flat — every term is one row, with its `parentId` telling you where it sits. The nesting is not built for you here (use `findTermTree` for that).

---

### List only top-level terms (filtered)
**Goal:** show just the roots (no parent) — for the first level of a menu.
```dart
final res = await hub.database.findTerms(
  taxonomyName: 'services',
  query: {'filter': '{ "parentId": null }'},
);
```
```json
{
  "list": {
    "items": [
      { "id": "term_indoors",  "taxonomyName": "services", "parentId": null, "order": 1, "name": "Indoors" },
      { "id": "term_outdoors", "taxonomyName": "services", "parentId": null, "order": 2, "name": "Outdoors" }
    ],
    "hasMore": false, "hasPrevious": false, "startingAfter": null, "endingBefore": null
  },
  "responseStatus": { "isSuccess": true }
}
```
`filter` is an optional MongoDB filter, ANDed with the taxonomy. Use it to fetch one level at a time (lazy tree loading) or to find terms by any field.

---

### Get a term's children
**Goal:** the user expanded *Indoors* — load what is directly under it.
```dart
final res = await hub.database.findTermsChildren(
  taxonomyName: 'services',
  parentId: 'term_indoors',
);
```
```json
{
  "list": {
    "items": [
      {
        "id": "term_air_con",
        "taxonomyName": "services",
        "parentId": "term_indoors",
        "order": 1,
        "name": "Air conditioning",
        "multiParents": [
          { "taxonomyId": "tax_service_types", "parentId": "term_indoors",          "name": "Indoors" },
          { "taxonomyId": "tax_service_types", "parentId": "term_energy_efficient", "name": "Energy efficient" }
        ]
      }
    ],
    "hasMore": false, "hasPrevious": false
  },
  "responseStatus": { "isSuccess": true }
}
```
This returns **both** direct children (their `parentId` is `term_indoors`) **and** multi-parent children (terms that list `term_indoors` in `multiParents`). Parent names are already resolved, so no second lookup.

---

### Multi-parent: one product in several categories
**Goal:** in a `products` taxonomy, a *Relaxing massage oil* belongs to *For couples*, *Gift ideas*, **and** *Body care*. Listing the children of **any** of those categories returns it.
```dart
final res = await hub.database.findTermsChildren(
  taxonomyName: 'products',
  parentId: 'term_gift_ideas',
);
```
```json
{
  "list": {
    "items": [
      {
        "id": "term_relaxing_oil",
        "taxonomyName": "products",
        "name": "Relaxing massage oil",
        "multiParents": [
          { "taxonomyId": "tax_categories", "parentId": "term_for_couples", "name": "For couples" },
          { "taxonomyId": "tax_categories", "parentId": "term_gift_ideas",  "name": "Gift ideas" },
          { "taxonomyId": "tax_categories", "parentId": "term_body_care",   "name": "Body care" }
        ]
      }
    ],
    "hasMore": false, "hasPrevious": false
  },
  "responseStatus": { "isSuccess": true }
}
```
One product, three category links — no duplicate listings. The same product would also come back from the children of `term_for_couples` and `term_body_care`.

---

### Get the whole term tree in one call
**Goal:** render the full `services` tree at once, already nested.
```dart
final res = await hub.database.findTermTree(taxonomyName: 'services');
```
```json
{
  "tree": [
    {
      "id": "term_indoors",
      "name": "Indoors",
      "order": 1,
      "children": [
        {
          "id": "term_air_con",
          "name": "Air conditioning",
          "order": 1,
          "children": [
            { "id": "term_wall", "name": "Wall-mounted", "order": 1, "children": null }
          ]
        }
      ]
    },
    {
      "id": "term_outdoors",
      "name": "Outdoors",
      "order": 2,
      "children": [
        { "id": "term_solar", "name": "Solar panels", "order": 1, "children": null }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
Roots are in `tree`; each node carries its own `children`; a leaf has `children: null`. The tree arrives ready to render — no client-side tree building.

---

### Get only a sub-tree, capped by depth
**Goal:** start from *Indoors* and go at most 2 levels deep.
```dart
final res = await hub.database.findTermTree(
  taxonomyName: 'services',
  query: {'rootTermId': 'term_indoors', 'depth': 2},
);
```
```json
{
  "tree": [
    {
      "id": "term_indoors",
      "name": "Indoors",
      "order": 1,
      "children": [
        { "id": "term_air_con", "name": "Air conditioning", "order": 1, "children": null }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
With `depth` 2 you get *Indoors* (level 1) and *Air conditioning* (level 2); *Wall-mounted* (level 3) is cut off, so *Air conditioning* shows `children: null`.

---

### Get the taxonomy structure tree — without terms
**Goal:** see how taxonomies relate to each other (e.g. a `Cities` taxonomy whose parent is `Countries`), structure only.
```dart
final res = await hub.database.findTaxonomyTree();
```
```json
{
  "tree": [
    {
      "viewId": "txn_countries",
      "taxonomyName": "Countries",
      "taxonomySlug": "countries",
      "parentId": null,
      "children": [
        { "viewId": "txn_cities", "taxonomyName": "Cities", "taxonomySlug": "cities", "parentId": "txn_countries", "children": null, "terms": null }
      ],
      "terms": null
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
This is the **taxonomy** tree, not the term tree: nodes are taxonomies. Every `terms` is `null` because we did not ask for terms.

---

### Get the taxonomy structure tree — with terms
**Goal:** same structure, but also pull each taxonomy's terms in the same call.
```dart
final res = await hub.database.findTaxonomyTree(
  query: {'includeTerms': true},
);
```
```json
{
  "tree": [
    {
      "viewId": "txn_countries",
      "taxonomyName": "Countries",
      "taxonomySlug": "countries",
      "parentId": null,
      "terms": [
        { "id": "term_lt", "name": "Lithuania", "order": 1, "children": null },
        { "id": "term_lv", "name": "Latvia",    "order": 2, "children": null }
      ],
      "children": [
        {
          "viewId": "txn_cities",
          "taxonomyName": "Cities",
          "taxonomySlug": "cities",
          "parentId": "txn_countries",
          "terms": [
            { "id": "term_vilnius", "name": "Vilnius", "order": 1, "children": null },
            { "id": "term_kaunas",  "name": "Kaunas",  "order": 2, "children": null }
          ],
          "children": null
        }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
Now each taxonomy node's `terms` holds that taxonomy's full term tree (same shape as `findTermTree`) — *Countries* carries its countries, *Cities* carries its cities.

> Every term-reading call also accepts an optional `databaseIntegrationId` to target a non-default database.

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
