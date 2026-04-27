#!/usr/bin/env python3
from __future__ import annotations

import re
import shutil
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[1]
LIB = ROOT / "lib" / "src"
TEST = ROOT / "test"
DOCS = ROOT / "docs"


@dataclass
class Endpoint:
  host: str
  group: str
  request: str
  route: str
  method: str
  account_scoped: bool


def class_to_group(class_name: str) -> str:
  parts = re.findall(r"[A-Z][a-z0-9]*", class_name) or [class_name]
  first = parts[0].lower()
  if first in {"api", "hub"} and len(parts) > 1:
    return parts[1].lower()
  return first


def parse_dart_dtos(path: Path, host: str) -> list[Endpoint]:
  text = path.read_text(encoding="utf-8")
  lines = text.splitlines()
  endpoints: list[Endpoint] = []

  for i, line in enumerate(lines):
    route_match = re.match(
      r"\s*(?://\s*)?@Route\([\"']([^\"']+)[\"'](?:,\s*[\"']([A-Z,]+)[\"'])?\)",
      line,
    )
    if not route_match:
      continue

    route = route_match.group(1)
    method = (route_match.group(2) or "GET").split(",")[0].strip().upper()

    request = ""
    for j in range(i + 1, min(i + 20, len(lines))):
      cls = re.match(r"\s*class\s+(\w+)\b", lines[j])
      if cls:
        request = cls.group(1)
        break
    if not request:
      continue

    group = class_to_group(request)
    account_scoped = "{accountId}" in route
    endpoints.append(
      Endpoint(
        host=host,
        group=group,
        request=request,
        route=route,
        method=method,
        account_scoped=account_scoped,
      )
    )
  return endpoints


def parse_typescript_dtos(path: Path, host: str) -> list[Endpoint]:
  text = path.read_text(encoding="utf-8")
  lines = text.splitlines()
  endpoints: list[Endpoint] = []
  for i, line in enumerate(lines):
    route_match = re.match(
      r"\s*(?://\s*)?@Route\([\"']([^\"']+)[\"'](?:,\s*[\"']([A-Z,]+)[\"'])?\)",
      line,
    )
    if not route_match:
      continue
    route = route_match.group(1)
    method = (route_match.group(2) or "GET").split(",")[0].strip().upper()
    request = ""
    for j in range(i + 1, min(i + 20, len(lines))):
      cls = re.match(r"\s*export class (\w+)\b", lines[j])
      if cls:
        request = cls.group(1)
        break
    if not request:
      continue
    group = class_to_group(request)
    endpoints.append(
      Endpoint(
        host=host,
        group=group,
        request=request,
        route=route,
        method=method,
        account_scoped="{accountId}" in route,
      )
    )
  return endpoints


def clean_generated_outputs() -> None:
  for rel in ("lib/src/api", "lib/src/hub", "test/api", "test/hub", "docs/api", "docs/hub"):
    target = ROOT / rel
    if target.exists():
      shutil.rmtree(target)
    target.mkdir(parents=True, exist_ok=True)


def write_namespace(host: str, endpoints: list[Endpoint]) -> None:
  host_dir = LIB / host
  host_dir.mkdir(parents=True, exist_ok=True)
  groups = sorted({ep.group for ep in endpoints})

  lines = ["import '../core/transport.dart';"]
  for g in groups:
    lines.append(f"import '{g}.dart';")
  lines.append("")
  class_name = f"{host.capitalize()}Namespace"
  lines.append(f"class {class_name} {{")
  lines.append("  final Transport _transport;")
  lines.append(f"  {class_name}(this._transport);")
  for g in groups:
    prop = safe_ident(g)
    mod = f"{host.capitalize()}{g.capitalize()}Module"
    lines.append(f"  {mod} get {prop} => {mod}(_transport);")
  lines.append("}")
  lines.append("")
  (host_dir / f"{host}.dart").write_text("\n".join(lines), encoding="utf-8")


