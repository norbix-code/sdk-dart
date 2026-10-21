import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.logs` — the log routes (gateway campaign audit/logging, Logs stage A
/// and finding L12), against the fake driver: verb, path, path param, query
/// and body.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _answering(String body) => FakeHttpDriver(
      (_) => HttpDriverResponse(
        statusCode: 200,
        headers: const {'content-type': 'application/json'},
        body: body,
      ),
    );

void main() {
  group('hub.logs', () {
    test('getLogs → GET /v3/logs, filters and paging in the query', () async {
      final driver = _answering('{"list":{"items":[],"hasMore":false}}');
      final res = await _client(driver).logs.getLogs(query: {
        'level': 'Error',
        'logCorrelationId': 'corr_1',
        'eventCode': 'app:order:paid',
        'pageSize': 20,
        'startingAfter': 'cur_1',
      }) as Map<String, dynamic>;

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/logs'));
      expect(
          req.url.queryParameters,
          equals({
            'level': 'Error',
            'logCorrelationId': 'corr_1',
            'eventCode': 'app:order:paid',
            'pageSize': '20',
            'startingAfter': 'cur_1',
          }));
      expect(req.body, isNull);
      expect(res['list'], isA<Map<String, dynamic>>());
    });

    test('getLog → GET /v3/logs/{id}, the id in the path', () async {
      final driver =
          _answering('{"item":{"id":"6650f0c2a1b2c3d4e5f60718","title":"t"}}');
      final res = await _client(driver).logs.getLog(
            id: '6650f0c2a1b2c3d4e5f60718',
          ) as Map<String, dynamic>;

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/logs/6650f0c2a1b2c3d4e5f60718'));
      expect(req.body, isNull);
      expect((res['item'] as Map)['title'], equals('t'));
    });

    test('cleanLogs → POST /v3/logs/clean', () async {
      final driver = _answering('{}');
      await _client(driver).logs.cleanLogs();

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/logs/clean'));
      expect(req.url.query, isEmpty);
    });

    test('getLogSettings → GET /v3/logs/settings', () async {
      final driver =
          _answering('{"skipCloudDashboardLogs":true,"skipHttpBodyMeta":false,'
              '"aiChatLoggingEnabled":false,"hasNorbixLogging":true}');
      final res =
          await _client(driver).logs.getLogSettings() as Map<String, dynamic>;

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/logs/settings'));
      expect(req.body, isNull);
      expect(res['hasNorbixLogging'], isTrue);
    });

    test('saveLogSettings → POST /v3/logs/settings, the flags in the body',
        () async {
      final driver = _answering('{}');
      await _client(driver).logs.saveLogSettings(body: {
        'skipCloudDashboardLogs': true,
        'aiChatLoggingEnabled': true,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/logs/settings'));
      expect(
          jsonDecode(req.body!),
          equals({
            'skipCloudDashboardLogs': true,
            'aiChatLoggingEnabled': true,
          }));
    });

    test(
        'getLogsByCorrelationId → GET /v3/logs/audit, targetCorrelationId '
        'in the query', () async {
      final driver = _answering('{"items":[]}');
      await _client(driver)
          .logs
          .getLogsByCorrelationId(query: {'targetCorrelationId': 'corr_1'});

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/logs/audit'));
      expect(
          req.url.queryParameters, equals({'targetCorrelationId': 'corr_1'}));
    });

    test(
        'testLoggingIntegration → POST /v3/logs/integrations/test, the '
        'integration in the body', () async {
      final driver = _answering('{"isSuccess":true}');
      await _client(driver).logs.testLoggingIntegration(body: {
        'integrationId': 'int_mongo',
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/logs/integrations/test'));
      expect(jsonDecode(req.body!), equals({'integrationId': 'int_mongo'}));
    });
  });
}
