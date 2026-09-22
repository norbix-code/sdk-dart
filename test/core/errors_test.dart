/// What the caller sees when a call fails (10b-files slice ERRORS, #66, #67).
///
/// Two rules are pinned here. First, the message and the error code are the
/// gateway's own: the gateway puts them inside `responseStatus.errors[]`, so
/// reading the top of that block gave every caller "Request failed" and
/// `NORBIX_HTTP_ERROR` — that was #66. Second, a call fails when the gateway
/// says it failed, even with HTTP 200 and `responseStatus.isSuccess = false` —
/// that was #67.
///
/// Every test builds its own transport and its own fake answer, so the order
/// the tests run in does not matter and no real server is contacted.
library;

import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

Transport _transportAnswering(
  int status,
  Object body, {
  String contentType = 'application/json',
}) {
  final driver = FakeHttpDriver(
    (_) => HttpDriverResponse(
      statusCode: status,
      headers: {'content-type': contentType},
      body: body is String ? body : jsonEncode(body),
    ),
  );
  return Transport(
    config: NorbixConfig(baseUrl: 'https://api.norbix.ai', maxRetries: 0),
    driver: driver,
  );
}

Future<Object?> _aCall(Transport t) =>
    t.send(route: '/{version}/files/{id}/info', pathParams: {'id': 'int_7'});

void main() {
  group('errors from the gateway', () {
    // (a) HTTP 400 with two errors inside responseStatus.errors
    test('a 400 takes message and code from the first error, keeps them all',
        () async {
      final t = _transportAnswering(400, {
        'responseStatus': {
          'isSuccess': false,
          'errors': [
            {
              'message': 'File name is required',
              'errorCode': 'CM-ERRORS-FILES-002',
              'fieldName': 'fileName',
            },
            {
              'message': 'Folder does not exist',
              'errorCode': 'CM-ERRORS-FILES-016',
              'context': {'Provider': 'Local'},
            },
          ],
        },
      });

      final error = await _aCall(t).then<NorbixError?>((_) => null,
          onError: (Object e) => e as NorbixError);

      expect(error, isA<NorbixClientError>());
      expect(error!.message, equals('File name is required'));
      expect(error.errorCode, equals('CM-ERRORS-FILES-002'));
      expect(error.httpStatus, equals(400));
      expect(error.errors, hasLength(2));
      expect(error.errors[0].fieldName, equals('fileName'));
      expect(error.errors[1].errorCode, equals('CM-ERRORS-FILES-016'));
      expect(error.errors[1].context['Provider'], equals('Local'));
      // The body as it arrived is kept for anyone who needs the rest of it.
      expect(error.body, isA<Map<String, dynamic>>());
    });

    // (b) HTTP 200 whose body says the call failed
    test('a 200 that says isSuccess=false fails with the gateway message',
        () async {
      final t = _transportAnswering(200, {
        'responseStatus': {
          'isSuccess': false,
          'errors': [
            {
              'message': 'File not found: "a/b.txt" does not exist in Local.',
              'errorCode': 'CM-ERRORS-FILES-016',
            },
          ],
        },
      });

      final error = await _aCall(t).then<NorbixError?>((_) => null,
          onError: (Object e) => e as NorbixError);

      expect(error, isNotNull);
      expect(error!.httpStatus, equals(200));
      expect(error.message,
          equals('File not found: "a/b.txt" does not exist in Local.'));
      expect(error.errorCode, equals('CM-ERRORS-FILES-016'));
    });

    // (c) HTTP 200 that says the call worked — unchanged
    test('a 200 that says isSuccess=true still comes back as a value',
        () async {
      final t = _transportAnswering(200, {
        'id': 'f_1',
        'responseStatus': {'isSuccess': true},
      });

      final result = await _aCall(t);

      expect((result! as Map<String, dynamic>)['id'], equals('f_1'));
    });

    test('a 200 with no responseStatus still comes back as a value', () async {
      final t = _transportAnswering(200, {'id': 'f_1'});

      final result = await _aCall(t);

      expect((result! as Map<String, dynamic>)['id'], equals('f_1'));
    });

    // (d) a 500 whose body is not JSON at all
    test('a 500 with a body that is not JSON uses the fallback text', () async {
      final t = _transportAnswering(500, '<html>Bad Gateway</html>',
          contentType: 'text/html');

      final error = await _aCall(t).then<NorbixError?>((_) => null,
          onError: (Object e) => e as NorbixError);

      expect(error, isA<NorbixServerError>());
      expect(error!.message, equals('Request failed (HTTP 500)'));
      expect(error.errorCode, equals('NORBIX_HTTP_ERROR'));
      expect(error.body, equals('<html>Bad Gateway</html>'));
    });

    test('an empty error body uses the fallback text too', () async {
      final t = _transportAnswering(404, <String, dynamic>{});

      final error = await _aCall(t).then<NorbixError?>((_) => null,
          onError: (Object e) => e as NorbixError);

      expect(error, isA<NorbixNotFoundError>());
      expect(error!.message, equals('Request failed (HTTP 404)'));
    });

    test('reads the top of the body when there is no responseStatus',
        () async {
      final t = _transportAnswering(409, {
        'message': 'Already exists',
        'errorCode': 'CM-ERRORS-FILES-009',
      });

      final error = await _aCall(t).then<NorbixError?>((_) => null,
          onError: (Object e) => e as NorbixError);

      expect(error!.message, equals('Already exists'));
      expect(error.errorCode, equals('CM-ERRORS-FILES-009'));
    });
  });
}
