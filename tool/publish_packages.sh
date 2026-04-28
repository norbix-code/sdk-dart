#!/usr/bin/env bash
# Publish all three Norbix Dart packages to pub.dev in dependency order:
# norbix_core first, then norbix_api and norbix_hub (which depend on it).
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

publish() {
  local pkg="$1"
  echo "::group::Publishing ${pkg}"
  ( cd "${pkg}" && dart pub publish --force )
  echo "::endgroup::"
}

# Publish core first. Wait briefly so api/hub can resolve it from pub.dev.
publish packages/norbix_core
echo "Sleeping 90s for pub.dev to index norbix_core..."
sleep 90

# Switch api/hub deps from `any` to `^<version>` of norbix_core for the
# uploaded version. semantic-release runs this AFTER bump_versions.sh,
# so we read the freshly bumped version from norbix_core's pubspec.
CORE_VERSION="$(grep -E '^version:' packages/norbix_core/pubspec.yaml | awk '{print $2}')"
echo "Pinning norbix_core dep to ^${CORE_VERSION} in api/hub..."
for pkg in packages/norbix_api packages/norbix_hub; do
  python3 - "${pkg}/pubspec.yaml" "${CORE_VERSION}" <<'PY'
import re, sys
path, ver = sys.argv[1], sys.argv[2]
with open(path, encoding='utf-8') as f:
    s = f.read()
s = re.sub(r'(\n\s*norbix_core:\s*).+', rf'\g<1>^{ver}', s, count=1)
with open(path, 'w', encoding='utf-8') as f:
    f.write(s)
PY
done

publish packages/norbix_api
publish packages/norbix_hub
