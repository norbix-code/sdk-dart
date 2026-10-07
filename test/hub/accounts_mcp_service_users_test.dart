import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('accounts — developer MCP endpoint and AI service users', () {
    test(
        'sendMcpMessage sends POST /{version}/account/mcp and reads the session id',
        () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {
              'content-type': 'application/json',
              'mcp-session-id': 'sess_1',
            },
            body: '{"jsonrpc":"2.0","id":1,"result":{}}',
          ));
      final res = await _client(driver).accounts.sendMcpMessage(
          message: {'jsonrpc': '2.0', 'id': 1, 'method': 'initialize'},
          toolsets: 'ai:campaigns');
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/mcp?toolsets=ai%3Acampaigns'));
      expect(driver.lastRequest!.headers['accept'],
          equals('application/json, text/event-stream'));
      expect(driver.lastRequest!.body, contains('"method":"initialize"'));
      expect(res.sessionId, equals('sess_1'));
      expect(res.json, equals({'jsonrpc': '2.0', 'id': 1, 'result': {}}));
    });
    test('sendMcpMessage keeps an SSE answer as raw text', () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {'content-type': 'text/event-stream'},
            body: 'id: 1\ndata: {"jsonrpc":"2.0","id":2,"result":{}}\n\n',
          ));
      final res = await _client(driver).accounts.sendMcpMessage(
          message: {'jsonrpc': '2.0', 'id': 2, 'method': 'tools/call'},
          sessionId: 'sess_1');
      expect(driver.lastRequest!.headers['mcp-session-id'], equals('sess_1'));
      expect(res.isEventStream, isTrue);
      expect(res.json, isNull);
      expect(res.body, startsWith('id: 1'));
    });
    test('openMcpStream sends GET /{version}/account/mcp asking for SSE',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .openMcpStream(sessionId: 'sess_1', lastEventId: 'ev_9');
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v3/account/mcp'));
      expect(
          driver.lastRequest!.headers['accept'], equals('text/event-stream'));
      expect(driver.lastRequest!.headers['mcp-session-id'], equals('sess_1'));
      expect(driver.lastRequest!.headers['last-event-id'], equals('ev_9'));
    });
    test('endMcpSession sends DELETE /{version}/account/mcp with the session',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.endMcpSession(sessionId: 'sess_1');
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v3/account/mcp'));
      expect(driver.lastRequest!.headers['mcp-session-id'], equals('sess_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('an MCP error status throws the typed error', () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 400,
            headers: {'content-type': 'application/json'},
            body:
                '{"jsonrpc":"2.0","error":{"code":-32600,"message":"no session"}}',
          ));
      await expectLater(
          _client(driver).accounts.sendMcpMessage(
              message: {'jsonrpc': '2.0', 'id': 3, 'method': 'tools/list'}),
          throwsA(isA<NorbixError>()));
    });
    test('createAiServiceUser sends POST /{version}/account/ai/service-users',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .createAiServiceUser(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/ai/service-users'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('listAiServiceUsers sends GET /{version}/account/ai/service-users',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .listAiServiceUsers(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/ai/service-users'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'rotateAiServiceUserKey sends POST /{version}/account/ai/service-users/{Id}/keys',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .rotateAiServiceUserKey(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/ai/service-users/id_1/keys'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'revokeAiServiceUserKey sends DELETE /{version}/account/ai/service-users/{Id}/keys/{KeyId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.revokeAiServiceUserKey(
          id: 'id_1', keyId: 'keyId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/ai/service-users/id_1/keys/keyId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteAiServiceUser sends DELETE /{version}/account/ai/service-users/{Id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .deleteAiServiceUser(id: 'id_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/account/ai/service-users/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
