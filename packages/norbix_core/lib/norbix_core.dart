/// Shared core for Norbix Dart SDKs.
///
/// You normally do not depend on this package directly. Instead, install
/// `norbix_api` for the project-scoped API or `norbix_hub` for the
/// account-scoped Hub. Both packages re-export the symbols they need.
library;

export 'src/config.dart';
export 'src/errors.dart';
export 'src/http_driver.dart';
export 'src/resource.dart';
export 'src/transport.dart';
