import 'dart:convert';

import 'package:norbix/norbix_webhooks.dart';
import 'package:test/test.dart';

String body(
  String event,
  Map<String, dynamic> data, {
  String id = 'dlv_1',
  String accountId = 'acc_1',
  String projectId = 'pr_1',
  String triggerId = 'trg_1',
}) =>
    jsonEncode({
      'id': id,
      'event': event,
      'createdOn': '2026-01-01T00:00:00Z',
      'accountId': accountId,
      'projectId': projectId,
      'triggerId': triggerId,
      'data': data,
    });

void main() {
  group('NorbixWebhookReceiver', () {
    test('registered payload is the UserDto entity, id on metadata', () async {
      final receiver = NorbixWebhookReceiver();
      UserDto? captured;
      WebhookEvent? capturedEvent;
      receiver.on<UserDto>(NorbixWebhookEvents.membershipUserRegistered,
          (user, event) {
        captured = user;
        capturedEvent = event;
      });

      final result = await receiver.handle(
        rawBody: body('membership.user.registered', {
          'id': 'usr_1',
          'to': {'id': 'usr_1', 'userName': 'alice', 'status': 'registered'},
        }),
        headers: {'X-Norbix-Integration': 'whi_1'},
      );

      expect(result.handled, isTrue);
      expect(captured!.userName, equals('alice'));
      expect(capturedEvent!.metadata.user!.id, equals('usr_1'));
      expect(capturedEvent!.integrationId, equals('whi_1'));
      expect(capturedEvent!.deliveryId, equals('dlv_1'));
    });

    test('updated payload is a Mutation<UserDto>', () async {
      final receiver = NorbixWebhookReceiver();
      Mutation<UserDto>? captured;
      receiver.on<Mutation<UserDto>>(NorbixWebhookEvents.membershipUserUpdated,
          (m, event) => captured = m);

      await receiver.handle(
        rawBody: body('membership.user.updated', {
          'id': 'usr_1',
          'from': {'id': 'usr_1', 'email': 'old@x.io'},
          'to': {'id': 'usr_1', 'email': 'new@x.io'},
        }),
        headers: const {},
      );

      expect(captured!.from.email, equals('old@x.io'));
      expect(captured!.to.email, equals('new@x.io'));
    });

    test('verified payload is the user (no from/to)', () async {
      final receiver = NorbixWebhookReceiver();
      UserDto? captured;
      receiver.on<UserDto>(NorbixWebhookEvents.membershipUserVerified,
          (user, event) => captured = user);

      await receiver.handle(
        rawBody: body('membership.user.verified', {
          'id': 'usr_1',
          'from': null,
          'to': {'id': 'usr_1', 'status': 'verified'},
        }),
        headers: const {},
      );

      expect(captured!.status, equals('verified'));
    });

    test('record.inserted payload is the document, schema/record on metadata',
        () async {
      final receiver = NorbixWebhookReceiver();
      dynamic captured;
      WebhookEvent? capturedEvent;
      receiver.on<Map<String, dynamic>>(
          NorbixWebhookEvents.databaseRecordInserted, (doc, event) {
        captured = doc;
        capturedEvent = event;
      });

      await receiver.handle(
        rawBody: body('database.record.inserted', {
          'schemaName': 'users',
          'integrationId': 'int_1',
          'id': 'rec_1',
          'document': {'id': 'rec_1', 'email': 'a@b.io'},
          'schema': {'id': 'sch_1'},
        }),
        headers: const {},
      );

      expect(captured['email'], equals('a@b.io'));
      expect(capturedEvent!.metadata.schema!.id, equals('sch_1'));
      expect(capturedEvent!.metadata.schema!.name, equals('users'));
      expect(capturedEvent!.metadata.record!.id, equals('rec_1'));
    });

    test('records.inserted payload is the list, ids on metadata', () async {
      final receiver = NorbixWebhookReceiver();
      List<dynamic>? captured;
      WebhookEvent? capturedEvent;
      receiver.on<List<dynamic>>(NorbixWebhookEvents.databaseRecordsInserted,
          (docs, event) {
        captured = docs;
        capturedEvent = event;
      });

      await receiver.handle(
        rawBody: body('database.records.inserted', {
          'schemaName': 'users',
          'ids': ['r1', 'r2'],
          'documents': [
            {'id': 'r1'},
            {'id': 'r2'},
          ],
        }),
        headers: const {},
      );

      expect(captured!.length, equals(2));
      expect(capturedEvent!.metadata.records!.ids, equals(['r1', 'r2']));
    });

    test('onAll runs in addition to on', () async {
      final receiver = NorbixWebhookReceiver();
      final calls = <String>[];
      receiver.on<UserDto>(NorbixWebhookEvents.membershipUserRegistered,
          (user, event) => calls.add('typed'));
      receiver.onAll(kNorbixWebhookEventNames,
          (envelope, ctx) => calls.add('all:${envelope.event}'));

      await receiver.handle(
        rawBody: body('membership.user.registered', {
          'id': 'u',
          'to': {'id': 'u'},
        }),
        headers: const {},
      );

      expect(calls, equals(['typed', 'all:membership.user.registered']));
    });

    test('bad signature throws when secret configured', () async {
      final receiver = NorbixWebhookReceiver(secret: 'whsec');
      expect(
        () => receiver.handle(
          rawBody: '{"id":"x","event":"files.file.uploaded","data":{}}',
          headers: {
            'X-Norbix-Signature': 'sha256=dead',
            'X-Norbix-Timestamp':
                (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
          },
        ),
        throwsA(isA<NorbixWebhookSignatureError>()),
      );
    });

    test('valid signature verifies', () async {
      const secret = 'whsec';
      final raw =
          body('files.file.uploaded', {'integrationId': 'int_1', 'file': {}});
      final ts = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
      final sig = computeSignature(secret, ts, raw);
      final receiver = NorbixWebhookReceiver(secret: secret);

      final result = await receiver.handle(
        rawBody: raw,
        headers: {'X-Norbix-Signature': sig, 'X-Norbix-Timestamp': ts},
      );
      expect(result.verified, isTrue);
    });

    test('project guard rejects mismatch', () async {
      final receiver = NorbixWebhookReceiver(projectId: 'pr_expected');
      expect(
        () => receiver.handle(
          rawBody: body('files.file.uploaded', const {}, projectId: 'pr_other'),
          headers: const {},
        ),
        throwsA(isA<NorbixWebhookSignatureError>()),
      );
    });
  });
}
