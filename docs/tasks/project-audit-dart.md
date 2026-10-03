# Project audit — Dart SDK: Project module completeness
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/docs/tasks/project-audit-dart.md (branch audit/project)

## Goal
Give the Dart SDK every Project-module endpoint the gateway has: admin URL, legal documents, admin portal structure and service user, the public project config and legal pages, the developer MCP endpoint, and AI service users — each with a route test and a README line.
Not in scope: AI plans, knowledge and credits (decided internal); a streaming (SSE) client; regenerating the resource files (the generator is not in the repo).

## Plan
1. [done] docs(sdk-dart:project): task file with goal and plan
2. [todo] feat(sdk-dart:projects): admin URL, legal documents, expose legal, admin portal structure and service user on `hub.projects`, with route tests
3. [todo] feat(sdk-dart:public): new `api.publicProjects` resource for the public project config and legal pages (API host), with route tests
4. [todo] feat(sdk-dart:accounts): developer MCP endpoint (send, open stream, end session) and AI service users (create, list, delete, rotate key, revoke key) on `hub.accounts`, with route tests
5. [todo] fix(sdk-dart:ai-integrations): LLM and MCP integration enable / disable / delete used `{id}` where the gateway route says `{Id}`, so the coverage scanner counted them as missing; routes aligned and tested
6. [todo] docs(sdk-dart:readme): README section for the new methods and the module list
7. [todo] chore(sdk-dart:checks): `dart analyze` and `dart test` green; push and open the pull request

## Changes
| file (absolute, branch audit/project) | what changed | step |
|------|--------------|------|
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-dart/audit/project/docs/tasks/project-audit-dart.md | this task file | 1 |

## Findings

## Rejected / moved out
- decision(sdk-dart:ai): AI plans, knowledge search and AI credits endpoints are not added — rejected — reason: decided internal by the campaign — new ticket/file: none

## Needs you
- [ ] release(sdk-dart:project): review and merge the pull request (Squash and merge) — needs you · action: merge the PR linked in the final report

## Open questions
- none
