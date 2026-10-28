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
| `NorbixApi` | `aiChat`, `apiKeys`, `auth`, `code`, `database`, `files`, `logs`, `payments`, `publicProjects`, `userAuth`, `users` |
| `NorbixHub` | `accounts`, `aiIntegrations`, `apiKeys`, `auth`, `code`, `contacts`, `database`, `echo`, `emailNotifications`, `emailUnsubscribe`, `environments`, `files`, `integrations`, `logs`, `membership`, `payments`, `projects`, `pushNotifications`, `scheduler`, `smsNotifications`, `userNotificationPreferences`, `webhooks` |

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

### Language

Ask for responses in a language. The value is sent verbatim as the
standard `Accept-Language` header — one tag (`lt`, `lt-LT`) or a
q-weighted list (`lt-LT, en;q=0.8`). The gateway honours the q-values,
falls back to the project default language when nothing matches, and
reports the language it used in the `Content-Language` response header.
**There is no default language**: when none is set, no header is sent.

```dart
// 1) At construction
final hub = NorbixHub(language: 'lt');
final api = NorbixApi(language: 'lt-LT, en;q=0.8');

// 2) From environment variables
final hub = NorbixHub.fromEnv();   // reads NORBIX_HUB_LANGUAGE
final api = NorbixApi.fromEnv();   // reads NORBIX_API_LANGUAGE

// 3) At runtime
hub.setLanguage('en');             // subsequent requests ask for English
print(hub.language);               // 'en'
hub.setLanguage(null);             // clear — no header, project default

// 4) Per call (wherever a per-call `region:` is accepted)
await hub.accounts.getAccountRegions(language: 'de');
```

(`NorbixConfig.fromEnv` also takes a `languageVar:` name, default
`NORBIX_LANGUAGE`.) The old `cultureCode` field and the `CultureCode` /
`norbix-language` headers are gone from the gateway — use this option.

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

// Update or delete EVERY record: an empty filter needs allRecords
await api.database.updateMany(
  collectionName: 'orders',
  body: {'filter': '{}', 'update': '{"archived":true}', 'allRecords': true},
);
await hub.database.deleteManyRecords(
  collectionName: 'orders',
  body: {'filter': '{}', 'allRecords': true},
);

// Read references as { id, display } instead of bare ids
final page = await api.database.find(
  collectionName: 'orders',
  expandReferences: true,
) as Map<String, dynamic>;
final order = jsonDecode((page['result'] as List).first as String) as Map<String, dynamic>;
final customer = ExpandedReference.maybeFrom(order['customer']);
print(customer?.displayText()); // "Jane Doe", or null when the customer is gone

// Nested forms and arrays: dotted paths, and arrayFilters for $[name]
await api.database.updateOne(
  collectionName: 'orders',
  id: orderId,
  body: {'update': '{"address.city":"Vilnius","lines.$[line].qty":3}'},
  arrayFilters: [
    {'line.sku': 'A-1'},
  ],
);

