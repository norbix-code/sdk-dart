import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.integrations` — the keyless cloud connection setup (gateway
/// feat/keyless-cloud), against the fake driver: verb, path, query, answer.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  test(
      'getKeylessIntegrationSetup → GET /v3/integrations/keyless/setup, module / cloud / id in the query',
      () async {
    final driver = FakeHttpDriver((_) => const HttpDriverResponse(
          statusCode: 200,
          headers: {'content-type': 'application/json'},
          body: '{"integrationId":"int_1","module":"files","cloud":"aws",'
              '"issuer":"https://issuer.example","available":true,'
              '"subject":"p/proj/e/PROD/files/i/int_1","audience":"sts.amazonaws.com",'
              '"script":"aws iam create-role ..."}',
        ));

    final result =
        await _client(driver).integrations.getKeylessIntegrationSetup(
      query: {'module': 'files', 'cloud': 'aws', 'integrationId': 'int_1'},
    );

    final req = driver.lastRequest!;
    expect(req.method, equals('GET'));
    expect(req.url.path, equals('/v3/integrations/keyless/setup'));
    expect(
      req.url.queryParameters,
      equals({'module': 'files', 'cloud': 'aws', 'integrationId': 'int_1'}),
    );
    expect(req.body, isNull);
    final answer = result as Map<String, dynamic>;
    expect(answer['available'], isTrue);
    expect(answer['subject'], equals('p/proj/e/PROD/files/i/int_1'));
    expect(answer['script'], equals('aws iam create-role ...'));
  });
}
