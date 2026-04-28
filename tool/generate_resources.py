#!/usr/bin/env python3
"""
Resource-bucket generator for norbix_api and norbix_hub.

Reads /tmp/norbix-gen/api_routes.txt and /tmp/norbix-gen/hub_routes.txt
(format: methodName|HTTPMETHOD|'/route/path') and emits Dart resource files,
a client.dart, and the public library entry point for each package.

Resource grouping is route-prefix-driven (e.g. /v1/account/projects/* ->
ProjectsResource). Method names are cleaned up:
  - drop trailing "Request"
  - replace trailing "2" (codegen collision) with "Alt"
  - within a resource, drop the redundant resource-name prefix
    (e.g. inside ProjectsResource, "getProject" stays as "getProject" —
    we keep these readable even when slightly verbose, because Dart
    auto-complete sorts alphabetically and grouping by prefix helps).
PascalCase {Id} placeholders coming from the .NET server are normalised
to camelCase in the path before substitution.
"""

from __future__ import annotations

import os
import re
from collections import defaultdict
from dataclasses import dataclass

ROOT = "/sessions/zen-busy-ritchie/mnt/norbix-dart"
PKG_API = f"{ROOT}/packages/norbix_api"
PKG_HUB = f"{ROOT}/packages/norbix_hub"

API_ROUTES = "/tmp/norbix-gen/api_routes.txt"
HUB_ROUTES = "/tmp/norbix-gen/hub_routes.txt"


@dataclass
class Endpoint:
    method_name: str  # cleaned Dart method name
    http_method: str  # GET / POST / ...
    route: str        # raw route, with {paramName} placeholders


# ---------- routing rules ----------------------------------------------------

# (resource_id, resource_class, dart_field, file_name, predicate)
# The first matching predicate wins. Each predicate gets the cleaned route.
def _api_resource(route: str) -> str:
    if route.startswith("/auth") or route == "/access-token":
        return "auth"
    if route.startswith("/apikeys"):
        return "apiKeys"
    if route.startswith("/{version}/membership/users"):
        return "users"
    return "misc"


def _hub_resource(route: str) -> str:
    if route.startswith("/auth") or route.startswith("/v3/auth") or route == "/access-token":
        return "auth"
    if route.startswith("/apikeys"):
        return "apiKeys"
    if route.startswith("/internal/"):
        return "internals"
    if route.startswith("/{version}/echo"):
        return "echo"
    if route.startswith("/{version}/account/projects"):
        return "projects"
    if route.startswith("/{version}/account"):
        return "accounts"
    if route.startswith("/{version}/ai/integrations"):
        return "aiIntegrations"
    if route.startswith("/{version}/database"):
        return "database"
    if route.startswith("/{version}/email/one-click"):
        return "emailUnsubscribe"
    if route.startswith("/{version}/files"):
        return "files"
    if route.startswith("/{version}/logs"):
        return "logs"
    if route.startswith("/{version}/membership"):
        return "membership"
    if route.startswith("/{version}/notifications/email"):
        return "emailNotifications"
    if route.startswith("/{version}/notifications/emails"):
        # Server-side spelling slip — group with the canonical email module.
        return "emailNotifications"
    if route.startswith("/{version}/notifications/push"):
        return "pushNotifications"
    if route.startswith("/{version}/notifications/user"):
        return "userNotificationPreferences"
    if route.startswith("/{version}/payments"):
        return "payments"
    if route.startswith("/{version}/scheduler"):
        return "scheduler"
    if route.startswith("/{version}/triggers"):
        return "triggers"
    if route.startswith("/{version}/webhooks"):
        return "webhooks"
    return "misc"