// Import a CSV / JSON file into a collection
final upload = await hub.database.requestImportUploadUrl(body: {...});
await hub.database.analyzeImportFile(body: {...});
final created = await hub.database.createCollectionImport(body: {...});
await hub.database.getCollectionImport(id: importId);
```

| Area | `NorbixHub.database` | `NorbixApi.database` |
| --- | --- | --- |
| Records | `findRecords`, `findOneRecord`, `insertRecord`, `insertManyRecords`, `updateOneRecord`, `updateManyRecords`, `replaceRecord`, `deleteRecord`, `deleteManyRecords`, `countRecords`, `distinctRecordValues`, `aggregateRecords`, `executeRecordsAggregate`, `changeRecordResponsibility`, `seedCollectionRecords`, `getCollectionIndexes` | `find`, `findOne`, `findOwn`, `insertOne`, `insertMany`, `updateOne`, `updateMany`, `replaceOne`, `deleteOne`, `deleteMany`, `count`, `distinct`, `aggregate`, `executeAggregate`, `changeResponsibility` |
| Schemas | `getDatabaseSchemas`, `getDatabaseSchema`, `saveDatabaseSchema`, `renameDatabaseSchema`, `deleteDatabaseSchema`, `getDatabaseSchemaDraft`, `updateDatabaseSchemaDraft`, `discardDatabaseSchemaDraft`, `publishDatabaseSchema`, `getDatabaseSchemaVersions`, `getDatabaseSchemaVersionDiff`, `updateDatabaseSchemaSettings`, `getDatabaseSchemaListSettings`, `updateDatabaseSchemaListSettings`, `getDatabaseSchemaIndexStatus`, `updateDatabaseSchemaEmbed`, `applyDatabaseSchemaBundle` | `getDatabaseSchemas`, `getDatabaseSchema` |
| Taxonomies and terms | `getDatabaseTaxonomies`, `getDatabaseTaxonomy`, `saveDatabaseTaxonomy`, `deleteDatabaseTaxonomy`, `getDatabaseTaxonomyTerm`, `saveDatabaseTaxonomyTerm`, `updateDatabaseTaxonomyTerm`, `deleteDatabaseTaxonomyTerm`, `deleteManyDatabaseTaxonomyTerms`, `getDatabaseTaxonomyTree`, `getDatabaseTaxonomyTermTree`, `getDatabaseMergedTermTree` | `findTerms`, `findTermsChildren`, `findTermTree`, `findTaxonomyTree`, `findMergedTermTree` |
| Schema triggers | `getSchemaTriggers`, `getSchemaTrigger`, `saveSchemaTrigger`, `enableSchemaTrigger`, `disableSchemaTrigger`, `deleteSchemaTrigger` | — |
| Integrations | `getDatabaseIntegrations`, `getDatabaseIntegration`, `saveDatabaseIntegration`, `testDatabaseIntegration`, `enableDatabaseIntegration`, `disableDatabaseIntegration`, `setDatabaseIntegrationAsDefault`, `deleteDatabaseIntegration`, `getAllowedFlexTiers`, `revealManagedFlexConnectionString` | — |
| Saved aggregates | `getDatabaseAggregates`, `getDatabaseAggregate`, `saveDatabaseAggregate`, `testDatabaseAggregate`, `deleteDatabaseAggregate` | — |
| Collection imports | `requestImportUploadUrl`, `analyzeImportFile`, `createCollectionImport`, `getCollectionImports`, `getCollectionImport`, `deleteCollectionImport` | — |
| Module | `enableDatabase`, `disableDatabase` | — |

Each taxonomy in `getDatabaseTaxonomies` also carries `description`,
`dependencies`, `parentName` and `dependencyRefs`. `dependencyRefs` is a list
of `{ "id": ..., "name": ... }` pairs in the same order as `dependencies`; a
dependency whose taxonomy no longer exists keeps its place with
`"name": null`. (It replaces the old `dependencyNames` list of plain names.)

Each saved aggregate (`getDatabaseAggregate`, `getDatabaseAggregates`) carries
`joinedCollections`: the collections its pipeline joins (`$lookup`). A schema
whose collection a saved aggregate joins cannot be deleted — see
`CM-ERRORS-SCHEMA-018` below.

Schema triggers are kept per environment. `getSchemaTriggers` lists only the
triggers of the client's env (`NorbixConfig.env`, PROD when not set), and
each row and `getSchemaTrigger` carry `env`. `getSchemaTrigger` returns the
owning schema id (`sch_…`) in `schemaId`. Enable, disable and delete act on
the copy in the client's env; when that env has no copy the call fails with
`CM-ERRORS-TRIGGERS-002`. Saving a trigger id that belongs to another schema
fails the same way.

When several triggers fire for the same event they run as a queue. Two
optional fields on `trigger` (every save: schema, membership, files and
payments triggers) shape it: `order` — a whole number, 0 or more; lower runs
earlier, a trigger without an order runs after the numbered ones, equal places
run by name — and `breakOnError` — `true` stops the later triggers of the same
event when this trigger's action fails (default `false`). Both come back on the
get and list calls; a negative `order` fails with `CM-ERRORS-TRIGGERS-008`.

```dart
await hub.database.saveSchemaTrigger(body: {
  'trigger': {
    'type': 'Schema',
    'schemaId': 'sch_orders',
    'name': 'notify ops first',
    'when': 'OnInserted',
    'isEnabled': true,
    'order': 1,
    'breakOnError': true,
    'action': {'type': 'WebhookCall'},
  },
});
```

`deleteDatabaseSchema` also drops the schema's records: its MongoDB
collection, with its indexes, in the request env (in every active database
integration of that env). For a schema with AI embed on, its records are also
removed from the AI knowledge. The delete is still refused when a saved
aggregate or a schema trigger uses the schema — nothing is dropped then. The
request and response shape did not change, and a retry is safe.

`renameDatabaseSchema` takes `{ "title": ... }` only. A rename to a name that
another schema in the same env already uses is always refused
(`CM-ERRORS-SCHEMA-002`); there is no flag to skip that check.

### Nested forms, arrays and references

The data schema (`getDatabaseSchema` / `getDatabaseSchemas`, the `$fieldType`
union) grew for the schema-content contract. The SDK hands the schema back as
decoded JSON; the shapes are in `references/hub.dtos.dart` and
`references/api.dtos.dart`:

| Field type | What it is | Keys |
| --- | --- | --- |
| `ObjectFieldDto` | a nested form — a closed sub-document with its own fields | `properties` (a list of fields, recursive), `required` |
| `ArrayFieldDto` | a list of one item type — a primitive, a reference, a nested form, another list | `items` (one field, recursive), `minItems`, `maxItems`, `uniqueItems` |
| `JsonFieldDto` | a free-form JSON object (`type: object`, `additionalProperties: true`, no `properties`) | `maxBytes` (BSON size cap, up to 1 MiB) |
| `CurrencyDefaultDto` | the `default` of a currency field | `value`, `currency` |

Nesting goes up to 5 levels (`CM-ERRORS-SCHEMA-036` beyond). Existing field
types gained keys: `default` and `unique` on string, decimal and integer;
`default` on date, boolean, currency, tags and enum; `minItems` / `maxItems`
on tags and file; `allowedFileType` / `maxSizeMb` on file; `multipleOf`,
`minimum` / `maximum` on currency; `displayField` on every reference kind
(required for collection and user references, `title` | `slug` for a
taxonomy, `name` for a role). A role reference stores the role **id**
(`pr_…_nr_…`), never its name.

**Reading references.** `find`, `findOne`, `findOwn` (API) and
`findRecords`, `findOneRecord` (Hub) take `expandReferences: true`. Every
reference value then comes back as `{ "id": ..., "display": ... }` — a list
of them for a `multiple` field, in place inside nested forms and array items.
`display` is the target's `displayField` (a user property, the role name,
the term's name or slug, the named field of the target record); it is `null`
when the target is gone. `ExpandedReference.maybeFrom(value)`,
`ExpandedReference.listFrom(value)`, `isMissing` and
`displayText(language: 'en')` read the value out of the decoded record. The
caller needs read permission on **every** source the schema links to
(users, roles, the taxonomy, the target collection, the files integration);
otherwise the read is refused with `CM-ERRORS-DATABASE-056` naming the
source — read again without the flag to get the ids. Left unset, nothing is
added to the request and the response is what it was.

**Writing nested data.** The `update` document of `updateOne` / `updateMany`
(and the Hub pair) reaches nested data through dotted paths:
`{"address.city": "Vilnius"}` (a member), `{"lines.2.qty": 3}` (an element by
index), `{"lines.$[].qty": 1}` (every element), `{"lines.$[line].qty": 3}`
together with `arrayFilters: [{'line.sku': 'A-1'}]` (the elements a filter
matches; one filter per `$[name]`). `arrayFilters` takes a Dart list (encoded
for you) or the JSON string, and is added to the map `body` as
`arrayFilters`. A record's nested form is closed — an undeclared member is
refused (`-047`); the root stays open. Filters pass through to MongoDB
(`{"address.city": "Vilnius"}`, `$elemMatch`), `sortBy` and `distinct` take a
dotted path through nested forms (`address.city`) but not through a list
(`lines.qty`, `tags` — `-039`: a list cannot be paged on).

**Terms.** Every term row (`findTerms`, `findTermsChildren`, the trees;
Hub term reads) carries `slug` — lower-case, derived from the name on insert
and on rename, unique within the taxonomy (`springfield`, `springfield-2`).
`saveDatabaseTaxonomyTerm` / `updateDatabaseTaxonomyTerm` accept an explicit
`slug` in the document; one another term already has is refused
(`CM-ERRORS-TAXONOMIES-012`). A legacy term shows `slug: null`.

### Database rules and error codes

| Situation | What happens |
| --- | --- |
| `updateMany` / `deleteMany` (and Hub `updateManyRecords` / `deleteManyRecords`) with an empty filter `{}` and no `allRecords: true` | refused, `CM-ERRORS-DATABASE-037`. For update-many a missing filter counts as `{}`. |
| `updateOne` / `updateMany` body with `$` operators (`$inc`, `$set`, …) | refused, `CM-ERRORS-DATABASE-035`. Send the new field values, not operators. |
| `insertOne` / `insertMany` / `replaceOne` with a broken document | `CM-ERRORS-DATABASE-036` "Invalid record document"; for insert-many `error.errors.first.context['Index']` names the bad document. |
| `findTerms` / `findTermsChildren` filter with `$where`, `$function` or `$accumulator` | refused, `CM-ERRORS-DATABASE-031`. |
| `changeResponsibility` to someone who is not a user of the project in that env | refused, `CM-ERRORS-MEMBERSHIP-USERS-012`. |
| Deleting a schema that a saved aggregate joins | refused, `CM-ERRORS-SCHEMA-018`; `context['BlockerAggregateNames']` lists the aggregates. |
| A term read by an unknown taxonomy name | `CM-ERRORS-TAXONOMIES-010` (the merged tree used to answer `-003`). |
| A term read with a taxonomy name over 40 characters | `CM-ERRORS-TAXONOMIES-005`. |
| A whole-taxonomy, merged or `includeTerms` tree with more than 5000 terms | `CM-ERRORS-TAXONOMIES-011`. `getDatabaseTaxonomyTree(query: {'includeTerms': true})` now fails when the term read fails, instead of returning taxonomies without terms. |
| Update, replace or change-owner on a soft-deleted record | "not found"; update-many skips soft-deleted records. |
| A record value that breaks a schema keyword | one code per keyword, `context['FieldName']` is the full path (`customer.address.zip`, `lines[0].qty`) and `context['Keyword']` names the rule: `CM-ERRORS-DATABASE-030` required · `-039` type (also a single value on a `multiple` field, a sort through a list) · `-040` length (`minLength` / `maxLength`, `minItems` / `maxItems`, a JSON field over `maxBytes`) · `-041` pattern · `-042` format (email / uri / uuid, a file id, a currency code) · `-043` range (`minimum` / `maximum`) · `-044` multipleOf · `-045` enum · `-046` uniqueItems · `-047` properties (a currency / geolocation member missing or unknown, an undeclared member in a nested form) · `-048` coordinates · `-049` translateOptions. |
| A reference id whose target does not exist | `CM-ERRORS-DATABASE-050` user · `-051` role (a role **name** is refused too — store the id) · `-052` taxonomy term · `-053` record of the target collection · `-054` file; `context['MissingId']` names it. `-055` when the target itself cannot be read (the taxonomy is not in the project, the files integration cannot be opened). |
| `expandReferences: true` by a caller without read on a linked source | refused, `CM-ERRORS-DATABASE-056`; `context` carries `SourceKind`, `Source`, `Fields`, `MissingPermissions` — one error per source. |
| `arrayFilters` that do not pair with the `$[name]` paths of the update, or an update whose paths overlap (`address` and `address.city`) | refused, `CM-ERRORS-DATABASE-014` (wrapped in `CM-ERRORS-PROPERTY-002` on `Update` / `ArrayFilters`). |
| Saving a schema nested deeper than 5 levels / whose `default` breaks the field's own rules / whose nested `required` names an undeclared field | `CM-ERRORS-SCHEMA-036` / `-037` / `-038`. A schema key the meta schema does not know is `-010` with the key named; a numeric keyword outside what its type holds is `-022`. |
| A collection reference whose `displayField` is not a field of the target schema; a draft, rename or delete on a schema another schema's reference shows | `CM-ERRORS-SCHEMA-039` / `-040` / `-041`; the dependents are named. |
| A term saved with an explicit `slug` another term of the taxonomy has / a slug with no letter or digit left | `CM-ERRORS-TAXONOMIES-012` / `-013`. |

Rights that changed:

- A caller with only own-record rights (`createAsUser`, `updateOwn`,
  `deleteOwn`) may call `insertMany`, `updateMany` and `deleteMany`; the call
  touches only that caller's own records (it used to be a 403).
- `testDatabaseAggregate` needs `database:create` or `database:update` on the
  aggregate, plus read. A key with read only is refused.
- `saveDatabaseTaxonomy` with the `viewId` of an existing taxonomy is an
  update and needs `database:update` on that taxonomy; without a `viewId` it
  is a create and needs `database:create`.
- Term reads by taxonomy name (term list, children, term tree, merged tree)
  need `database:read` on `database:term:<taxonomy id>`; the merged tree also
  needs it on every nested taxonomy.

Each of these errors arrives as a `NorbixError` (see [Errors](#errors)):
read `error.errorCode` and `error.errors`.

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

### A file by its id

A file's id is stable: every listing, `getFileInfo`, this call and a record's
file field name the same file by the same id (a moved file gets a new id).
`id` is the `nbfl_…` value the Files endpoints return, or its bare UUID —
a record's file field accepts both.

```dart
// API — the path carries both values
final info = await api.files.getFileById(
  filesIntegrationId: 'nbin_1',
  id: 'nbfl_abc',
) as Map<String, dynamic>;
print(info['file']['fileName']); // the getFileInfo shape: file, isPublic, publicUrl

