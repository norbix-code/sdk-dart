import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('projects — admin portal and legal settings', () {
    test(
        'updateProjectAdminUrl sends PATCH /{version}/account/projects/{projectId}/settings/admin-url',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.updateProjectAdminUrl(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PATCH'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/settings/admin-url'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'updateProjectLegalDocuments sends PATCH /{version}/account/projects/{projectId}/settings/legal',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.updateProjectLegalDocuments(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PATCH'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/settings/legal'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'updateProjectExposeLegal sends PATCH /{version}/account/projects/{projectId}/settings/legal/expose',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.updateProjectExposeLegal(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PATCH'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/settings/legal/expose'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'getAdminPortalStructure sends GET /{version}/account/projects/{projectId}/admin-portal/structure',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.getAdminPortalStructure(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/admin-portal/structure'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'assignAdminPortalServiceUser sends PUT /{version}/account/projects/{projectId}/settings/admin-portal/service-user',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.assignAdminPortalServiceUser(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
          driver.lastRequest!.url.toString(),
          endsWith(
              '/v1/account/projects/projectId_1/settings/admin-portal/service-user'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
