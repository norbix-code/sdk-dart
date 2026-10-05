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

| Client | Resources |
|--------|-----------|
| `NorbixApi` | `aiChat`, `apiKeys`, `auth`, `database`, `files`, `publicProjects`, `userAuth`, `users` |
| `NorbixHub` | `accounts`, `aiIntegrations`, `apiKeys`, `auth`, `contacts`, `database`, `echo`, `emailNotifications`, `emailUnsubscribe`, `environments`, `files`, `internals`, `logs`, `membership`, `payments`, `projects`, `pushNotifications`, `scheduler`, `smsNotifications`, `userNotificationPreferences`, `webhooks` |

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

## Errors

```dart
try {
  await api.files.getFileInfo(integrationId, path: 'a/b.txt');
} on NorbixError catch (e) {
  // httpStatus / errorCode are the names every Norbix SDK uses.
  // status / code are the same values, kept for older code.
  print('${e.httpStatus} ${e.errorCode}: ${e.message}');
  for (final item in e.errors) {
    print('${item.errorCode} ${item.fieldName}: ${item.message}');
  }
  print(e.body); // the answer exactly as it arrived
}
```

`message` and `errorCode` are the gateway's own. The gateway puts them inside
`responseStatus.errors[]`, so the SDK reads that list first, takes the first
entry for the message and the code, and keeps every entry in `errors`. Only
when the body has no `responseStatus` are the top-level `message` and
`errorCode` read. `Request failed (HTTP N)` with the code `NORBIX_HTTP_ERROR`
is the last fallback, used when the body says nothing — a 500 page that is not
JSON, say.

### Breaking change — a refused call now throws

The gateway answers a business refusal (an unknown id, a rule that says no)
with **HTTP 200** and `responseStatus.isSuccess = false`. The SDK used to hand
that answer back as a normal value, so code carried on as if the call had
worked. It now throws a `NorbixError` with `httpStatus` 200 and the gateway's
message and error code.

If your code checked `result['responseStatus']['isSuccess']` itself, move that
check into a `try / catch`. Endpoints that answer with raw bytes rather than a
document (`sendBytes` — file download, the public file link) are not JSON and
are unchanged.

## Database

`NorbixApi.database` is for your app's end users (records, their own records,
term reading). `NorbixHub.database` is for your back office: it manages the
schemas, taxonomies, integrations, schema triggers and saved aggregates, and it
reads and writes records with the project's rights. Every method takes the path
values as named arguments plus optional `query`, `body` (not on GET) and
`headers`, and returns the decoded JSON.

```dart
final api = NorbixApi();
final hub = NorbixHub();

// Records — the same calls exist on both clients
await hub.database.insertRecord(
  collectionName: 'orders',
  body: {'document': '{"title":"First"}'},
);
await hub.database.findRecords(
  collectionName: 'orders',
  query: {'pageSize': 20, 'pageNumber': 0},
);
await api.database.findOwn(collectionName: 'orders'); // only the caller's records

// Schemas
await hub.database.getDatabaseSchemaListSettings(id: schemaId);
await hub.database.updateDatabaseSchemaListSettings(id: schemaId, body: {...});
await hub.database.updateDatabaseSchemaEmbed(id: schemaId, body: {...});
await hub.database.applyDatabaseSchemaBundle(body: {...});

// Taxonomy trees
await hub.database.getDatabaseTaxonomyTree();
await hub.database.getDatabaseTaxonomyTermTree(taxonomyName: 'services');
await hub.database.getDatabaseMergedTermTree(taxonomyName: 'services');
await api.database.findMergedTermTree(taxonomyName: 'services');

// Try an aggregation pipeline before you save it
await hub.database.testDatabaseAggregate(body: {...});
```