// Hub — the same answer, the values go as query parameters
await hub.files.getFileById(filesIntegrationId: 'nbin_1', id: 'nbfl_abc');
```

An id no file of the integration has is a `404` (`NorbixNotFoundError`).

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

## Keyless cloud connections

The AWS (S3, SES, Lambda) and Azure (Blob, Communication Services, Functions)
save requests take `authMode`: `Keyless` (the gateway default when left out)
or `AccessKey`. Keyless stores no secret: ask for the setup, run the script it
returns in the cloud account, then save with the same integration id and the
role ARN (AWS) or tenant + client id (Azure). A key mode needs
`acceptKeyRisk: true`, or the save is refused (`CM-ERRORS-INTEGRATIONS-034`).

```dart
final setup = await hub.integrations.getKeylessIntegrationSetup(
  query: {'module': 'files', 'cloud': 'aws'},
) as Map<String, dynamic>;
// setup['available'], setup['unavailableReason'], setup['subject'],
// setup['audience'], setup['script'], setup['integrationId']
```

## Payments

### Orders and checkout

`api.payments` creates a payment order for a buyer, reads it back and starts a
provider checkout (e.g. Montonio) for it. Amounts are minor units (cents).

| Method | Route | Answers |
| --- | --- | --- |
| `createPaymentOrder(body:)` | `POST /{version}/payments/orders` — `buyerUserId`, `merchantReference`, `idempotencyKey?`, `currency`, `priceVersion`, `lines` (`sku?`, `title?`, `quantity`, `unitAmountMinor`), `metadata?` | `{ id }` (`ord_…`) |
| `getPaymentOrder(id:)` | `GET /{version}/payments/orders/{id}` | `{ item: PaymentOrderDto }` |
| `getPaymentOrders(query:)` | `GET /{version}/payments/orders` — `buyerUserId?`, `merchantReference?`, `status?` | `{ list: Paginated<PaymentOrderDto> }` |
| `startPaymentCheckout(id:, body:)` | `POST /{version}/payments/orders/{id}/checkout` — `integrationId`, `method?`, `returnUrl`, `preferredCountry?`, `preferredProvider?` | `{ checkout, reused, order }` |

```dart
final created = await api.payments.createPaymentOrder(body: {
  'buyerUserId': userId,
  'merchantReference': 'ad-1042-promo-1',
  'idempotencyKey': 'ad-1042-promo-1', // same body + same key -> same id
  'currency': 'EUR',
  'priceVersion': 'v1',
  'lines': [
    {'sku': 'star-day', 'title': 'Star × day', 'quantity': 21, 'unitAmountMinor': 30},
  ],
}) as Map<String, dynamic>;

