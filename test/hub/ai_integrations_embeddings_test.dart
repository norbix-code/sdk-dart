import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('aiIntegrations — wave-3 routes', () {
    test(
        'getEmbeddingIntegrations sends GET /{version}/ai/integrations/embeddings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .getEmbeddingIntegrations(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/embeddings'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'saveEmbeddingIntegration sends POST /{version}/ai/integrations/embeddings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .saveEmbeddingIntegration(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/embeddings'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'getEmbeddingIntegration sends GET /{version}/ai/integrations/embeddings/{Id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .getEmbeddingIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/embeddings/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteEmbeddingIntegration sends DELETE /{version}/ai/integrations/embeddings/{Id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .deleteEmbeddingIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/embeddings/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'testEmbeddingIntegration sends POST /{version}/ai/integrations/embeddings/{Id}/test',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .testEmbeddingIntegration(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/embeddings/id_1/test'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'setLlmIntegrationAsDefault sends PUT /{version}/ai/integrations/llms/{Id}/default',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiIntegrations
          .setLlmIntegrationAsDefault(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/integrations/llms/id_1/default'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
