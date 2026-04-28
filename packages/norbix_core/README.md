# norbix_core

Shared core primitives for Norbix Dart SDK packages.

This package provides:

- `NorbixConfig` configuration model and env helpers.
- transport and resource abstractions.
- typed error hierarchy for HTTP and transport failures.
- shared HTTP driver contract used by `norbix_api` and `norbix_hub`.

`norbix_core` is typically consumed transitively through higher-level Norbix SDKs, but it can also be used directly for custom clients.