final started = await api.payments.startPaymentCheckout(
  id: created['id'] as Object,
  body: {'integrationId': 'int_montonio', 'returnUrl': 'https://shop.example/return'},
) as Map<String, dynamic>;
print(started['checkout']['paymentUrl']); // send the buyer here
```

When the provider confirms the payment, the project's webhook destinations get
`payments.order.paid` (see `doc/webhooks_receiver.md`).

## Logs

### Write your app's own log lines

`api.logs.writeLogs` sends 1–100 entries to the project's Logs. The call
returns at once — the entries are queued — and answers `{ accepted }`.

```dart
await api.logs.writeLogs(body: {
  'entries': [
    {
      'level': 'error', // information (default) | warning | error
      'title': 'Payment failed', // 1–200 characters
      'message': 'card declined', // at most 8 000
      'eventCode': 'order:payment_failed', // stored as app:order:payment_failed
      'correlationId': 'checkout-42', // groups lines into one flow
      'meta': {'orderId': 'ord_1'}, // at most 20 keys
    },
  ],
});
```

Refusals: 400 for a broken entry, 400 `CM-ERRORS-LOGGING-002` when the Logs
module is off, and 429 `CM-ERRORS-LOGGING-003` when the project's per-minute
quota is used up. The 429 is a `NorbixRateLimitError`; its
`retryAfterSeconds` (the `Retry-After` header) says when to send again. The SDK
never resends a POST on its own.

```dart
try {
  await api.logs.writeLogs(body: {'entries': entries});
} on NorbixRateLimitError catch (e) {
  await Future<void>.delayed(Duration(seconds: e.retryAfterSeconds ?? 60));
}
```

### Read, clean and configure (Hub)

| Method | Route |
| --- | --- |
| `getLogs(query:)` | `GET /{version}/logs` — `level?`, `module?`, `logCorrelationId?`, `eventCode?`, `search?`, `metaKey?` + `metaValue?`, `fromUtc?`, `toUtc?`, `pageSize?`, `startingAfter?`, `endingBefore?` |
| `getLog(id:)` | `GET /{version}/logs/{id}` — one entry by id |
| `getLogsByCorrelationId(query:)` | `GET /{version}/logs/audit` — `targetCorrelationId` |
| `cleanLogs()` | `POST /{version}/logs/clean` — deletes every stored entry |
| `getLogSettings()` / `saveLogSettings(body:)` | `GET` / `POST /{version}/logs/settings` — `skipCloudDashboardLogs`, `skipHttpBodyMeta`, `aiChatLoggingEnabled` |
| `getLoggingIntegrations`, `getLoggingIntegration`, `saveLoggingIntegration`, `testLoggingIntegration`, `enableLoggingIntegration`, `disableLoggingIntegration`, `deleteLoggingIntegration` | `/{version}/logs/integrations…` |

### Logging integrations — test after saving

Nothing is delivered to a logging integration (Datadog, AWS CloudWatch,
MongoDB, …) until its last test passed. After saving or changing one, call
`testLoggingIntegration`:

```dart
final saved = await hub.logs.saveLoggingIntegration(body: {
  'integration': {
    'provider': 'MongoDB',
    'integrationName': 'Audit copy',
    'isEnabled': true,
    'connectionString': 'mongodb+srv://…',
    'databaseName': 'logs', // optional
  },
}) as Map<String, dynamic>;
await hub.logs.testLoggingIntegration(body: {'integrationId': saved['id']});
```

Request types (`MongoDbLoggingIntegrationRequest`,
`DataDogLoggingIntegrationRequest` with its `site`,
`AwsCloudWatchLoggingIntegrationRequest`, …) are in `references/hub.dtos.dart`.

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

`hub.smsNotifications` covers every SMS Hub endpoint (35): the module
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
`deleteSmsCampaign`, `stopSmsCampaign`, `retryFailedSmsNotifications`,
`getSmsCampaignStatistics`,
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

### Retrying failed recipients

`emailNotifications.retryFailedEmailNotifications`,
`smsNotifications.retryFailedSmsNotifications` and
`pushNotifications.retryFailedPushNotifications` send the failed recipients
of a campaign again (`POST /{version}/notifications/{email|sms|push}/campaigns/{Id}/retry-failed`,
gateway 2.3.9). Only rows whose send failed are selected — never one the
provider accepted — each as a new attempt with the same notification id.

The body is a map:

| Field | Meaning |
|-------|---------|
| `idempotencyKey` | Required, at most 64 characters. The same key again sends nothing and returns the first answer (`replayed: true`); the same key with another body is refused (409). |
| `databaseIntegrationId` | Optional. Default: the project's default database integration. |
| `notificationIds` | Optional. Only these notification ids. Default: every failed recipient of the campaign. |
| `includeAmbiguous` | Optional, default `false`. Also retry rows whose failure is `Ambiguous` (a timeout after the request was sent) — this **may send a duplicate**; the answer then carries a `warning`. |
| `categories` | Optional. Only these failure classes: `Transient`, `Permanent`, `Unknown`. Default: all three. |

The SDK sends the map as it is — nothing is filled in for you, so an unset
optional is simply not sent. The answer is
`{retryRequestId, selected, skipped, replayed, warning?}`: `skipped` counts
the rows left out per reason (`AlreadyAccepted`, `InFlight`, `Ambiguous`,
`NotFound`, `Blocked`, `Category`).

```dart
final answer = await hub.emailNotifications.retryFailedEmailNotifications(
  id: 'cmp_1',
  body: {
    'idempotencyKey': 'retry-cmp_1-2026-10-26',
    'categories': ['Transient'],
  },
) as Map<String, dynamic>;
print('${answer['selected']} sent again, skipped: ${answer['skipped']}');
```

A campaign's messages now carry the delivery state too
(`get*CampaignBatchNotification`: `state`, `stateChangedAt`, `attempts`,
`deliveryEvents`, `deliveryOutcome`), and `get*CampaignStatistics` adds
`failedRetryable` and `cancelled`.

### Cloning a template

`emailNotifications.cloneEmailTemplate`, `smsNotifications.cloneSmsTemplate`
and `pushNotifications.clonePushTemplate` copy a template and answer the new
copy's id (`{'id': '…'}`), so you can open or edit the copy without listing
the templates again:

```dart
final copy = await hub.emailNotifications.cloneEmailTemplate(id: 'tpl_welcome')
    as Map<String, dynamic>;