def write_group_module(host: str, group: str, endpoints: list[Endpoint]) -> None:
  host_dir = LIB / host
  cls_name = f"{host.capitalize()}{group.capitalize()}Module"
  lines = ["import '../core/transport.dart';", "", f"class {cls_name} {{", "  final Transport _transport;"]
  lines.append(f"  {cls_name}(this._transport);")
  lines.append("")
  used_names: dict[str, int] = {}
  for ep in endpoints:
    base_fn = safe_ident(camel_case(ep.request))
    count = used_names.get(base_fn, 0) + 1
    used_names[base_fn] = count
    fn = base_fn if count == 1 else f"{base_fn}{count}"
    params = ["Map<String, dynamic>? query", "Map<String, dynamic>? body"]
    if "{projectId}" in ep.route:
      params.append("String? projectId")
    if ep.account_scoped:
      params.append("String? accountId")
    params.append("Map<String, dynamic>? pathParams")
    lines.append(f"  Future<dynamic> {fn}({{{', '.join(params)}}}) async {{")
    lines.append("    final mergedPathParams = <String, dynamic>{};")
    if "{projectId}" in ep.route:
      lines.append("    if (projectId != null) mergedPathParams['projectId'] = projectId;")
    if ep.account_scoped:
      lines.append("    if (accountId != null) mergedPathParams['accountId'] = accountId;")
    lines.append("    if (pathParams != null) mergedPathParams.addAll(pathParams);")
    lines.append("    return _transport.send(")
    lines.append(f"      host: '{host}',")
    lines.append(f"      route: '{ep.route}',")
    lines.append(f"      method: '{ep.method}',")
    lines.append("      query: query,")
    lines.append("      body: body,")
    lines.append(
      "      pathParams: mergedPathParams.isEmpty ? null : mergedPathParams,"
    )
    lines.append("    );")
    lines.append("  }")
    lines.append("")
  lines.append("}")
  lines.append("")
  (host_dir / f"{group}.dart").write_text("\n".join(lines), encoding="utf-8")


def write_group_test(host: str, group: str) -> None:
  ns_cls = f"{host.capitalize()}Namespace"
  test_dir = TEST / host
  test_dir.mkdir(parents=True, exist_ok=True)
  content = f"""import 'package:norbix_dart/src/core/transport.dart';
import 'package:norbix_dart/src/{host}/{host}.dart';
import 'package:test/test.dart';

void main() {{
  test('{host}.{group} module can be constructed', () {{
    const config = TransportConfig(
      baseUrlApi: 'https://api.norbix.dev',
      baseUrlHub: 'https://hub.norbix.dev',
      apiVersion: 'v1',
      hubVersion: 'v1',
    );
    final ns = {ns_cls}(Transport(config));
    final module = ns.{safe_ident(group)};
    expect(module, isNotNull);
  }});
}}
"""
  (test_dir / f"{group}_module_test.dart").write_text(content, encoding="utf-8")


def write_group_doc(host: str, group: str, endpoints: list[Endpoint]) -> None:
  doc_dir = DOCS / host
  doc_dir.mkdir(parents=True, exist_ok=True)
  lines = [f"# {host.upper()} {group} module", ""]
  lines.append("Generated from Dart DTO route contracts.")
  lines.append("")
  for ep in endpoints:
    lines.append(f"- `{ep.method}` `{ep.route}` -> `{camel_case(ep.request)}`")
  lines.append("")
  (doc_dir / f"{group}.md").write_text("\n".join(lines), encoding="utf-8")


def safe_ident(name: str) -> str:
  keywords = {
    "abstract","as","assert","async","await","break","case","catch","class","const",
    "continue","covariant","default","deferred","do","dynamic","else","enum","export",
    "extends","extension","external","factory","false","final","finally","for","Function",
    "get","if","implements","import","in","interface","is","late","library","mixin",
    "new","null","on","operator","part","required","rethrow","return","set","show",
    "static","super","switch","sync","this","throw","true","try","typedef","var","void",
    "while","with","yield"
  }
  return f"{name}_" if name in keywords else name


def camel_case(name: str) -> str:
  return name[:1].lower() + name[1:] if name else name


def group_by(items: Iterable[Endpoint]) -> dict[str, list[Endpoint]]:
  out: dict[str, list[Endpoint]] = {}
  for i in items:
    out.setdefault(i.group, []).append(i)
  return out


def write_exports(host: str, groups: list[str]) -> None:
  lines = [f"export '{host}.dart';"] + [f"export '{g}.dart';" for g in groups]
  (LIB / host / "__init__.dart").write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
  clean_generated_outputs()
  inputs = [("api", "api"), ("hub", "hub")]

  for host, stem in inputs:
    dart_dto = ROOT / "references" / f"{stem}.dtos.dart"
    ts_dto = ROOT.parent.parent / "cloud" / "src" / "types" / f"{stem}2.dtos.ts"
    if dart_dto.exists():
      endpoints = parse_dart_dtos(dart_dto, host)
    elif ts_dto.exists():
      endpoints = parse_typescript_dtos(ts_dto, host)
    else:
      raise FileNotFoundError(
        f"No DTO source found for {host}: expected {dart_dto} or {ts_dto}"
      )
    grouped = group_by(endpoints)
    groups = sorted(grouped.keys())
    write_namespace(host, endpoints)
    for group in groups:
      write_group_module(host, group, grouped[group])
      write_group_test(host, group)
      write_group_doc(host, group, grouped[group])
    write_exports(host, groups)


if __name__ == "__main__":
  main()
