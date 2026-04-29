#!/usr/bin/env bash
# Publish the unified `norbix` Dart package to pub.dev.
#
# Reads PUB_CREDENTIALS from the environment and materialises it at the
# location dart pub looks for: $XDG_CONFIG_HOME/dart/pub-credentials.json
# (or ~/.config/dart/pub-credentials.json when XDG is unset).
#
# Called by semantic-release publishCmd.
set -euo pipefail

if [[ -z "${PUB_CREDENTIALS:-}" ]]; then
  echo "PUB_CREDENTIALS env var is empty; skipping publish" >&2
  exit 0
fi

CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/dart"
mkdir -p "${CONFIG_DIR}"
printf '%s' "${PUB_CREDENTIALS}" > "${CONFIG_DIR}/pub-credentials.json"
chmod 600 "${CONFIG_DIR}/pub-credentials.json"

echo "::group::Publishing norbix"
dart pub publish --force
echo "::endgroup::"