final template =
    await hub.emailNotifications.getEmailTemplate(id: copy['id'] as String);
```

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

## Code — cloud functions

Norbix does not host code: a trigger's `Code` action, a scheduler
`CodeFunctionalCall` task or a manual call runs a function in **your** cloud
(AWS Lambda, Azure Functions, Google Cloud Functions) through a Code
integration (`hub.code.getCodeIntegrations`, `saveCodeIntegration`,
`testCodeIntegration`, …). `hub.code` covers every Code Hub endpoint (70,
with the 26 workflow routes below); the five cloud-function routes:

| Method | Call |
|--------|------|
| `getCodeFunctions(query:)` | `GET /{version}/code/functions` — `integrationId` (required), `prefix`, `tag` (`key` or `key=value`), paging (`pageSize`, `startingAfter`, `endingBefore`); a live listing from the provider |
| `getCodeFunctionQualifiers(query:)` | `GET /{version}/code/functions/qualifiers` — `integrationId`, `functionId`; the aliases and versions |
| `invokeCodeFunction(body:)` | `POST /{version}/code/functions/invoke` — `functionRef` `{integrationId, functionId, qualifier?}`, `payload?`, `invocationType` (`Sync` / `Async`), `runAsUserId?`, `config?` |
| `getCodeFunctionEventSample(query:)` | `GET /{version}/code/functions/event-sample` — `source` (`database` · `membership` · `files` · `payments` · `ai` · `scheduler` · `manual`, any case), `event?`, `schemaId?`; a sample envelope for a local run |
| `getCodeFunctionRuns(query:)` | `GET /{version}/code/functions/runs` — exactly one of `triggerId` / `taskId`, `limit` (1–50, default 20); the last runs, newest first; each run carries `input` — the scrubbed envelope a Fake-provider run received |

```dart
final hub = NorbixHub(config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'));

final functions = await hub.code.getCodeFunctions(
  query: {'integrationId': 'int_1', 'prefix': 'orders-'},
);
final result = await hub.code.invokeCodeFunction(body: {
  'functionRef': {'integrationId': 'int_1', 'functionId': 'orders-on-update', 'qualifier': 'prod'},
  'payload': {'orderId': '6ac54a59212c29912eaddd81', 'dryRun': true},
  'invocationType': 'Sync',
});
// {statusCode, output, durationMs, requestId?, logs?}
final runs = await hub.code.getCodeFunctionRuns(query: {'triggerId': 'trg_1', 'limit': 5});
```

The function receives one JSON envelope (`CodeFunctionEventDto` in
`references/hub.dtos.dart`): `event`, `source`, `context` (`projectId`,
`environment`, `hubUrl`, `apiUrl`, `runAs.accessToken` — a 15-minute token
for the run-as user) and `data` with one slot per source (`database`,
`user`, `file`, `payment`, `ai`, `task`, `payload`). Every route is asserted
in `test/hub/code_test.dart`.


### Marketplace function runs

Each call of a marketplace function is one run row: an invoke (user, API key,
AI), a trigger run or a scheduler fire. `code.getMarketplaceFunctionRuns`
takes exactly one of `functionId` (every source, newest first, up to 50),
`triggerId` or `taskId`, plus `limit` (1–50, default 20). A row carries
`status` (`ok` / `failed` / `skipped`, null on rows written before the field
existed), `durationMs`, `source`, `event`, `correlationId` and `hasDetails`.

The input, steps and response of a run are written to the project log under
the row's `correlationId`, only while the environment's Norbix Logging is on —
then `hasDetails` is true. Read them with the logs route; its query field is
`targetCorrelationId`:

```dart
final res = await hub.code.getMarketplaceFunctionRuns(
    query: {'functionId': 'func_…', 'limit': 10}) as Map<String, Object?>;
for (final run in (res['runs'] as List? ?? const []).cast<Map<String, Object?>>()) {
  if (run['hasDetails'] != true) continue; // logs were off for this run
  final details = await hub.logs.getLogsByCorrelationId(
      query: {'targetCorrelationId': run['correlationId']});
  // details['items']: marketplace:run:started → marketplace:run:step … → completed | failed | skipped
}
```

### Workflows (beta)

Workflows are in beta; bugs may occur. A workflow is a definition of steps
that Norbix runs for you; a run can wait for an approval, an event or a delay.
The shapes (`WorkflowDefinitionDto`, `WorkflowRunDto`, …) are in
`references/hub.dtos.dart`. Every workflow method's doc starts with `Beta:`.

| Method | Route |
|--------|-------|
| `getCodeWorkflows(query:)` | `GET /{version}/code/workflows` — `isEnabled?` + paging |
| `saveCodeWorkflow(body:)` | `PUT /{version}/code/workflows` — `definition` |
| `getCodeWorkflow(id:, query:)` | `GET /{version}/code/workflows/{Id}` — `pinnedVersion?` |
| `deleteCodeWorkflow(id:)` | `DELETE /{version}/code/workflows/{Id}` |
| `enableCodeWorkflow(id:)` | `PUT /{version}/code/workflows/{Id}/enable` |
| `disableCodeWorkflow(id:)` | `PUT /{version}/code/workflows/{Id}/disable` |
| `publishCodeWorkflow(id:)` | `POST /{version}/code/workflows/{Id}/publish` |
| `getCodeWorkflowDraft(id:)` | `GET /{version}/code/workflows/{Id}/draft` |
| `discardCodeWorkflowDraft(id:)` | `DELETE /{version}/code/workflows/{Id}/draft` |
| `getCodeWorkflowVersions(id:)` | `GET /{version}/code/workflows/{Id}/versions` |
| `getCodeWorkflowVersionDiff(id:, query:)` | `GET /{version}/code/workflows/{Id}/versions/diff` — `fromVersion`, `toVersion` |
| `invokeCodeWorkflow(id:, body:)` | `POST /{version}/code/workflows/{Id}/invoke` — `payload?`, `waitSeconds?` (0–30), `runVersion?` |
| `getCodeWorkflowRuns(id:, query:)` | `GET /{version}/code/workflows/{Id}/runs` — `status?`, `from?`, `to?` + paging |
| `resumeCodeWorkflowRunByKey(id:, body:)` | `POST /{version}/code/workflows/{Id}/resume` — `key`, `stepId?`, `decision?`, `payload?` |
| `validateCodeWorkflow(body:)` | `POST /{version}/code/workflows/validate` — `definition` |
| `getCodeWorkflowSchema()` | `GET /{version}/code/workflows/schema` |
| `enableCodeWorkflows()` | `PUT /{version}/code/workflows/enable` — the Workflows switch |
| `disableCodeWorkflows()` | `PUT /{version}/code/workflows/disable` |
| `getCodeWorkflowWaitingRuns(query:)` | `GET /{version}/code/workflows/runs` — `status?`, `waitingKind?`, `assignee?`, `workflowId?`, `key?` + paging |
| `getCodeWorkflowRun(runId:)` | `GET /{version}/code/workflows/runs/{RunId}` |
| `getCodeWorkflowRunLogs(runId:, query:)` | `GET /{version}/code/workflows/runs/{RunId}/logs` — `stepId?`, `level?` + paging |
| `resumeCodeWorkflowRun(runId:, body:)` | `POST /{version}/code/workflows/runs/{RunId}/resume` — `stepId?`, `decision?`, `payload?` |
| `retryCodeWorkflowRunStep(runId:, body:)` | `POST /{version}/code/workflows/runs/{RunId}/retry` — `stepId?` |
| `cancelCodeWorkflowRun(runId:, body:)` | `POST /{version}/code/workflows/runs/{RunId}/cancel` — `reason?` |
| `openCodeWorkflowResumeLink(token:)` | `GET /{version}/code/workflows/resume/{Token}` |
| `useCodeWorkflowResumeLink(token:, body:)` | `POST /{version}/code/workflows/resume/{Token}` |

`api.code` (a project user) has four of them: `getCodeWorkflowWaitingRuns`,
`resumeCodeWorkflowRun`, `openCodeWorkflowResumeLink` and
`useCodeWorkflowResumeLink`. The resume link's token is its own key: the call
goes out with the client's credential when it has one, and with none (no
error) when it has none.

```dart
final run = await hub.code.invokeCodeWorkflow(
    id: 'wf_1', body: {'payload': {'orderId': 'ord_1'}, 'waitSeconds': 10});
final waiting = await api.code.getCodeWorkflowWaitingRuns(
    query: {'waitingKind': 'approval', 'assignee': 'me'});
await api.code.resumeCodeWorkflowRun(
    runId: 'run_1', body: {'stepId': 'approve', 'decision': 'approved'});
```

Every workflow route is asserted in `test/hub/code_test.dart` and
`test/api/code_test.dart`.

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
