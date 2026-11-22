import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// E-mail address verification for e-mail + password project users.
///
/// Both routes are public: the visitor opens the link from the e-mail (or
/// asks for a new one) before they can sign in, so the calls go out from a
/// client with no API key and no bearer token. The sign-in refusal while the
/// address is not verified is HTTP 401 `CM-ERRORS-MEMBERSHIP-USERS-052`.
void main() {
  Map<String, String> headers(FakeHttpDriver d) => d.lastRequest!.headers;
  Object? sentBody(FakeHttpDriver d) {
    final raw = d.lastRequest!.body;
    return raw is String ? jsonDecode(raw) : raw;
  }

  group('verifyEmailAddress', () {
    test('POSTs the token to the confirm route with no credentials', () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {'content-type': 'application/json'},
            body: '{"authId":"usr_1","verifiedAtUtc":"2026-11-22T10:00:00Z",'
                '"responseStatus":{"isSuccess":true}}',
          ));
      final client = NorbixApi(driver: driver, projectId: 'prj_1');

      final result = await client.userAuth
          .verifyEmailAddress(body: {'token': 'tok-1'}) as Map<String, Object?>;

      expect(driver.requests, hasLength(1));
      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.path,
          endsWith('/membership/userauth/email-verification/confirm'));
      expect(sentBody(driver), equals({'token': 'tok-1'}));
      expect(headers(driver).containsKey('authorization'), isFalse);
      expect(headers(driver).containsKey('x-api-key'), isFalse);
      expect(headers(driver)['norbix-project-id'], equals('prj_1'));
      expect(result['authId'], equals('usr_1'));
    });

    test('a used link fails with CM-ERRORS-MEMBERSHIP-USERS-051', () async {
      final driver = FakeHttpDriver((_) => HttpDriverResponse(
            statusCode: 400,
            headers: const {'content-type': 'application/json'},
            body: jsonEncode({
              'responseStatus': {
                'isSuccess': false,
                'errors': [
                  {
                    'errorCode': 'CM-ERRORS-MEMBERSHIP-USERS-051',
                    'message': 'The verification link is not valid.',
                  }
                ],
              }
            }),
          ));
      final client = NorbixApi(driver: driver, projectId: 'prj_1');

      await expectLater(
        client.userAuth.verifyEmailAddress(body: {'token': 'old'}),
        throwsA(isA<NorbixError>()
            .having((e) => e.errorCode, 'errorCode',
                'CM-ERRORS-MEMBERSHIP-USERS-051')
            .having(
                isEmailNotVerifiedError, 'isEmailNotVerifiedError', isFalse)),
      );
    });
  });

  group('resendEmailAddressVerification', () {
    test('POSTs the e-mail to the resend route with no credentials', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(driver: driver, projectId: 'prj_1');

      await client.userAuth.resendEmailAddressVerification(
        body: {'email': 'ada@example.test', 'databaseIntegrationId': 'int_1'},
      );

      expect(driver.lastRequest!.method, equals('POST'));
      expect(driver.lastRequest!.url.path,
          endsWith('/membership/userauth/email-verification/resend'));
      expect(
          sentBody(driver),
          equals(
              {'email': 'ada@example.test', 'databaseIntegrationId': 'int_1'}));
      expect(headers(driver).containsKey('authorization'), isFalse);
    });
  });

  group('isEmailNotVerifiedError', () {
    test('the constant is the gateway code', () {
      expect(
          kEmailNotVerifiedErrorCode, equals('CM-ERRORS-MEMBERSHIP-USERS-052'));
    });

    test('a 401 sign-in refusal with 052 is recognised', () async {
      final driver = FakeHttpDriver((_) => HttpDriverResponse(
            statusCode: 401,
            headers: const {'content-type': 'application/json'},
            body: jsonEncode({
              'responseStatus': {
                'errorCode': 'Unauthorized',
                'errors': [
                  {
                    'errorCode': 'CM-ERRORS-MEMBERSHIP-USERS-052',
                    'message': 'Verify your e-mail address first.',
                  }
                ],
              }
            }),
          ));
      final client = NorbixApi(driver: driver, projectId: 'prj_1');

      Object? caught;
      try {
        await client.auth.authenticate2(provider: 'credentials');
      } catch (e) {
        caught = e;
      }
      expect(caught, isA<NorbixAuthError>());
      expect(isEmailNotVerifiedError(caught), isTrue);
    });

    test('the code in a later error entry is recognised too', () {
      const error = NorbixAuthError(
        message: 'Unauthorized',
        code: 'CM-ERRORS-MEMBERSHIP-USERS-001',
        status: 401,
        errors: [
          NorbixErrorItem(errorCode: 'CM-ERRORS-MEMBERSHIP-USERS-001'),
          NorbixErrorItem(errorCode: 'CM-ERRORS-MEMBERSHIP-USERS-052'),
        ],
      );
      expect(isEmailNotVerifiedError(error), isTrue);
    });

    test('other errors and non-Norbix values are not', () {
      const other = NorbixAuthError(
          message: 'Wrong password',
          code: 'CM-ERRORS-MEMBERSHIP-USERS-002',
          status: 401);
      expect(isEmailNotVerifiedError(other), isFalse);
      expect(isEmailNotVerifiedError(Exception('x')), isFalse);
      expect(isEmailNotVerifiedError(null), isFalse);
    });
  });
}