| Area | `NorbixHub.database` | `NorbixApi.database` |
| --- | --- | --- |
| Records | `findRecords`, `findOneRecord`, `insertRecord`, `insertManyRecords`, `updateOneRecord`, `updateManyRecords`, `replaceRecord`, `deleteRecord`, `deleteManyRecords`, `countRecords`, `distinctRecordValues`, `aggregateRecords`, `executeRecordsAggregate`, `changeRecordResponsibility`, `seedCollectionRecords`, `getCollectionIndexes` | `find`, `findOne`, `findOwn`, `insertOne`, `insertMany`, `updateOne`, `updateMany`, `replaceOne`, `deleteOne`, `deleteMany`, `count`, `distinct`, `aggregate`, `executeAggregate`, `changeResponsibility` |
| Schemas | `getDatabaseSchemas`, `getDatabaseSchema`, `saveDatabaseSchema`, `renameDatabaseSchema`, `deleteDatabaseSchema`, `getDatabaseSchemaDraft`, `updateDatabaseSchemaDraft`, `discardDatabaseSchemaDraft`, `publishDatabaseSchema`, `getDatabaseSchemaVersions`, `getDatabaseSchemaVersionDiff`, `updateDatabaseSchemaSettings`, `getDatabaseSchemaListSettings`, `updateDatabaseSchemaListSettings`, `updateDatabaseSchemaEmbed`, `applyDatabaseSchemaBundle` | `getDatabaseSchemas`, `getDatabaseSchema` |
| Taxonomies and terms | `getDatabaseTaxonomies`, `getDatabaseTaxonomy`, `saveDatabaseTaxonomy`, `deleteDatabaseTaxonomy`, `getDatabaseTaxonomyTerm`, `saveDatabaseTaxonomyTerm`, `updateDatabaseTaxonomyTerm`, `deleteDatabaseTaxonomyTerm`, `deleteManyDatabaseTaxonomyTerms`, `getDatabaseTaxonomyTree`, `getDatabaseTaxonomyTermTree`, `getDatabaseMergedTermTree` | `findTerms`, `findTermsChildren`, `findTermTree`, `findTaxonomyTree`, `findMergedTermTree` |
| Schema triggers | `getSchemaTriggers`, `getSchemaTrigger`, `saveSchemaTrigger`, `enableSchemaTrigger`, `disableSchemaTrigger`, `deleteSchemaTrigger` | — |
| Integrations | `getDatabaseIntegrations`, `getDatabaseIntegration`, `saveDatabaseIntegration`, `testDatabaseIntegration`, `enableDatabaseIntegration`, `disableDatabaseIntegration`, `setDatabaseIntegrationAsDefault`, `deleteDatabaseIntegration`, `getAllowedFlexTiers`, `revealManagedFlexConnectionString` | — |
| Saved aggregates | `getDatabaseAggregates`, `getDatabaseAggregate`, `saveDatabaseAggregate`, `testDatabaseAggregate`, `deleteDatabaseAggregate` | — |
| Module | `enableDatabase`, `disableDatabase` | — |

