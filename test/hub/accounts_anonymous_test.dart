import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.accounts` — the four calls the gateway serves without sign-in
/// (no `[Authenticate]` on the service or the request): sign-up, joining a
/// team from an invitation, the region list and the e-mail verification
/// link. A client with no API key, no bearer token and no account id must
/// send them with no credential header and must not throw. `verifyAccount`
/// carries the account id once, in the request query.
void main() {
  group('hub.accounts — calls that go out without a token', () {
    late FakeHttpDriver driver;
    late NorbixHub hub;

    setUp(() {
      driver = FakeHttpDriver();
      // No apiKey, no bearerToken, no accountId. The plain constructor
      // does not read environment variables.
      hub = NorbixHub(
        config: NorbixConfig(baseUrl: 'https://hub.norbix.ai'),
        driver: driver,
      );
    });

    final cases = <({
      String name,
      String method,
      String url,
      Map<String, Object?>? body,
      Future<Object?> Function(NorbixHub hub) call,
    })>[
      (
        name: 'createAccount',
        method: 'POST',
        url: 'https://hub.norbix.ai/v1/account',
        body: {'email': 'owner@example.com', 'password': 'p'},
        call: (hub) => hub.accounts.createAccount(
              body: {'email': 'owner@example.com', 'password': 'p'},
            ),
      ),
      (
        name: 'createTeamMemberFromInvitation',
        method: 'POST',
        url: 'https://hub.norbix.ai/v1/account/team/member',
        body: {'token': 'invite-token', 'password': 'p'},
        call: (hub) => hub.accounts.createTeamMemberFromInvitation(
              body: {'token': 'invite-token', 'password': 'p'},
            ),
      ),
      (
        name: 'getAccountRegions',
        method: 'GET',
        url: 'https://hub.norbix.ai/v1/account/regions',
        body: null,
        call: (hub) => hub.accounts.getAccountRegions(),
      ),
      (
        name: 'verifyAccount',
        method: 'GET',
        url: 'https://hub.norbix.ai/v1/account/verify'
            '?accountId=acc-1&token=verify-token',
        body: null,
        call: (hub) => hub.accounts.verifyAccount(
              query: {'accountId': 'acc-1', 'token': 'verify-token'},
            ),
      ),
    ];

    for (final c in cases) {
      test('${c.name} → ${c.method} with no credential header', () async {
        expect(hub.accountId, isNull);

        await c.call(hub);

        final request = driver.lastRequest!;
        expect(request.method, equals(c.method));
        expect(request.url.toString(), equals(c.url));
        expect(request.headers.containsKey('authorization'), isFalse);
        expect(request.headers.containsKey('x-api-key'), isFalse);
        if (c.body == null) {
          expect(request.body, isNull);
        } else {
          expect(jsonDecode(request.body!), equals(c.body));
        }
      });
    }

    test('verifyAccount sends the account id in the query only', () async {
      await hub.accounts.verifyAccount(
        query: {'accountId': 'acc-1', 'token': 'verify-token'},
      );

      final request = driver.lastRequest!;
      expect(
        request.url.queryParameters,
        equals({'accountId': 'acc-1', 'token': 'verify-token'}),
      );
      expect(
        request.headers.keys.map((k) => k.toLowerCase()),
        isNot(contains('x-cm-accountid')),
      );
    });
  });
}
