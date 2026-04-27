import '../api/api.dart';
import '../hub/hub.dart';
import 'transport.dart';

class Norbix {
  final Transport transport;
  late final ApiNamespace api;
  late final HubNamespace hub;

  Norbix({
    String? baseUrlApi,
    String? baseUrlHub,
    String? apiVersion,
    String? hubVersion,
    String? apiKey,
    String? bearerToken,
    Transport? transportOverride,
  }) : transport = transportOverride ??
            Transport(
              TransportConfig(
                baseUrlApi: baseUrlApi ?? 'https://api.norbix.dev',
                baseUrlHub: baseUrlHub ?? 'https://hub.norbix.dev',
                apiVersion: apiVersion ?? 'v1',
                hubVersion: hubVersion ?? 'v1',
                apiKey: apiKey,
                bearerToken: bearerToken,
              ),
            ) {
    api = ApiNamespace(transport);
    hub = HubNamespace(transport);
  }

  void setBearerToken(String token) {
    transport.config = TransportConfig(
      baseUrlApi: transport.config.baseUrlApi,
      baseUrlHub: transport.config.baseUrlHub,
      apiVersion: transport.config.apiVersion,
      hubVersion: transport.config.hubVersion,
      apiKey: transport.config.apiKey,
      bearerToken: token,
    );
  }

  void setApiKey(String key) {
    transport.config = TransportConfig(
      baseUrlApi: transport.config.baseUrlApi,
      baseUrlHub: transport.config.baseUrlHub,
      apiVersion: transport.config.apiVersion,
      hubVersion: transport.config.hubVersion,
      apiKey: key,
      bearerToken: transport.config.bearerToken,
    );
  }

  void close() => transport.close();
}
