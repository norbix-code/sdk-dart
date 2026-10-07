import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('aiChat — wave-3 routes', () {
    test('getEndUserChatAvailability sends GET /{version}/ai/chat/availability',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiChat
          .getEndUserChatAvailability(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/availability'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('listEndUserChatSessions sends GET /{version}/ai/chat/sessions',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiChat
          .listEndUserChatSessions(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(
          driver.lastRequest!.url.toString(), endsWith('/v3/ai/chat/sessions'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('createEndUserChatSession sends POST /{version}/ai/chat/sessions',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiChat
          .createEndUserChatSession(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(
          driver.lastRequest!.url.toString(), endsWith('/v3/ai/chat/sessions'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'getEndUserChatSession sends GET /{version}/ai/chat/sessions/{SessionId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.getEndUserChatSession(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'renameEndUserChatSession sends PATCH /{version}/ai/chat/sessions/{SessionId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.renameEndUserChatSession(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PATCH'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteEndUserChatSession sends DELETE /{version}/ai/chat/sessions/{SessionId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.deleteEndUserChatSession(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'pinEndUserChatSession sends PUT /{version}/ai/chat/sessions/{SessionId}/pin',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.pinEndUserChatSession(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1/pin'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'archiveEndUserChatSession sends PUT /{version}/ai/chat/sessions/{SessionId}/archive',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.archiveEndUserChatSession(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1/archive'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'getEndUserChatEntries sends GET /{version}/ai/chat/sessions/{SessionId}/entries',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.getEndUserChatEntries(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1/entries'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'setEndUserChatEntryFeedback sends PUT /{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.setEndUserChatEntryFeedback(
          sessionId: 'sessionId_1',
          entryId: 'entryId_1',
          body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
          driver.lastRequest!.url.toString(),
          endsWith(
              '/v3/ai/chat/sessions/sessionId_1/entries/entryId_1/feedback'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'listEndUserChatAttachments sends GET /{version}/ai/chat/sessions/{SessionId}/attachments',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.listEndUserChatAttachments(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1/attachments'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'uploadEndUserChatAttachment sends POST /{version}/ai/chat/sessions/{SessionId}/attachments',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.uploadEndUserChatAttachment(
          sessionId: 'sessionId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/sessions/sessionId_1/attachments'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'deleteEndUserChatAttachment sends DELETE /{version}/ai/chat/attachments/{AttachmentId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.deleteEndUserChatAttachment(
          attachmentId: 'attachmentId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/attachments/attachmentId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('listEndUserChatMemory sends GET /{version}/ai/chat/memory', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiChat
          .listEndUserChatMemory(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('GET'));
      expect(
          driver.lastRequest!.url.toString(), endsWith('/v3/ai/chat/memory'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test(
        'forgetEndUserChatMemory sends DELETE /{version}/ai/chat/memory/{NoteId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).aiChat.forgetEndUserChatMemory(
          noteId: 'noteId_1', body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/ai/chat/memory/noteId_1'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
    test('startEndUserChatTurn sends POST /{version}/ai/chat/turn', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .aiChat
          .startEndUserChatTurn(body: {'probe': 'value'});
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.toString(), endsWith('/v3/ai/chat/turn'));
      expect(driver.lastRequest!.headers['x-api-key'], equals('k'));
    });
  });
}
