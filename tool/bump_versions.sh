#!/usr/bin/env bash
# Bump the `version:` line in every publishable package pubspec.yaml.
# Called by semantic-release prepareCmd.
#
# Usage: tool/bump_versions.sh <new-version>
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <new-version>" >&2
  exit 1
fi

VERSION="$1"

for pkg in packages/norbix_core packages/norbix_api packages/norbix_hub; do
  pubspec="${pkg}/pubspec.yaml"
  if [[ ! -f "${pubspec}" ]]; then
    echo "missing ${pubspec}" >&2
    exit 1
  fi
  # Match `version: anything` at start of line, replace with new value.
  python3 - "${pubspec}" "${VERSION}" <<'PY'
import re, sys
path, version = sys.argv[1], sys.argv[2]
with open(path, encoding='utf-8') as f:
    s = f.read()
s = re.sub(r'^version:\s*.+$', f'version: {version}', s, count=1, flags=re.M)
with open(path, 'w', encoding='utf-8') as f:
    f.write(s)
PY
  echo "bumped ${pubspec} -> ${VERSION}"
done
