import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.triggers` and the execution identity routes, against the fake driver
/// (never a real server).
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  test('getTriggerRuns → GET /v3/triggers/runs, filters in the query', () async {
    final driver = FakeHttpDriver();
    await _client(driver).triggers.getTriggerRuns(query: {
      'triggerType': 'Schema',
      'triggerId': 'trg_1',
      'status': 'failed',
    });

    final request = driver.lastRequest!;
    expect(request.method, equals('GET'));
    expect(request.url.path, equals('/v3/triggers/runs'));
    expect(
      request.url.queryParameters,
      equals({'triggerType': 'Schema', 'triggerId': 'trg_1', 'status': 'failed'}),
    );
  });

  test('getTriggerRun → the id in the path, the type in the query', () async {
    final driver = FakeHttpDriver();
    await _client(driver)
        .triggers
        .getTriggerRun(id: 'trr_1', query: {'triggerType': 'Membership'});

    expect(driver.lastRequest!.url.path, equals('/v3/triggers/runs/trr_1'));
    expect(
      driver.lastRequest!.url.queryParameters,
      equals({'triggerType': 'Membership'}),
    );
  });

  test('checkTriggerExecutionIdentity → POST with the action', () async {
    final driver = FakeHttpDriver();
    await _client(driver).triggers.checkTriggerExecutionIdentity(body: {
      'triggerType': 'Schema',
      'action': {'type': 'Email'},
    });

    final request = driver.lastRequest!;
    expect(request.method, equals('POST'));
    expect(request.url.path, equals('/v3/triggers/execution-identity/check'));
    expect(
      jsonDecode(request.body as String),
      containsPair('triggerType', 'Schema'),
    );
  });

  test('execution identities: list and create', () async {
    final driver = FakeHttpDriver();
    final hub = _client(driver);

    await hub.membership.getExecutionIdentities();
    expect(driver.lastRequest!.method, equals('GET'));
    expect(
      driver.lastRequest!.url.path,
      equals('/v3/membership/execution-identities'),
    );

    await hub.membership.createExecutionIdentity(body: {
      'name': 'Orders bot',
      'roleIds': ['Editor'],
    });
    expect(driver.lastRequest!.method, equals('POST'));
    expect(
      jsonDecode(driver.lastRequest!.body as String),
      containsPair('name', 'Orders bot'),
    );
  });
}
