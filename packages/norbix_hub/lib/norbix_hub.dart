/// Official Dart SDK for the account-scoped Norbix Hub (https://hub.norbix.ai). Resources are exposed directly on [NorbixHub]: `client.projects.getProjects(...)`, `client.database.getDatabaseSchemas(...)`.
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

export 'src/client.dart' show NorbixHub, kNorbixHubDefaultBaseUrl;
export 'src/resources/accounts.dart';
export 'src/resources/ai_integrations.dart';
export 'src/resources/api_keys.dart';
export 'src/resources/auth.dart';
export 'src/resources/database.dart';
export 'src/resources/echo.dart';
export 'src/resources/email_notifications.dart';
export 'src/resources/email_unsubscribe.dart';
export 'src/resources/files.dart';
export 'src/resources/internals.dart';
export 'src/resources/logs.dart';
export 'src/resources/membership.dart';
export 'src/resources/payments.dart';
export 'src/resources/projects.dart';
export 'src/resources/push_notifications.dart';
export 'src/resources/scheduler.dart';
export 'src/resources/triggers.dart';
export 'src/resources/user_notification_preferences.dart';
export 'src/resources/webhooks.dart';
