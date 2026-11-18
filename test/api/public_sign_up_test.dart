import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Public sign-up and password reset must go out from a client that has no
/// API key and no bearer token: a new visitor has neither. The gateway signs
/// the caller in only when the request brings credentials; with none the
/// sign-up runs as the project's Guest role. The project still has to be
/// named, so `norbix-project-id` is sent.
void main() {
  Map<String, String> headers(FakeHttpDriver d) => d.lastRequest!.headers;

  test(
      'saveEmailUser with no credentials: sent, no authorization, project named',
      () async {
    final driver = FakeHttpDriver();
    final client = NorbixApi(driver: driver, projectId: 'prj_1');

    await client.users.saveEmailUser(
      body: {'email': 'ada@example.test', 'password': 'pw-1'},
    );

    expect(driver.requests, hasLength(1));
    expect(driver.lastRequest!.method, equals('POST'));
    expect(driver.lastRequest!.url.path,
        endsWith('/membership/auth/register/email'));
    expect(headers(driver).containsKey('authorization'), isFalse);
    expect(headers(driver).containsKey('x-api-key'), isFalse);
    expect(headers(driver)['norbix-project-id'], equals('prj_1'));
  });

  test('saveUserNameUser with no credentials: sent, no authorization',
      () async {
    final driver = FakeHttpDriver();
    final client = NorbixApi(driver: driver, projectId: 'prj_1');

    await client.users.saveUserNameUser(
      body: {'userName': 'ada', 'password': 'pw-1'},
    );

    expect(driver.lastRequest!.url.path,
        endsWith('/membership/auth/register/user-name'));
    expect(headers(driver).containsKey('authorization'), isFalse);
  });

  test('requestPasswordReset with no credentials: sent, no authorization',
      () async {
    final driver = FakeHttpDriver();
    final client = NorbixApi(driver: driver, projectId: 'prj_1');

    await client.userAuth
        .requestPasswordReset(body: {'email': 'ada@example.test'});

    expect(driver.lastRequest!.url.path,
        endsWith('/membership/userauth/password/reset/request'));
    expect(headers(driver).containsKey('authorization'), isFalse);
  });

  test('saveEmailUser with a signed-in token: the token is sent', () async {
    final driver = FakeHttpDriver();
    final client = NorbixApi(driver: driver, projectId: 'prj_1');
    client.setBearerToken('user-jwt');

    await client.users.saveEmailUser(
      body: {'email': 'ada@example.test', 'password': 'pw-1'},
    );

    expect(headers(driver)['authorization'], equals('Bearer user-jwt'));
  });
}
