# Project audit — Dart SDK: Project module completeness
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/docs/tasks/project-audit-dart.md (branch audit/project)

## Goal
Give the Dart SDK every Project-module endpoint the gateway has: admin URL, legal documents, admin portal structure and service user, the public project config and legal pages, the developer MCP endpoint, and AI service users — each with a route test and a README line.
Not in scope: AI plans, knowledge and credits (decided internal); a streaming (SSE) client; regenerating the resource files (the generator is not in the repo).

## Plan
1. [done] docs(sdk-dart:project): task file with goal and plan
2. [done] feat(sdk-dart:projects): admin URL, legal documents, expose legal, admin portal structure and service user on `hub.projects`, with route tests
3. [done] feat(sdk-dart:public): new `api.publicProjects` resource for the public project config and legal pages (API host), with route tests
   decision(sdk-dart:public): the two public calls go out with no credentials (`authenticated: false`), like the public file link — the gateway route is unsecured and a key has no business there; the TypeScript SDK sends the client's key
4. [done] feat(sdk-dart:accounts): developer MCP endpoint (send, open stream, end session) and AI service users (create, list, delete, rotate key, revoke key) on `hub.accounts`, with route tests
   decision(sdk-dart:mcp): the one gateway route with three verbs becomes three methods (`sendMcpMessage` POST, `openMcpStream` GET, `endMcpSession` DELETE); the TypeScript SDK has only the POST, named `mcp`
5. [done] fix(sdk-dart:ai-integrations): LLM and MCP integration enable / disable / delete used `{id}` where the gateway route says `{Id}`, so the coverage scanner counted them as missing; routes aligned and tested
6. [todo] docs(sdk-dart:readme): README section for the new methods and the module list
7. [todo] chore(sdk-dart:checks): `dart analyze` and `dart test` green; push and open the pull request

## Changes
| file (absolute, branch audit/project) | what changed | step |
|------|--------------|------|
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/docs/tasks/project-audit-dart.md | this task file | 1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/hub/resources/projects.dart | 5 methods: updateProjectAdminUrl, updateProjectLegalDocuments, updateProjectExposeLegal, getAdminPortalStructure, assignAdminPortalServiceUser | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/test/hub/projects_settings_test.dart | new: one route test per method (5) | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/api/resources/public_projects.dart | new resource: getPublicProjectConfig, getPublicProjectLegal (API host) | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/api/client.dart | exposes `api.publicProjects` | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/norbix_api.dart | exports public_projects.dart and the missing ai_chat.dart | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/test/api/public_projects_test.dart | new: one route test per method (2) | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/hub/resources/accounts.dart | 8 methods: sendMcpMessage, openMcpStream, endMcpSession, createAiServiceUser, listAiServiceUsers, rotateAiServiceUserKey, revokeAiServiceUserKey, deleteAiServiceUser | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/test/hub/accounts_mcp_service_users_test.dart | new: one route test per method (8) plus one for the JSON-RPC body and session header | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/hub/resources/ai_integrations.dart | LLM / MCP enable, disable, delete: route placeholder `{id}` → `{Id}` (gateway spelling); Dart argument stays `id`, no caller change | 5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/test/hub/ai_integrations_llm_mcp_test.dart | new: one route test per method (6) — none existed | 5 |

## Findings
fix(sdk-dart:ai-integrations): LLM and MCP enable / disable / delete existed but were counted "no" in the coverage matrix, because the scanner matches the route text exactly and Dart wrote `{id}` where the gateway writes `{Id}`; the URL on the wire was already right — done (fixed here, step 5)
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/hub/resources/ai_integrations.dart:74 (branch audit/project)
```dart
// before — lib/src/hub/resources/ai_integrations.dart:74-86 (main)
  /// `PUT /{version}/ai/integrations/llms/{id}/enable`
  Future<Object?> enableLlmIntegration(
      {required Object id,
      ...
      route: '/{version}/ai/integrations/llms/{id}/enable',   // <-- here: gateway route is .../llms/{Id}/enable
      pathParams: <String, Object?>{'id': id},
```
```csharp
// gateway — src/Isidos.CodeMash.Gateway.Hub.AI/Integrations/Llms/Enable.cs:17 (merge-callbacks-gateway-stack)
[Route("/{version}/ai/integrations/llms/{Id}/enable", "PUT", Summary = "Enable LLM integration for particular project")]
```
```python
# typegen coverage/build_matrix.py:131-140 — exact, case-sensitive text match
def implemented(corpus, ep):
    for r in ep["routes"]:
        p = (r["path"] or "").strip()
        if p in corpus:                     # <-- here: "{id}" never matches "{Id}"
            return True
```

fix(sdk-dart:api): the API library did not export the end-user AI chat resource, so callers could not name its type — done (fixed here, step 3)
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/norbix_api.dart:20 (branch audit/project)
```dart
// before — lib/norbix_api.dart:19-25 (main)
export 'src/api/client.dart' show NorbixApi, kNorbixApiDefaultBaseUrl;
export 'src/api/resources/api_keys.dart';   // <-- missing: src/api/resources/ai_chat.dart
export 'src/api/resources/auth.dart';
export 'src/api/resources/database.dart';
export 'src/api/resources/files.dart';
```

docs(sdk-dart:generator): resource files say "GENERATED FILE. Do not edit by hand", but the generator is gitignored and not in the repo, so every new endpoint is hand-written — left open
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/lib/src/hub/resources/projects.dart:1 (branch audit/project)
```dart
// lib/src/hub/resources/projects.dart:1-2 (main)
// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart   // <-- here: tool/ has only stamp_release.sh; README says python3 tool/generate_resources.py
```


## Rejected / moved out
- decision(sdk-dart:ai): AI plans, knowledge search and AI credits endpoints are not added — rejected — reason: decided internal by the campaign — new ticket/file: none

## Needs you
- [ ] release(sdk-dart:project): review and merge the pull request (Squash and merge) — needs you · action: merge the PR linked in the final report

## Open questions
- none
