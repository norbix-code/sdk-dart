import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.scheduler` — all 8 Scheduler Hub endpoints, one test per method,
/// against the fake driver (never a real server): verb, full path with the
/// task id substituted, where the parameters go (path / query / body), and
/// for save the JSON body with the typed email-campaign task.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.scheduler — module', () {
    test('enableScheduler → PUT /v1/scheduler/enable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.enableScheduler();

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/enable'),
      );
    });

    test('disableScheduler → PUT /v1/scheduler/disable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.disableScheduler();

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/disable'),
      );
    });
  });

  group('hub.scheduler — tasks', () {
    test('getSchedulerTasks → GET /v1/scheduler/tasks, filters in the query',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.getSchedulerTasks(query: {
        'type': 'EmailCampaign',
        'enabled': true,
        'startingAfter': 'tsk_0',
        'pageSize': 20,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v1/scheduler/tasks'));
      expect(
        req.url.queryParameters,
        equals({
          'type': 'EmailCampaign',
          'enabled': 'true',
          'startingAfter': 'tsk_0',
          'pageSize': '20',
        }),
      );
      expect(req.body, isNull);
    });

    test('getSchedulerTask → GET /v1/scheduler/tasks/{id}, id in the path',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.getSchedulerTask(id: 'tsk_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/tasks/tsk_1'),
      );
      expect(driver.lastRequest!.body, isNull);
    });

    test('saveSchedulerTask → POST /v1/scheduler/tasks with the typed task',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.saveSchedulerTask(body: {
        'name': 'Weekly digest',
        'cron': '0 9 * * 1',
        'initiatorUserId': 'usr_1',
        'isEnabled': true,
        'stopOnError': false,
        'task': {
          'type': 'EmailCampaign',
          'campaign': {
            'source': 'AllUsers',
            'templateId': 'tmpl_1',
          },
        },
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(
        req.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/tasks'),
      );
      expect(
        jsonDecode(req.body!),
        equals({
          'name': 'Weekly digest',
          'cron': '0 9 * * 1',
          'initiatorUserId': 'usr_1',
          'isEnabled': true,
          'stopOnError': false,
          'task': {
            'type': 'EmailCampaign',
            'campaign': {'source': 'AllUsers', 'templateId': 'tmpl_1'},
          },
        }),
      );
    });

    test('deleteSchedulerTask → DELETE /v1/scheduler/tasks/{id}', () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.deleteSchedulerTask(id: 'tsk_1');

      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/tasks/tsk_1'),
      );
    });

    test('enableSchedulerTask → PUT /v1/scheduler/tasks/{id}/enable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.enableSchedulerTask(id: 'tsk_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/tasks/tsk_1/enable'),
      );
    });

    test('disableSchedulerTask → PUT /v1/scheduler/tasks/{id}/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).scheduler.disableSchedulerTask(id: 'tsk_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        equals('https://hub.norbix.ai/v1/scheduler/tasks/tsk_1/disable'),
      );
    });
  });
}
