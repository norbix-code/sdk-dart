import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.integrations` — saved secrets of an integration of any module
/// (gateway docs/tasks/secret-fields.md), against the fake driver: verb,
/// path, query / body, answer. The read never carries a value.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  test(
      'getIntegrationSecrets → GET /v3/integrations/{id}/secrets, env in the query',
      () async {
    final driver = FakeHttpDriver(
      (_) => const HttpDriverResponse(
        statusCode: 200,
        headers: {'content-type': 'application/json'},
        body: '{"result":['
            '{"key":"secretKey","field":"secretKey","isSet":true,"isOptional":false},'
            '{"key":"webhookSigningSecret","field":"webhookSigningSecret","isSet":false,"isOptional":true}]}',
      ),
    );

    final result = await _client(driver)
        .integrations
        .getIntegrationSecrets(integrationId: 'int_1', query: {'env': 'TEST'});

    final req = driver.lastRequest!;
    expect(req.method, equals('GET'));
    expect(req.url.path, equals('/v3/integrations/int_1/secrets'));
    expect(req.url.queryParameters['env'], equals('TEST'));
    expect(req.body, isNull);
    final rows = (result as Map<String, dynamic>)['result'] as List;
    expect(rows, hasLength(2));
    expect(
      rows.first,
      equals({
        'key': 'secretKey',
        'field': 'secretKey',
        'isSet': true,
        'isOptional': false,
      }),
    );
  });

  test(
      'removeIntegrationSecrets → POST /v3/integrations/{id}/secrets/remove, keys in the body',
      () async {
    final driver = FakeHttpDriver(
      (_) => const HttpDriverResponse(
        statusCode: 200,
        headers: {'content-type': 'application/json'},
        body: '{"id":"int_1"}',
      ),
    );

    final result = await _client(driver).integrations.removeIntegrationSecrets(
      integrationId: 'int_1',
      body: {
        'keys': ['webhookSigningSecret'],
      },
    );

    final req = driver.lastRequest!;
    expect(req.method, equals('POST'));
    expect(req.url.path, equals('/v3/integrations/int_1/secrets/remove'));
    expect(req.body, contains('"keys":["webhookSigningSecret"]'));
    expect((result as Map<String, dynamic>)['id'], equals('int_1'));
  });
}