# Resource id -> (Dart class name, file name, doc)
RESOURCE_META: dict[str, tuple[str, str, str]] = {
    # api package
    "auth":          ("AuthResource",          "auth",          "Authentication: API keys, access tokens, OAuth providers."),
    "apiKeys":       ("ApiKeysResource",       "api_keys",      "API keys for the current project / environment."),
    "users":         ("UsersResource",         "users",         "Project membership users (create, list, block, invite, register variants)."),
    # hub package extras
    "internals":     ("InternalsResource",     "internals",     "Internal Norbix utilities (typegen, debug)."),
    "echo":          ("EchoResource",          "echo",          "Health-check / echo endpoint."),
    "projects":      ("ProjectsResource",      "projects",      "Account projects: CRUD, settings, notifications, tokens."),
    "accounts":      ("AccountsResource",      "accounts",      "Account profile, team, licenses, regions, status, Stripe billing, AI chat."),
    "aiIntegrations":("AiIntegrationsResource","ai_integrations","LLM and MCP integrations (configure, test, enable/disable)."),
    "database":      ("DatabaseResource",      "database",      "Database schemas, taxonomies, aggregates, integrations, schema triggers."),
    "emailUnsubscribe":("EmailUnsubscribeResource","email_unsubscribe","RFC-8058 one-click unsubscribe endpoint."),
    "files":         ("FilesResource",         "files",         "File storage integrations and triggers."),
    "logs":          ("LogsResource",          "logs",          "Logging integrations."),
    "membership":    ("MembershipResource",    "membership",    "Membership integrations, roles, policies, triggers."),
    "emailNotifications":("EmailNotificationsResource","email_notifications","Email templates, campaigns, integrations, signatures, footers, settings."),
    "pushNotifications":("PushNotificationsResource","push_notifications","Push templates, integrations, devices."),
    "userNotificationPreferences":("UserNotificationPreferencesResource","user_notification_preferences","Per-user notification opt-ins."),
    "payments":      ("PaymentsResource",      "payments",      "Payments integrations and triggers."),
    "scheduler":     ("SchedulerResource",     "scheduler",     "Scheduled tasks."),
    "triggers":      ("TriggersResource",      "triggers",      "Unified triggers endpoints (cross-module)."),
    "webhooks":      ("WebhooksResource",      "webhooks",      "Outbound webhook destinations and integration settings."),
    "misc":          ("MiscResource",          "misc",          "Endpoints that did not match a known prefix."),
}


# ---------- input parsing ----------------------------------------------------

ROUTE_LINE_RE = re.compile(r"^([A-Za-z0-9_]+)\|'([A-Z]+)'\|'([^']+)'$")


def parse_routes(path: str) -> list[Endpoint]:
    out: list[Endpoint] = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            m = ROUTE_LINE_RE.match(line)
            if not m:
                raise ValueError(f"Bad line: {line!r}")
            method_name, http_method, route = m.groups()
            cleaned = clean_method_name(method_name)
            normalized = normalize_path_params(route)
            out.append(Endpoint(cleaned, http_method, normalized))
    return out


def clean_method_name(name: str) -> str:
    # Drop trailing "Request" (pure server-DTO noise — every endpoint already
    # IS a request).
    if name.endswith("Request") and name != "Request":
        name = name[: -len("Request")]
    # Trailing digits (`getApiKeys2`, `authenticate3`) come from the codegen
    # collision suffixer and we keep them — renaming to Alt/AltAlt is worse.
    return name


def normalize_path_params(route: str) -> str:
    """Lower-case PascalCase {Id}/{Environment}/{TaxonomyId}/{DestinationId}
    placeholders so Dart consumers pass `id:`, `environment:` etc."""

    def repl(m: re.Match) -> str:
        inner = m.group(1)
        if inner == "version":
            return "{version}"
        # Camel-case the placeholder.
        cc = inner[:1].lower() + inner[1:]
        return "{" + cc + "}"

    return re.sub(r"\{([A-Za-z_][A-Za-z0-9_]*)\}", repl, route)


# ---------- code emission ----------------------------------------------------

