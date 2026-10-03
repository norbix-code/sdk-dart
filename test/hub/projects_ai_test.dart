import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('projects — wave-3 routes', () {
    test(
        'getProjectAiSettings sends GET /{version}/account/projects/{projectId}/ai/settings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.getProjectAiSettings(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/ai/settings'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'updateProjectAiSettings sends PUT /{version}/account/projects/{projectId}/ai/settings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.updateProjectAiSettings(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/ai/settings'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'createProjectAiAssistant sends POST /{version}/account/projects/{projectId}/ai/assistants',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.createProjectAiAssistant(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/ai/assistants'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'updateProjectAiAssistant sends PUT /{version}/account/projects/{projectId}/ai/assistants/{assistantId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.updateProjectAiAssistant(
          projectId: 'projectId_1',
          assistantId: 'assistantId_1',
          body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
          driver.lastRequest!.url.toString(),
          endsWith(
              '/v1/account/projects/projectId_1/ai/assistants/assistantId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteProjectAiAssistant sends DELETE /{version}/account/projects/{projectId}/ai/assistants/{assistantId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.deleteProjectAiAssistant(
          projectId: 'projectId_1',
          assistantId: 'assistantId_1',
          body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
          driver.lastRequest!.url.toString(),
          endsWith(
              '/v1/account/projects/projectId_1/ai/assistants/assistantId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'getProjectAiUsage sends GET /{version}/account/projects/{projectId}/ai/usage',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.getProjectAiUsage(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/ai/usage'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'setAdminPortalEnabled sends PUT /{version}/account/projects/{projectId}/admin-portal/enabled',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).projects.setAdminPortalEnabled(
          projectId: 'projectId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/projects/projectId_1/admin-portal/enabled'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