Each taxonomy in `getDatabaseTaxonomies` now also carries `description`,
`dependencies`, `parentName` and `dependencyNames`.

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
final res = await api.database.findTerms(taxonomyName: 'services');
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
final res = await api.database.findTerms(
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
final res = await api.database.findTermsChildren(
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
final res = await api.database.findTermsChildren(
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
final res = await api.database.findTermTree(taxonomyName: 'services');
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
final res = await api.database.findTermTree(
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
final res = await api.database.findTaxonomyTree();
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
final res = await api.database.findTaxonomyTree(
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

## Files

### Public file links

A file or a whole folder can be made readable by anyone holding its link.
Publishing is a Hub action and needs your key; *reading* the link needs
nothing at all.

```dart
final hub = NorbixHub(config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'));

// Publish one file, or a whole folder prefix (one record, however many
// files sit under it, at any depth — the root cannot be published).
await hub.files.makeFilePublic(
  body: {'filesIntegrationId': 'nbin_1', 'path': 'docs/invoice.pdf'},
);
await hub.files.makeFolderPublic(
  body: {'filesIntegrationId': 'nbin_1', 'path': 'docs'},
);

// Take it back. makeFilePrivate is refused while a folder above the file
// is public — switch the folder off instead.
await hub.files.makeFilePrivate(
  body: {'filesIntegrationId': 'nbin_1', 'path': 'docs/invoice.pdf'},
);
await hub.files.makeFolderPrivate(
  body: {'filesIntegrationId': 'nbin_1', 'path': 'docs'},
);
```

Reading a published file is the one call in this SDK that goes out with **no**
credentials — the link has to work in an e-mail, in an `<img src>`, or in a
browser on a stranger's phone. It answers with the raw bytes:

```dart
final api = NorbixApi();
final bytes = await api.files.getPublicFile(
  publicId: 'nbpf_abc',
  name: '2026/q1/report.pdf', // slashes stay slashes for a folder link
);
```

Every miss — unknown id, wrong name, made private again, file gone — is the
same plain `404`, on purpose: a more precise answer would tell a stranger that
the file exists.

### Testing an integration before you save it

`hub.files.testFilesIntegration` tries the credentials against the storage
provider and answers whether they work. Nothing is saved — use it before
`saveFilesIntegration` to tell a bad key from a bad bucket.

### Testing a saved integration from the API

`api.files.testFilesIntegration` runs a live probe against an integration that
is already saved: it uploads a small file, reads it, lists the folder and
deletes the file again. It answers one entry per step. Because it writes to the
storage, the API key needs the `files:create` permission.

```dart
final api = NorbixApi(config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'));
final res = await api.files.testFilesIntegration(filesIntegrationId: 'nbin_1')
    as Map<String, dynamic>;
for (final step in res['items'] as List) {
  print('${step['operation']}: ${step['result']}'); // UploadFile: OK, GetFile: OK, ...
}
```

## Notifications

### Preview a notification with its signed link (no sign-in)

The push, email and SMS preview routes open with the signed link (`hash`)
alone — no API key or bearer token needed. When the client does have a
credential it is still sent; without one the SDK sends no credential header
and does not throw.

```dart
final hub = NorbixHub(); // no apiKey, no bearerToken
final preview = await hub.emailNotifications.previewEmailNotification(
  query: {'hash': signedLink},
);
// also: hub.pushNotifications.previewPushNotification(...),
//       hub.smsNotifications.previewSmsNotification(...)
```

A signed-in member can pass `projectId` + `notificationId` in `query`
instead of `hash`. A bad or expired link throws `NorbixAuthError` (401).

### SMS

`hub.smsNotifications` covers every SMS Hub endpoint (34): the module
switch (`enableSms`, `disableSms`, `getSmsDisableDependencies`,
`getSmsSettings`), integrations (`getSmsIntegrations`, `getSmsIntegration`,
`saveSmsIntegration`, `testSmsIntegration`,
`confirmSmsIntegrationHumanDelivery`, `deleteSmsIntegration`,
`setSmsIntegrationAsDefault`, `enableSmsIntegration`,
`disableSmsIntegration`), templates (`getSmsTemplates`, `getSmsTemplate`,
`createSmsTemplate`, `updateSmsTemplate`, `deleteSmsTemplate`,
`archiveSmsTemplate`, `unArchiveSmsTemplate`, `cloneSmsTemplate`,
`getSmsMessageContentTokens`, `renderSms`) and campaigns
(`getSmsCampaigns`, `createSmsCampaign`, `getSmsCampaign`,
`deleteSmsCampaign`, `stopSmsCampaign`, `getSmsCampaignStatistics`,
`getSmsCampaignBatches`, `getSmsCampaignBatchNotifications`,
`getSmsCampaignBatchNotification`, `getSmsCampaignMessages`), plus
`previewSmsNotification` above.

```dart
final hub = NorbixHub(config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'));

// What would a module switch-off affect? Ask before disableSms().
final deps = await hub.smsNotifications.getSmsDisableDependencies();

// Render a template's Razor code with token values before saving it.
final text = await hub.smsNotifications.renderSms(
  body: {
    'code': 'Hi @Model.FirstName, your code is @Model.Code',
    'tokens': [
      {'name': 'FirstName', 'value': 'Ada'},
      {'name': 'Code', 'value': '4242'},
    ],
  },
);

// Send to account users (the owner and team members). Members without a
// phone number are skipped — each member saves their own with
// hub.accounts.updateMyAccountUserPhone (see Account below).
await hub.smsNotifications.createSmsCampaign(body: {
  'templateId': 'tmpl_1',
  'integrationId': 'nbin_1',
  'deliveryType': 'AccountUsers',
  'accountUsers': {
    'recipientsSourceType': 'AccountUsers',
    'recipients': ['usr_owner', 'usr_member'],
    'campaignTime': 1767225600, // unix seconds, UTC
  },
});

// Only one campaign: filter the list by its id.
final one = await hub.smsNotifications.getSmsCampaigns(
  query: {'campaignId': 'cmp_1'},
);

// Stop a running campaign — no further messages go out; this cannot be undone.
await hub.smsNotifications.stopSmsCampaign(id: 'cmp_1');
```

The SMS template content has a `body` only — there is no `subject` (the
sender is the integration). A campaign lists `createdById`, the user who
created it.

Ids travel in the path under the gateway's own names: `stopSmsCampaign(id:)`
calls `POST /{version}/notifications/sms/campaigns/{Id}/stop`.
Gone because their routes no longer exist on the gateway:
`smsRazorSyntaxCheck` (`renderSms` is the replacement) and the one-message
calls `getSmsCampaignMessage`, `getEmailCampaignMessage` and
`getPushCampaignMessage` (`GET …/campaigns/{campaignId}/messages/{id}`) —
read the campaign's messages with `get*CampaignMessages(campaignId:)`, or one
message of a batch with `get*CampaignBatchNotification`.

### Your own team-member record and phone

Two calls on `hub.accounts` work on the signed-in person only — never on
another member, so there is no user id:

| Method | Call |
|--------|------|
| `getMyAccountUserProfile()` | `GET /{version}/account/me` — your own team-member (or owner) record in `item`; `item.generalInfo.phone` is your phone number. Not the organisation profile (`getAccountProfile`). |
| `updateMyAccountUserPhone(body:)` | `PUT /{version}/account/me/phone` — save your phone number (`{'phone': '+37060000000'}`, E.164); an empty `phone` clears it |

"Account users" SMS campaigns send to this number; a member without one is
skipped.

```dart
final me = await hub.accounts.getMyAccountUserProfile();
await hub.accounts.updateMyAccountUserPhone(body: {'phone': '+37060000000'});
```

## Scheduler

`hub.scheduler` runs a task on a cron schedule. **Only `EmailCampaign`
tasks run today**: each run sends an email campaign. The 8 methods:

| Method | Call |
|--------|------|
| `enableScheduler()` | `PUT /{version}/scheduler/enable` — turn the module on |
| `disableScheduler()` | `PUT /{version}/scheduler/disable` — turn the module off |
| `getSchedulerTasks(query:)` | `GET /{version}/scheduler/tasks` — optional `type`, `enabled`, `pageSize`, `startingAfter` in the query |
| `getSchedulerTask(id:)` | `GET /{version}/scheduler/tasks/{id}` |
| `saveSchedulerTask(body:)` | `POST /{version}/scheduler/tasks` — create, or update when `taskId` is set |
| `deleteSchedulerTask(id:)` | `DELETE /{version}/scheduler/tasks/{id}` |
| `enableSchedulerTask(id:)` | `PUT /{version}/scheduler/tasks/{id}/enable` |
| `disableSchedulerTask(id:)` | `PUT /{version}/scheduler/tasks/{id}/disable` |

```dart
final hub = NorbixHub(config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'));

await hub.scheduler.enableScheduler();

// Every Monday at 09:00 UTC, email every project user with template tmpl_1.
final saved = await hub.scheduler.saveSchedulerTask(body: {
  'name': 'Weekly digest',
  'cron': '0 9 * * 1',            // 5 fields, evaluated in UTC
  'initiatorUserId': 'usr_1',     // you, or a project service user
  'isEnabled': true,
  'stopOnError': false,
  'task': {
    'type': 'EmailCampaign',      // the only task type today
    'campaign': {
      'source': 'AllUsers',
      'templateId': 'tmpl_1',
    },
    // 'databaseIntegrationId': '...', // optional
  },
});
// saved == {'id': 'tsk_…', ...}

final tasks = await hub.scheduler.getSchedulerTasks(
  query: {'type': 'EmailCampaign', 'enabled': true},
);
```

Good to know:

- `cron` has exactly 5 fields (minute, hour, day of month, month, day of
  week) and runs in UTC. A 6-field (seconds) expression is refused.
- `initiatorUserId` (`usr_…`) is required: the task runs as this user. It
  must be the caller or a service user of the project.
- `task.type` is the discriminator. `task.campaign` takes the same shape as
  an email campaign (`source` + `templateId` + the source's own fields, for
  example `rolesNames` / `userTags` for `AllUsers`). The typed shape is
  `EmailCampaignSchedulerTaskRequest` in `references/hub.dtos.dart`.
- Module `enableScheduler` / `disableScheduler` send **PUT** since this
  version (they sent GET before; the gateway changed the route).

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

## Versioning

The major version is frozen at **v2** until the public launch.

- A breaking change is released as a **minor** (for example v2.2.0 → v2.3.0), never as a new major.
- Write it as `feat(<scope>): <what>` and add a line `Breaking: <what changed and what callers must do>` in plain words, in the pull-request body and in the commit message.
- Never mark it the conventional-commits way: no `!` in the title (`feat!:`), no BREAKING CHANGE footer. The `PR title` check fails a pull request that does.
- As a safety net, the release config (`.releaserc.json` → `releaseRules`) maps breaking commits to a minor, so one that slips through still does not bump the major.

## Releases

Versioned with Conventional Commits + `semantic-release`:

- `feat:` — minor
- `fix:` — patch
- breaking change — minor until the public launch (see Versioning)

Channels: `main` → stable, `next` → `-rc.*`, `beta` → `-beta.*`.

On a push to `main`, `release.yml` runs analyze + tests, and semantic-release
creates the `vX.Y.Z` tag and GitHub Release. It then starts `publish.yml` on
that tag, which publishes to pub.dev with automated publishing (OIDC) — no
stored credential. `main` is protected, so nothing is committed back:
`pubspec.yaml` and `CHANGELOG.md` are stamped with the version only inside the
publish job. To re-publish a tag, run **Publish to pub.dev** from the Actions
tab with that tag selected.

## End-user AI chat and project AI settings

`api.aiChat` is the end-user AI chat for a signed-in project user: availability,
sessions, entries, feedback, attachments, memory and `startEndUserChatTurn`,
which answers at once with a `turnId`. The answer streams over the gateway's
SSE endpoint on the user's own channel `ai-chat:{projectId}:{authId}`
(events `ai.chat.turn.*`, `ai.chat.session.*`); a subscription to another
user's channel is refused with 403 and
`responseStatus.errorCode = "AiChatChannelRefused"` before the stream starts —
do not retry it. This SDK has no SSE client.

```dart
final turn = await api.aiChat.startEndUserChatTurn(
  body: {'sessionId': sessionId, 'message': 'What can you do?'},
);
```

Project owners configure the assistant on the Hub: `hub.projects`
(`getProjectAiSettings`, `updateProjectAiSettings`, `createProjectAiAssistant`,
`updateProjectAiAssistant`, `deleteProjectAiAssistant`, `getProjectAiUsage`,
`setAdminPortalEnabled`) and `hub.aiIntegrations` (`getEmbeddingIntegrations`,
`saveEmbeddingIntegration`, `getEmbeddingIntegration`,
`deleteEmbeddingIntegration`, `testEmbeddingIntegration`,
`setLlmIntegrationAsDefault`, and the LLM / MCP integration switches
`enableLlmIntegration`, `disableLlmIntegration`, `deleteLlmIntegration`,
`enableMcpIntegration`, `disableMcpIntegration`, `deleteMcpIntegration`).

## Project settings, public config, MCP endpoint and AI service users

Project settings on `hub.projects`:

| Method | Route |
|--------|-------|
| `updateProjectAdminUrl` | `PATCH /{version}/account/projects/{projectId}/settings/admin-url` |
| `updateProjectLegalDocuments` | `PATCH /{version}/account/projects/{projectId}/settings/legal` |
| `updateProjectExposeLegal` | `PATCH /{version}/account/projects/{projectId}/settings/legal/expose` |
| `updateProjectExposeBrand` | `PATCH /{version}/account/projects/{projectId}/settings/brand/expose` |
| `updateProjectExposeAuth` | `PATCH /{version}/account/projects/{projectId}/settings/auth/expose` |
| `getAdminPortalStructure` | `GET /{version}/account/projects/{projectId}/admin-portal/structure` |
| `assignAdminPortalServiceUser` | `PUT /{version}/account/projects/{projectId}/settings/admin-portal/service-user` |

```dart
await hub.projects.updateProjectLegalDocuments(
  projectId: projectId,
  body: {'termsMarkdown': '# Terms', 'privacyMarkdown': '# Privacy'},
);
await hub.projects.updateProjectExposeLegal(projectId: projectId, body: {'exposed': true});
// Show the brand and the sign-in settings in the Admin Portal.
await hub.projects.updateProjectExposeBrand(projectId: projectId, body: {'exposed': true});
await hub.projects.updateProjectExposeAuth(projectId: projectId, body: {'exposed': true});
```

Public project routes on the API host, `api.publicProjects`. They need no
sign-in and go out **without credentials**, even when the client has a key:

| Method | Route |
|--------|-------|
| `getPublicProjectConfig` | `GET /{version}/public/projects/{ProjectId}/config` |
| `getPublicProjectLegal` | `GET /{version}/public/projects/{ProjectId}/legal/{Kind}` (`terms` or `privacy`) |

```dart
final terms = await NorbixApi().publicProjects
    .getPublicProjectLegal(projectId: projectId, kind: 'terms');
// {kind: terms, title: ..., body: <markdown>, available: true}
```

The developer MCP endpoint and AI service users on `hub.accounts`:

| Method | Route |
|--------|-------|
| `sendMcpMessage` | `POST /{version}/account/mcp` — one JSON-RPC 2.0 message |
| `openMcpStream` | `GET /{version}/account/mcp` — server-to-client SSE stream |
| `endMcpSession` | `DELETE /{version}/account/mcp` — ends the `mcp-session-id` session |
| `createAiServiceUser` | `POST /{version}/account/ai/service-users` |
| `listAiServiceUsers` | `GET /{version}/account/ai/service-users` |
| `rotateAiServiceUserKey` | `POST /{version}/account/ai/service-users/{Id}/keys` |
| `revokeAiServiceUserKey` | `DELETE /{version}/account/ai/service-users/{Id}/keys/{KeyId}` |
| `deleteAiServiceUser` | `DELETE /{version}/account/ai/service-users/{Id}` |

```dart
final init = await hub.accounts.sendMcpMessage(message: {
  'jsonrpc': '2.0', 'id': 1, 'method': 'initialize',
  'params': {'protocolVersion': '2025-11-25', 'capabilities': {}, 'clientInfo': {'name': 'my-app', 'version': '1.0'}},
});
final sessionId = init.sessionId!; // from the Mcp-Session-Id header

final tools = await hub.accounts.sendMcpMessage(
  message: {'jsonrpc': '2.0', 'id': 2, 'method': 'tools/list'},
  sessionId: sessionId,
);
print(tools.json); // {jsonrpc: 2.0, id: 2, result: {tools: [...]}}

await hub.accounts.endMcpSession(sessionId: sessionId);
```

The MCP methods return an `McpResponse` — status, `sessionId`, `json`, and the
raw `body` — because the session id travels in a response header and a
`tools/call` may answer with an SSE stream (`isEventStream`, raw text in
`body`). This SDK has no SSE client, so `openMcpStream` completes only when the
server closes the stream. A service user key (`nbsu_...`) used as the client's
key narrows the MCP tools to that user's scope.
