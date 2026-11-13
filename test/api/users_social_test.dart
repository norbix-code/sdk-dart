import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Project social sign-in and link identity (gateway 3fb6f5569): the start
/// URL builder, the code exchange and the two link calls. Each call test pins
/// the exact verb, path and body.
NorbixApi _client(FakeHttpDriver driver, {String env = 'PROD'}) => NorbixApi(
      config: NorbixConfig(
        baseUrl: 'https://api.test',
        bearerToken: 'jwt-1',
        projectId: 'pr_1',
        env: env,
      ),
      driver: driver,
    );

// PKCE: the RFC 7636 appendix B verifier and its S256 challenge.
const _verifier = 'dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk';
const _challenge = 'E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM';

void main() {
  group('PKCE', () {
    test('matches the RFC 7636 appendix B vector', () {
      expect(pkceChallenge(_verifier), _challenge);
    });

    test('createPkcePair makes a verifier and its challenge', () {
      final a = createPkcePair();
      final b = createPkcePair();
      expect(a.codeVerifier, matches(RegExp(r'^[A-Za-z0-9_-]{43}$')));
      expect(a.codeChallenge, pkceChallenge(a.codeVerifier));
      expect(b.codeVerifier, isNot(a.codeVerifier));
      expect(() => pkceChallenge('short'), throwsArgumentError);
    });

    test('exchange, link start and link finish carry PKCE in the body',
        () async {
      final driver = FakeHttpDriver();
      final api = _client(driver);
      await api.users.exchangeSocialSignInCode(
          provider: 'google', body: {'code': 'c', 'codeVerifier': _verifier});
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/social/google/exchange');
      expect(jsonDecode(driver.lastRequest!.body!),
          {'code': 'c', 'codeVerifier': _verifier});
      await api.users.startLinkIdentity(
          userId: 'usr_1',
          body: {'provider': 'github', 'codeChallenge': _challenge});
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/usr_1/link-identity/start');
      expect(jsonDecode(driver.lastRequest!.body!),
          {'provider': 'github', 'codeChallenge': _challenge});
      await api.users.linkIdentity(
          userId: 'usr_1', body: {'code': 'l', 'codeVerifier': _verifier});
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/usr_1/link-identity');
      expect(jsonDecode(driver.lastRequest!.body!),
          {'code': 'l', 'codeVerifier': _verifier});
    });
  });

  group('users.socialSignInUrl', () {
    test('carries the project id and no env for PROD; sends nothing', () {
      final driver = FakeHttpDriver();
      final url = _client(driver).users.socialSignInUrl('google');
      expect(url.toString(),
          'https://api.test/v3/membership/auth/social/google?projectId=pr_1');
      expect(driver.lastRequest, isNull);
    });

    test('encodes mode and returnUrl', () {
      final url = _client(FakeHttpDriver()).users.socialSignInUrl('github',
          mode: 'Admin portal & app',
          returnUrl: 'https://app.example.com/oauth/callback?next=/a b&x=1');
      expect(
          url.toString(),
          'https://api.test/v3/membership/auth/social/github?projectId=pr_1'
          '&mode=Admin+portal+%26+app'
          '&returnUrl=https%3A%2F%2Fapp.example.com%2Foauth%2Fcallback%3Fnext%3D%2Fa+b%26x%3D1');
      expect(url.queryParameters['mode'], 'Admin portal & app');
      expect(url.queryParameters['returnUrl'],
          'https://app.example.com/oauth/callback?next=/a b&x=1');
    });

    test('puts a non-PROD env in the query', () {
      final url =
          _client(FakeHttpDriver(), env: 'TEST').users.socialSignInUrl('okta');
      expect(url.toString(),
          'https://api.test/v3/membership/auth/social/okta?projectId=pr_1&env=TEST');
    });

    test('carries the PKCE codeChallenge last', () {
      final url = _client(FakeHttpDriver()).users.socialSignInUrl('google',
          mode: 'app',
          returnUrl: 'https://app.test/cb',
          codeChallenge: _challenge);
      expect(
          url.toString(),
          'https://api.test/v3/membership/auth/social/google?projectId=pr_1'
          '&mode=app&returnUrl=https%3A%2F%2Fapp.test%2Fcb&codeChallenge=$_challenge');
    });

    test('escapes the provider', () {
      final url = _client(FakeHttpDriver()).users.socialSignInUrl('a/b');
      expect(url.toString(),
          'https://api.test/v3/membership/auth/social/a%2Fb?projectId=pr_1');
    });
  });

  group('users — social sign-in and link identity calls', () {
    test(
        'exchangeSocialSignInCode sends POST .../social/{Provider}/exchange {code}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).users.exchangeSocialSignInCode(
          provider: 'google', body: {'code': 'one-time'});
      expect(driver.lastRequest!.method, 'POST');
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/social/google/exchange');
      expect(jsonDecode(driver.lastRequest!.body!), {'code': 'one-time'});
      expect(driver.lastRequest!.headers['norbix-project-id'], 'pr_1');
      // An old JWT on the client must not be sent: the gateway refuses it on
      // any route, and the exchange is how a user signs in again.
      expect(driver.lastRequest!.headers['authorization'], isNull);
      expect(driver.lastRequest!.headers['x-api-key'], isNull);
    });

    test('exchangeSocialSignInCode sends no API key either', () async {
      final driver = FakeHttpDriver();
      await NorbixApi(
        config: NorbixConfig(
            baseUrl: 'https://api.test', apiKey: 'ak-1', projectId: 'pr_1'),
        driver: driver,
      ).users.exchangeSocialSignInCode(provider: 'google', body: {'code': 'c'});
      expect(driver.lastRequest!.headers['authorization'], isNull);
      expect(driver.lastRequest!.headers['x-api-key'], isNull);
    });

    test(
        'startLinkIdentity sends POST .../{UserId}/link-identity/start {provider, mode, returnUrl}',
        () async {
      final driver = FakeHttpDriver();
      final body = {
        'provider': 'google',
        'mode': 'app',
        'returnUrl': 'https://app.example.com/settings',
      };
      await _client(driver)
          .users
          .startLinkIdentity(userId: 'usr_1', body: body);
      expect(driver.lastRequest!.method, 'POST');
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/usr_1/link-identity/start');
      expect(jsonDecode(driver.lastRequest!.body!), body);
      expect(driver.lastRequest!.headers['authorization'], 'Bearer jwt-1');
    });

    test('linkIdentity sends POST .../{UserId}/link-identity {code}', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .users
          .linkIdentity(userId: 'usr_1', body: {'code': 'link-code'});
      expect(driver.lastRequest!.method, 'POST');
      expect(driver.lastRequest!.url.toString(),
          'https://api.test/v3/membership/auth/usr_1/link-identity');
      expect(jsonDecode(driver.lastRequest!.body!), {'code': 'link-code'});
      expect(driver.lastRequest!.headers['authorization'], 'Bearer jwt-1');
    });
  });
}
