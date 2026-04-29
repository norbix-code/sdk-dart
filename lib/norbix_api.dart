/// Project-scoped Norbix API (https://api.norbix.ai).
///
/// Resources are exposed directly on [NorbixApi]:
///
/// ```dart
/// final api = NorbixApi();
/// await api.users.getUsers();
/// await api.auth.authenticate();
/// ```
library;

// Re-export shared core types so callers don't need a separate import.
export 'src/core/config.dart';
export 'src/core/errors.dart';
export 'src/core/http_driver.dart';
export 'src/core/resource.dart';
export 'src/core/transport.dart';

export 'src/api/client.dart' show NorbixApi, kNorbixApiDefaultBaseUrl;
export 'src/api/resources/api_keys.dart';
export 'src/api/resources/auth.dart';
export 'src/api/resources/users.dart';
