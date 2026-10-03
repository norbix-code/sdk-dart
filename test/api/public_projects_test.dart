import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('publicProjects — public project routes', () {
    test(
        'getPublicProjectConfig sends GET /{version}/public/projects/{ProjectId}/config',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).publicProjects.getPublicProjectConfig(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/public/projects/projectId_1/config'));
      expect(driver.lastRequest!.headers['x-api-key'], isNull);
    });
    test(
        'getPublicProjectLegal sends GET /{version}/public/projects/{ProjectId}/legal/{Kind}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).publicProjects.getPublicProjectLegal(
          projectId: 'projectId_1', kind: 'kind_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/public/projects/projectId_1/legal/kind_1'));
      expect(driver.lastRequest!.headers['x-api-key'], isNull);
    });
  });
}
