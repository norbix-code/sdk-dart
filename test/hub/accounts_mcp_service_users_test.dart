import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('accounts — developer MCP endpoint and AI service users', () {
    test('sendMcpMessage sends POST /{version}/account/mcp', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.sendMcpMessage(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v1/account/mcp'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('openMcpStream sends GET /{version}/account/mcp', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.openMcpStream(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v1/account/mcp'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('endMcpSession sends DELETE /{version}/account/mcp', () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.endMcpSession(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v1/account/mcp'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('createAiServiceUser sends POST /{version}/account/ai/service-users',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .accounts
          .createAiServiceUser(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v1/account/ai/service-users'));
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
          endsWith('/v1/account/ai/service-users'));
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
          endsWith('/v1/account/ai/service-users/id_1/keys'));
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
          endsWith('/v1/account/ai/service-users/id_1/keys/keyId_1'));
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
          endsWith('/v1/account/ai/service-users/id_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('sendMcpMessage sends the JSON-RPC body and the session header',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).accounts.sendMcpMessage(
        body: {'jsonrpc': '2.0', 'id': 1, 'method': 'tools/list'},
        headers: {'mcp-session-id': 'sess_1'},
      );
      expect(driver.lastRequest!.headers['mcp-session-id'], equals('sess_1'));
      expect(driver.lastRequest!.body, contains('"method":"tools/list"'));
    });
  });
}
