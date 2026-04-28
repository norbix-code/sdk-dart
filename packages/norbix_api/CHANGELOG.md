# Changelog

## 1.0.1
Green-field rewrite. **Breaking** vs. the old single-package `norbix_dart`:

- Split out as a standalone package.
- Resource-style surface — `client.users.getUsers(...)` instead of
  `client.api.users.getUsers(...)`.
- Modules grouped by resource (`auth`, `apiKeys`, `users`), not by HTTP verb.
- Default base URL is now `https://api.norbix.ai` (was `api.norbix.dev`).
- Self-hosted deployments via `NorbixConfig(baseUrl: '...')`.
- Runtime env loading via `NorbixApi.fromEnv()`.
- Typed error hierarchy: `NorbixAuthError`, `NorbixNotFoundError`,
  `NorbixRateLimitError`, etc.
- Path params are explicit named arguments (`required Object id`) instead
  of a `Map<String, dynamic>? pathParams` bag.