DART_HEADER = "// GENERATED FILE. Do not edit by hand.\n// Regenerate with: dart run tool/generate_resources.dart\n\n"


def extract_path_params(route: str) -> list[str]:
    return [p for p in re.findall(r"\{([A-Za-z_][A-Za-z0-9_]*)\}", route) if p != "version"]


def emit_resource_file(
    pkg_dir: str,
    resource_id: str,
    class_name: str,
    doc: str,
    endpoints: list[Endpoint],
) -> str:
    methods: list[str] = []
    for ep in sorted(endpoints, key=lambda e: e.method_name):
        path_params = extract_path_params(ep.route)
        params: list[str] = []
        for pp in path_params:
            if pp == "projectId":
                # Allow projectId to come from client-level context.
                params.append("Object? projectId")
            else:
                params.append(f"required Object {pp}")
        params.append("Map<String, Object?>? query")
        if ep.http_method != "GET":
            params.append("Object? body")
        params.append("Map<String, String>? headers")
        param_block = ", ".join(params)
        path_param_map = (
            "<String, Object?>{"
            + ", ".join(f"'{p}': {p}" for p in path_params)
            + "}"
        ) if path_params else "null"
        body_arg = "" if ep.http_method == "GET" else "      body: body,\n"
        method = (
            f"  /// `{ep.http_method} {ep.route}`\n"
            f"  Future<Object?> {ep.method_name}({{ {param_block} }}) {{\n"
            f"    return transport.send(\n"
            f"      route: '{ep.route}',\n"
            f"      method: '{ep.http_method}',\n"
            f"      query: query,\n"
            f"{body_arg}"
            f"      headers: headers,\n"
            f"      pathParams: {path_param_map},\n"
            f"    );\n"
            f"  }}\n"
        )
        methods.append(method)

    body = (
        DART_HEADER
        + "import 'package:norbix_core/norbix_core.dart';\n\n"
        + f"/// {doc}\n"
        + f"class {class_name} extends Resource {{\n"
        + f"  {class_name}(super.transport);\n\n"
        + "\n".join(methods)
        + "}\n"
    )
    file_name = RESOURCE_META[resource_id][1]
    out_path = os.path.join(pkg_dir, "lib", "src", "resources", f"{file_name}.dart")
    with open(out_path, "w") as f:
        f.write(body)
    return out_path


