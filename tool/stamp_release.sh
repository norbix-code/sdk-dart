#!/usr/bin/env bash
# Stamp a release version into the working tree before `dart pub publish`.
#
# `main` is protected, so releases never commit back: the tag is the source of
# truth and pubspec.yaml on main keeps a stale `version:`. The publish workflow
# checks out the tag and runs this script so the uploaded package carries the
# right version and a CHANGELOG entry (pub.dev scores a missing one).
#
# Usage: tool/stamp_release.sh <version> [<release-notes-file>]
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <version> [<release-notes-file>]" >&2
  exit 1
fi

VERSION="$1"
NOTES_FILE="${2:-}"

python3 - "${VERSION}" "${NOTES_FILE}" <<'PY'
import re, sys

version, notes_file = sys.argv[1], sys.argv[2]

with open("pubspec.yaml", encoding="utf-8") as f:
    pubspec = f.read()
pubspec, n = re.subn(r"^version:\s*.+$", f"version: {version}", pubspec, count=1, flags=re.M)
if n != 1:
    sys.exit("pubspec.yaml has no `version:` line")
with open("pubspec.yaml", "w", encoding="utf-8") as f:
    f.write(pubspec)

with open("CHANGELOG.md", encoding="utf-8") as f:
    changelog = f.read()
if re.search(rf"^#+\s*\[?{re.escape(version)}\b", changelog, flags=re.M):
    print(f"CHANGELOG.md already has {version}")
else:
    notes = ""
    if notes_file:
        with open(notes_file, encoding="utf-8") as f:
            notes = f.read().strip()
        # The GitHub Release body starts with its own "## [x.y.z](...) (date)"
        # heading; replace it with the plain heading used in this file.
        notes = re.sub(r"\A#+ .*\n+", "", notes)
    entry = f"## {version}\n\n{notes or 'See the GitHub release notes.'}\n\n"
    with open("CHANGELOG.md", "w", encoding="utf-8") as f:
        f.write(entry + changelog)
    print(f"CHANGELOG.md: added {version}")
print(f"pubspec.yaml: version {version}")
PY
