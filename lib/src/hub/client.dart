// GENERATED FILE. Do not edit by hand.
// Regenerate with: python3 tool/generate_resources.py

import 'dart:io' show Platform;

import '../core/config.dart';
import '../core/http_driver.dart';
import '../core/transport.dart';

import 'resources/accounts.dart';
import 'resources/ai_integrations.dart';
import 'resources/api_keys.dart';
import 'resources/auth.dart';
import 'resources/database.dart';
import 'resources/echo.dart';
import 'resources/email_notifications.dart';
import 'resources/email_unsubscribe.dart';
import 'resources/files.dart';
import 'resources/internals.dart';
import 'resources/logs.dart';
import 'resources/membership.dart';
import 'resources/payments.dart';
import 'resources/projects.dart';
import 'resources/push_notifications.dart';
import 'resources/scheduler.dart';
import 'resources/triggers.dart';
import 'resources/user_notification_preferences.dart';
import 'resources/webhooks.dart';

/// Default base URL for the public Norbix Hub host.
const String kNorbixHubDefaultBaseUrl = 'https://hub.norbix.ai';

/// Norbix Hub client.
///
/// Resources are exposed as direct properties — for example
/// `client.accounts.someMethod(...)` — so callers do NOT navigate
/// a redundant `client.xxx.accounts` namespace.
class NorbixHub {
  /// Build a client. Defaults to the public Norbix host. To point at a
  /// self-hosted deployment (e.g. `https://api.norbix.isidos.lt` or
  /// `http://localhost:5000`), pass a [NorbixConfig] with the desired URL.
  ///
  /// ```dart
  /// final client = NorbixHub();                          // public host
  /// final client = NorbixHub(
  ///   config: NorbixConfig(
  ///     baseUrl: 'http://localhost:5000',
  ///     apiKey: 'nbx_dev_...',
  ///   ),
  /// );
  /// ```
  NorbixHub({
    NorbixConfig? config,
    HttpDriver? driver,
    Object? projectId,
    Object? accountId,
  }) : _transport = Transport(
          config: config ?? NorbixConfig(baseUrl: kNorbixHubDefaultBaseUrl),
          driver: driver,
          defaultPathParams: {'projectId': projectId, 'accountId': accountId},
        );

  /// Build a client that reads its base URL and credentials from
  /// environment variables. Falls back to the public host when the
  /// URL var is not set, so callers always get a usable client.
  ///
  /// Recognised variables:
  ///   NORBIX_HUB_BASE_URL        (default https://hub.norbix.ai)
  ///   NORBIX_HUB_API_KEY
  ///   NORBIX_HUB_BEARER_TOKEN
  ///   NORBIX_HUB_VERSION        (default v1)
  ///   NORBIX_HUB_TIMEOUT_MS
  ///   NORBIX_HUB_MAX_RETRIES
  ///   NORBIX_HUB_PROJECT_ID
  ///   NORBIX_HUB_ACCOUNT_ID
  factory NorbixHub.fromEnv({
    Map<String, String>? overrides,
    HttpDriver? driver,
  }) {
    final env = <String, String>{
      ...Platform.environment,
      ...?overrides,
    };
    final projectId = env['NORBIX_HUB_PROJECT_ID'];
    final accountId = env['NORBIX_HUB_ACCOUNT_ID'];
    final cfg = NorbixConfig.fromEnv(
      defaultBaseUrl: kNorbixHubDefaultBaseUrl,
      baseUrlVar: 'NORBIX_HUB_BASE_URL',
      apiKeyVar: 'NORBIX_HUB_API_KEY',
      bearerTokenVar: 'NORBIX_HUB_BEARER_TOKEN',
      apiVersionVar: 'NORBIX_HUB_VERSION',
      timeoutMsVar: 'NORBIX_HUB_TIMEOUT_MS',
      maxRetriesVar: 'NORBIX_HUB_MAX_RETRIES',
      overrides: overrides,
    );
    return NorbixHub(
      config: cfg,
      driver: driver,
      projectId: projectId,
      accountId: accountId,
    );
  }

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

  /// Project context used for routes that include `{projectId}`.
  /// Per-call parameters still override this default.
  Object? get projectId => _transport.defaultPathParams['projectId'];

  /// Set or replace the default project context at runtime.
  void setProjectId(Object? projectId) =>
      _transport.defaultPathParams['projectId'] = projectId;

  /// Account context used for routes that include `{accountId}`.
  /// Per-call parameters still override this default.
  Object? get accountId => _transport.defaultPathParams['accountId'];

  /// Set or replace the default account context at runtime.
  void setAccountId(Object? accountId) =>
      _transport.defaultPathParams['accountId'] = accountId;

  late final AccountsResource accounts = AccountsResource(_transport);
  late final AiIntegrationsResource aiIntegrations =
      AiIntegrationsResource(_transport);
  late final ApiKeysResource apiKeys = ApiKeysResource(_transport);
  late final AuthResource auth = AuthResource(_transport);
  late final DatabaseResource database = DatabaseResource(_transport);
  late final EchoResource echo = EchoResource(_transport);
  late final EmailNotificationsResource emailNotifications =
      EmailNotificationsResource(_transport);
  late final EmailUnsubscribeResource emailUnsubscribe =
      EmailUnsubscribeResource(_transport);
  late final FilesResource files = FilesResource(_transport);
  late final InternalsResource internals = InternalsResource(_transport);
  late final LogsResource logs = LogsResource(_transport);
  late final MembershipResource membership = MembershipResource(_transport);
  late final PaymentsResource payments = PaymentsResource(_transport);
  late final ProjectsResource projects = ProjectsResource(_transport);
  late final PushNotificationsResource pushNotifications =
      PushNotificationsResource(_transport);
  late final SchedulerResource scheduler = SchedulerResource(_transport);
  late final TriggersResource triggers = TriggersResource(_transport);
  late final UserNotificationPreferencesResource userNotificationPreferences =
      UserNotificationPreferencesResource(_transport);
  late final WebhooksResource webhooks = WebhooksResource(_transport);

  /// Closes the underlying HTTP client. Call when you are done.
  void close() => _transport.close();
}