def emit_client(pkg_dir: str, host_class: str, default_url_var: str, default_url: str,
                env_vars: dict[str, str], resource_ids: list[str]) -> None:
    io_import = "import 'dart:io' show Platform;\n\n" if host_class == "NorbixHub" else ""
    ctor_project_param = ", Object? projectId" if host_class == "NorbixHub" else ""
    ctor_project_default = "          defaultPathParams: {'projectId': projectId},\n" if host_class == "NorbixHub" else ""
    env_project_doc = "  ///   NORBIX_HUB_PROJECT_ID\n" if host_class == "NorbixHub" else ""
    env_project_read = (
        "    final env = <String, String>{\n"
        "      ...Platform.environment,\n"
        "      ...?overrides,\n"
        "    };\n"
        "    final projectId = env['NORBIX_HUB_PROJECT_ID'];\n"
        if host_class == "NorbixHub" else ""
    )
    env_project_arg = ", projectId: projectId" if host_class == "NorbixHub" else ""
    project_helpers = (
        "\n"
        "  /// Project context used for routes that include `{projectId}`.\n"
        "  /// Per-call parameters still override this default.\n"
        "  Object? get projectId => _transport.defaultPathParams['projectId'];\n"
        "\n"
        "  /// Set or replace the default project context at runtime.\n"
        "  void setProjectId(Object? projectId) =>\n"
        "      _transport.defaultPathParams['projectId'] = projectId;\n"
        if host_class == "NorbixHub" else ""
    )
    imports = "\n".join(
        f"import 'resources/{RESOURCE_META[r][1]}.dart';" for r in resource_ids
    )
    fields = "\n".join(
        f"  late final {RESOURCE_META[r][0]} {r} = {RESOURCE_META[r][0]}(_transport);"
        for r in resource_ids
    )
    host_label = host_class.replace('Norbix', '')

    body = f"""// GENERATED FILE. Do not edit by hand.
// Regenerate with: python3 tool/generate_resources.py

{io_import}import 'package:norbix_core/norbix_core.dart';

{imports}

/// Default base URL for the public Norbix {host_label} host.
const String {default_url_var} = '{default_url}';

/// Norbix {host_label} client.
///
/// Resources are exposed as direct properties — for example
/// `client.{resource_ids[0]}.someMethod(...)` — so callers do NOT navigate
/// a redundant `client.xxx.{resource_ids[0]}` namespace.
class {host_class} {{
  /// Build a client. Defaults to the public Norbix host. To point at a
  /// self-hosted deployment (e.g. `https://api.norbix.isidos.lt` or
  /// `http://localhost:5000`), pass a [NorbixConfig] with the desired URL.
  ///
  /// ```dart
  /// final client = {host_class}();                          // public host
  /// final client = {host_class}(
  ///   config: NorbixConfig(
  ///     baseUrl: 'http://localhost:5000',
  ///     apiKey: 'nbx_dev_...',
  ///   ),
  /// );
  /// ```
  {host_class}({{NorbixConfig? config, HttpDriver? driver{ctor_project_param}}})
      : _transport = Transport(
          config: config ?? NorbixConfig(baseUrl: {default_url_var}),
          driver: driver,
{ctor_project_default}        
        );

  /// Build a client that reads its base URL and credentials from
  /// environment variables. Falls back to the public host when the
  /// URL var is not set, so callers always get a usable client.
  ///
  /// Recognised variables:
  ///   {env_vars['baseUrl']}        (default {default_url})
  ///   {env_vars['apiKey']}
  ///   {env_vars['bearer']}
  ///   {env_vars['version']}        (default v1)
  ///   {env_vars['timeout']}
  ///   {env_vars['retries']}
{env_project_doc}  
  factory {host_class}.fromEnv({{
    Map<String, String>? overrides,
    HttpDriver? driver,
  }}) {{
{env_project_read}    
    final cfg = NorbixConfig.fromEnv(
      defaultBaseUrl: {default_url_var},
      baseUrlVar: '{env_vars['baseUrl']}',
      apiKeyVar: '{env_vars['apiKey']}',
      bearerTokenVar: '{env_vars['bearer']}',
      apiVersionVar: '{env_vars['version']}',
      timeoutMsVar: '{env_vars['timeout']}',
      maxRetriesVar: '{env_vars['retries']}',
      overrides: overrides,
    );
    return {host_class}(config: cfg, driver: driver{env_project_arg});
  }}

  final Transport _transport;

  /// Currently active configuration. Mutate via [setApiKey], [setBearerToken],
  /// or by passing a new [NorbixConfig] at construction time.
  NorbixConfig get config => _transport.config;

  /// Replace the API key without rebuilding the client.
  void setApiKey(String? key) =>
      _transport.config = _transport.config.copyWith(apiKey: key);

  /// Replace the bearer token without rebuilding the client.
  void setBearerToken(String? token) =>
      _transport.config = _transport.config.copyWith(bearerToken: token);

  /// Replace the entire configuration. Useful for switching environments
  /// (staging <-> production) at runtime.
  void setConfig(NorbixConfig config) => _transport.config = config;
{project_helpers}

{fields}

  /// Closes the underlying HTTP client. Call when you are done.
  void close() => _transport.close();
}}
"""
    with open(os.path.join(pkg_dir, "lib", "src", "client.dart"), "w") as f:
        f.write(body)


