import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('aiIntegrations — LLM and MCP enable, disable, delete', () {
    test(
        'deleteLlmIntegration sends DELETE /{version}/ai/integrations/llms/{Id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .deleteLlmIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/llms/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'enableLlmIntegration sends PUT /{version}/ai/integrations/llms/{Id}/enable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .enableLlmIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/llms/id_1/enable'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'disableLlmIntegration sends PUT /{version}/ai/integrations/llms/{Id}/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .disableLlmIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/llms/id_1/disable'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteMcpIntegration sends DELETE /{version}/ai/integrations/mcp/{Id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .deleteMcpIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/mcp/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'enableMcpIntegration sends PUT /{version}/ai/integrations/mcp/{Id}/enable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .enableMcpIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/mcp/id_1/enable'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'disableMcpIntegration sends PUT /{version}/ai/integrations/mcp/{Id}/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .disableMcpIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/ai/integrations/mcp/id_1/disable'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
