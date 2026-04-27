#!/usr/bin/env python3
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REFS = ROOT / "references"

TARGETS = [
  ("http://localhost:5002", "api.dtos.dart", "api"),
  ("http://localhost:5001", "hub.dtos.dart", "hub"),
]


def run(cmd: list[str]) -> None:
  print(f"+ {' '.join(cmd)}")
  subprocess.run(cmd, check=True, cwd=REFS)


def main() -> None:
  parser = argparse.ArgumentParser(description="Sync ServiceStack Dart references")
  parser.add_argument(
    "--update-only",
    action="store_true",
    help="Update existing .dtos.dart files in-place",
  )
  args = parser.parse_args()

  REFS.mkdir(parents=True, exist_ok=True)

  for url, file_name, output_name in TARGETS:
    file_path = REFS / file_name
    if args.update_only and file_path.exists():
      run(["x", "dart", file_name])
    else:
      run(["x", "dart", url, output_name])


if __name__ == "__main__":
  main()