def emit_library(pkg_dir: str, lib_name: str, host_class: str, resource_ids: list[str], doc: str) -> None:
    exports = "\n".join(
        f"export 'src/resources/{RESOURCE_META[r][1]}.dart';" for r in resource_ids
    )
    body = f"""/// {doc}
library;

export 'package:norbix_core/norbix_core.dart'
    show
        NorbixConfig,
        NorbixError,
        NorbixAuthError,
        NorbixNotFoundError,
        NorbixRateLimitError,
        NorbixClientError,
        NorbixServerError,
        NorbixTransportError,
        HttpDriver,
        HttpClientDriver;

export 'src/client.dart' show {host_class}, k{host_class}DefaultBaseUrl;
{exports}
"""
    # Replace placeholder with actual default URL constant name later via a sed.
    with open(os.path.join(pkg_dir, "lib", f"{lib_name}.dart"), "w") as f:
        f.write(body)


# ---------- driver -----------------------------------------------------------

def build_package(routes_file: str, pkg_dir: str, lib_name: str, host_class: str,
                  default_url_var: str, default_url: str, env_vars: dict[str, str],
                  doc: str, router) -> None:
    endpoints = parse_routes(routes_file)
    bucketed: dict[str, list[Endpoint]] = defaultdict(list)
    for ep in endpoints:
        bucketed[router(ep.route)].append(ep)

    # Drop the misc bucket if empty.
    if not bucketed.get("misc"):
        bucketed.pop("misc", None)

    resource_ids = sorted(bucketed.keys())
    os.makedirs(os.path.join(pkg_dir, "lib", "src", "resources"), exist_ok=True)

    for rid in resource_ids:
        klass, _, rdoc = RESOURCE_META[rid]
        emit_resource_file(pkg_dir, rid, klass, rdoc, bucketed[rid])

    emit_client(pkg_dir, host_class, default_url_var, default_url, env_vars, resource_ids)
    emit_library(pkg_dir, lib_name, host_class, resource_ids, doc)


def main() -> None:
    build_package(
        API_ROUTES,
        PKG_API,
        lib_name="norbix_api",
        host_class="NorbixApi",
        default_url_var="kNorbixApiDefaultBaseUrl",
        default_url="https://api.norbix.ai",
        env_vars={
            "baseUrl": "NORBIX_API_BASE_URL",
            "apiKey":  "NORBIX_API_KEY",
            "bearer":  "NORBIX_API_BEARER_TOKEN",
            "version": "NORBIX_API_VERSION",
            "timeout": "NORBIX_API_TIMEOUT_MS",
            "retries": "NORBIX_API_MAX_RETRIES",
        },
        doc="Official Dart SDK for the project-scoped Norbix API "
            "(https://api.norbix.ai). Resources are exposed directly on "
            "[NorbixApi]: `client.users.getUsers(...)`, "
            "`client.auth.authenticate(...)`.",
        router=_api_resource,
    )
    build_package(
        HUB_ROUTES,
        PKG_HUB,
        lib_name="norbix_hub",
        host_class="NorbixHub",
        default_url_var="kNorbixHubDefaultBaseUrl",
        default_url="https://hub.norbix.ai",
        env_vars={
            "baseUrl": "NORBIX_HUB_BASE_URL",
            "apiKey":  "NORBIX_HUB_API_KEY",
            "bearer":  "NORBIX_HUB_BEARER_TOKEN",
            "version": "NORBIX_HUB_VERSION",
            "timeout": "NORBIX_HUB_TIMEOUT_MS",
            "retries": "NORBIX_HUB_MAX_RETRIES",
        },
        doc="Official Dart SDK for the account-scoped Norbix Hub "
            "(https://hub.norbix.ai). Resources are exposed directly on "
            "[NorbixHub]: `client.projects.getProjects(...)`, "
            "`client.database.getDatabaseSchemas(...)`.",
        router=_hub_resource,
    )


if __name__ == "__main__":
    main()
