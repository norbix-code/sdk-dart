/// Account-scoped Norbix Hub (https://hub.norbix.ai).
///
/// Resources are exposed directly on [NorbixHub]:
///
/// ```dart
/// final hub = NorbixHub();
/// await hub.projects.getProjects();
/// await hub.database.getDatabaseSchemas();
/// ```
library;

// Re-export shared core types so callers don't need a separate import.
export 'src/core/config.dart';
export 'src/core/errors.dart';
export 'src/core/http_driver.dart';
export 'src/core/resource.dart';
export 'src/core/transport.dart';

export 'src/hub/client.dart' show NorbixHub, kNorbixHubDefaultBaseUrl;
export 'src/hub/resources/accounts.dart';
export 'src/hub/resources/ai_integrations.dart';
export 'src/hub/resources/api_keys.dart';
export 'src/hub/resources/auth.dart';
export 'src/hub/resources/database.dart';
export 'src/hub/resources/echo.dart';
export 'src/hub/resources/email_notifications.dart';
export 'src/hub/resources/email_unsubscribe.dart';
export 'src/hub/resources/files.dart';
export 'src/hub/resources/internals.dart';
export 'src/hub/resources/logs.dart';
export 'src/hub/resources/membership.dart';
export 'src/hub/resources/payments.dart';
export 'src/hub/resources/projects.dart';
export 'src/hub/resources/push_notifications.dart';
export 'src/hub/resources/scheduler.dart';
export 'src/hub/resources/triggers.dart';
export 'src/hub/resources/user_notification_preferences.dart';
export 'src/hub/resources/webhooks.dart';
