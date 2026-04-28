/// Official Dart SDK for the project-scoped Norbix API (https://api.norbix.ai). Resources are exposed directly on [NorbixApi]: `client.users.getUsers(...)`, `client.auth.authenticate(...)`.
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

export 'src/client.dart' show NorbixApi, kNorbixApiDefaultBaseUrl;
export 'src/resources/api_keys.dart';
export 'src/resources/auth.dart';
export 'src/resources/users.dart';
