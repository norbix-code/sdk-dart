# Changelog

## 0.1.0

Green-field rewrite. **Breaking** vs. the old single-package `norbix_dart`:

- Split out as a standalone package.
- Resource-style surface — `client.projects.getProjects(...)` instead of
  `client.hub.projects.getProjects(...)`.
- Modules grouped by resource (`accounts`, `projects`, `database`,
  `emailNotifications`, `pushNotifications`, ...), not by HTTP verb
  (`get`, `save`, `update`, `un`, ...).
- Default base URL is now `https://hub.norbix.ai` (was `hub.norbix.dev`).
- Self-hosted deployments via `NorbixConfig(baseUrl: '...')`.
- Runtime env loading via `NorbixHub.fromEnv()`.
- Typed error hierarchy.
- PascalCase `{Id}` placeholders normalised to camelCase
  (`projectId`, `taxonomyId`, `destinationId`).
- Path params are explicit named arguments.
