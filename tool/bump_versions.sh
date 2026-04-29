#!/usr/bin/env bash
# Bump the `version:` line in the `norbix` package pubspec.yaml.
# Called by semantic-release prepareCmd.
#
# Usage: tool/bump_versions.sh <new-version>
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <new-version>" >&2
  exit 1
fi

VERSION="$1"

pubspec="pubspec.yaml"
changelog="CHANGELOG.md"

if [[ ! -f "${pubspec}" ]]; then
  echo "missing ${pubspec}" >&2
  exit 1
fi
if [[ ! -f "${changelog}" ]]; then
  echo "missing ${changelog}" >&2
  exit 1
fi

# Match `version: anything` at start of line, replace with new value.
python3 - "${pubspec}" "${changelog}" "${VERSION}" <<'PY'
import re, sys
pubspec_path, changelog_path, version = sys.argv[1], sys.argv[2], sys.argv[3]

with open(pubspec_path, encoding='utf-8') as f:
    s = f.read()
s = re.sub(r'^version:\s*.+$', f'version: {version}', s, count=1, flags=re.M)
with open(pubspec_path, 'w', encoding='utf-8') as f:
    f.write(s)

with open(changelog_path, encoding='utf-8') as f:
    c = f.read()
if not re.search(rf'^##\s+{re.escape(version)}\s*$', c, flags=re.M):
    c = re.sub(r'^##\s+([^\n]+)\s*$', f'## {version}', c, count=1, flags=re.M)
with open(changelog_path, 'w', encoding='utf-8') as f:
    f.write(c)
PY

echo "bumped ${pubspec} and ensured ${changelog} has ${VERSION}"
