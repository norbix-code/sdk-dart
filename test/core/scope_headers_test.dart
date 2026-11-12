import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// The gateway reads the caller's project ONLY from `norbix-project-id`
/// (RequestProjectHeader) and the account from `norbix-account-id`. A
/// signed-in user's bearer token carries no project, so without the header
/// project calls fail with "ProjectId is required".
const _project = 'norbix-project-id';
const _account = 'norbix-account-id';

Map<String, String> _headers(FakeHttpDriver d) => d.lastRequest!.headers;

void main() {
  group('NorbixConfig scope fields', () {
    test('default to null', () {
      final cfg = NorbixConfig(baseUrl: 'https://api.norbix.ai');
      expect(cfg.projectId, isNull);
      expect(cfg.accountId, isNull);
    });

    test('empty strings are treated as unset', () {
      final cfg = NorbixConfig(
        baseUrl: 'https://api.norbix.ai',
        projectId: '',
        accountId: '',
      );
      expect(cfg.projectId, isNull);
      expect(cfg.accountId, isNull);
    });

    test('copyWith keeps the ids, replaces them, and clears with ""', () {
      final cfg = NorbixConfig(
        baseUrl: 'https://api.norbix.ai',
        projectId: 'prj_1',
        accountId: 'acc_1',
      );
      final kept = cfg.copyWith(apiKey: 'k');
      expect(kept.projectId, equals('prj_1'));
      expect(kept.accountId, equals('acc_1'));
      final replaced = cfg.copyWith(projectId: 'prj_2');
      expect(replaced.projectId, equals('prj_2'));
      expect(replaced.accountId, equals('acc_1'));
      final cleared = cfg.copyWith(projectId: '', accountId: '');
      expect(cleared.projectId, isNull);
      expect(cleared.accountId, isNull);
    });

    test('fromEnv reads NORBIX_PROJECT_ID / NORBIX_ACCOUNT_ID by default', () {
      final cfg = NorbixConfig.fromEnv(
        defaultBaseUrl: 'https://api.norbix.ai',
        overrides: const {
          'NORBIX_PROJECT_ID': 'prj_env',
          'NORBIX_ACCOUNT_ID': 'acc_env',
        },
      );
      expect(cfg.projectId, equals('prj_env'));
      expect(cfg.accountId, equals('acc_env'));
    });
  });

  group('Transport scope headers', () {
    test('unset ids send no header', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
        driver: driver,
      );
      await t.send(route: '/{version}/echo');
      expect(_headers(driver).containsKey(_project), isFalse);
      expect(_headers(driver).containsKey(_account), isFalse);
    });

    test('configured ids are sent on send, sendBytes and sendRaw', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          bearerToken: 'jwt',
          projectId: 'prj_1',
          accountId: 'acc_1',
        ),
        driver: driver,
      );
      await t.send(route: '/{version}/echo');
      expect(_headers(driver)[_project], equals('prj_1'));
      expect(_headers(driver)[_account], equals('acc_1'));
      await t.sendBytes(route: '/{version}/file');
      expect(_headers(driver)[_project], equals('prj_1'));
      await t.sendRaw(route: '/{version}/raw');
      expect(_headers(driver)[_account], equals('acc_1'));
    });

    test('unauthenticated calls still carry the project', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          apiKey: 'k',
          projectId: 'prj_1',
        ),
        driver: driver,
      );
      await t.send(route: '/{version}/public', authenticated: false);
      expect(_headers(driver)[_project], equals('prj_1'));
      expect(_headers(driver).containsKey('x-api-key'), isFalse);
    });

    test('a per-call header overrides the client project', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          projectId: 'prj_1',
        ),
        driver: driver,
      );
      await t.send(route: '/{version}/echo', headers: {_project: 'prj_9'});
      expect(_headers(driver)[_project], equals('prj_9'));
    });
  });

  group('NorbixApi scope', () {
    test('sends nothing when no project or account is set', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(driver: driver);
      await client.database.count(collectionName: 'orders');
      expect(client.projectId, isNull);
      expect(client.accountId, isNull);
      expect(_headers(driver).containsKey(_project), isFalse);
      expect(_headers(driver).containsKey(_account), isFalse);
    });

    test('constructor projectId / accountId become headers', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(
        driver: driver,
        projectId: 'prj_1',
        accountId: 'acc_1',
      );
      client.setBearerToken('user-jwt');
      await client.database.count(collectionName: 'orders');
      expect(_headers(driver)[_project], equals('prj_1'));
      expect(_headers(driver)[_account], equals('acc_1'));
      expect(_headers(driver)['authorization'], equals('Bearer user-jwt'));
    });

    test('config projectId is used; constructor argument wins', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(
        driver: driver,
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.ai',
          projectId: 'prj_cfg',
          accountId: 'acc_cfg',
        ),
        projectId: 'prj_arg',
      );
      await client.database.count(collectionName: 'orders');
      expect(_headers(driver)[_project], equals('prj_arg'));
      expect(_headers(driver)[_account], equals('acc_cfg'));
    });

    test('setProjectId / setAccountId apply to the next call', () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi(driver: driver);
      await client.database.count(collectionName: 'orders');
      expect(_headers(driver).containsKey(_project), isFalse);

      client.setProjectId('prj_2');
      client.setAccountId('acc_2');
      await client.database.count(collectionName: 'orders');
      expect(client.projectId, equals('prj_2'));
      expect(_headers(driver)[_project], equals('prj_2'));
      expect(_headers(driver)[_account], equals('acc_2'));

      client.setProjectId(null);
      client.setAccountId(null);
      await client.database.count(collectionName: 'orders');
      expect(client.projectId, isNull);
      expect(_headers(driver).containsKey(_project), isFalse);
      expect(_headers(driver).containsKey(_account), isFalse);
    });

    test('fromEnv reads NORBIX_API_PROJECT_ID / NORBIX_API_ACCOUNT_ID',
        () async {
      final driver = FakeHttpDriver();
      final client = NorbixApi.fromEnv(
        driver: driver,
        overrides: const {
          'NORBIX_API_PROJECT_ID': 'prj_env',
          'NORBIX_API_ACCOUNT_ID': 'acc_env',
        },
      );
      await client.database.count(collectionName: 'orders');
      expect(_headers(driver)[_project], equals('prj_env'));
      expect(_headers(driver)[_account], equals('acc_env'));
    });
  });

  group('NorbixHub scope', () {
    test('sends nothing when no project or account is set', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver);
      await hub.database.getDatabaseSchemas();
      expect(_headers(driver).containsKey(_project), isFalse);
      expect(_headers(driver).containsKey(_account), isFalse);
    });

    test('constructor ids fill the route AND the headers', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(
        driver: driver,
        projectId: 'prj_1',
        accountId: 'acc_1',
      );
      await hub.projects.getProjectTokens();
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_1/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_1'));
      expect(_headers(driver)[_account], equals('acc_1'));

      await hub.database.getDatabaseSchemas();
      expect(_headers(driver)[_project], equals('prj_1'));
    });

    test('a non-string id is sent as its string form', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver, projectId: 42);
      await hub.database.getDatabaseSchemas();
      expect(_headers(driver)[_project], equals('42'));
    });

    test('a per-call projectId overrides the route segment, not the header',
        () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver, projectId: 'prj_1');
      await hub.projects.getProjectTokens(projectId: 'prj_other');
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_other/tokens'),
      );
      // The header stays the client-level project, like the TypeScript SDK.
      expect(_headers(driver)[_project], equals('prj_1'));
    });

    test('config ids seed the route default and the headers', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(
        driver: driver,
        config: NorbixConfig(
          baseUrl: 'https://hub.norbix.ai',
          projectId: 'prj_cfg',
          accountId: 'acc_cfg',
        ),
      );
      expect(hub.projectId, equals('prj_cfg'));
      expect(hub.accountId, equals('acc_cfg'));
      await hub.projects.getProjectTokens();
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_cfg/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_cfg'));
      expect(_headers(driver)[_account], equals('acc_cfg'));
    });

    test('setProjectId / setAccountId apply to route and headers next call',
        () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver, projectId: 'prj_1');
      hub.setProjectId('prj_2');
      hub.setAccountId('acc_2');
      await hub.projects.getProjectTokens();
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_2/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_2'));
      expect(_headers(driver)[_account], equals('acc_2'));

      hub.setProjectId(null);
      hub.setAccountId(null);
      await hub.database.getDatabaseSchemas();
      expect(hub.projectId, isNull);
      expect(_headers(driver).containsKey(_project), isFalse);
      expect(_headers(driver).containsKey(_account), isFalse);
    });

    test('setConfig without ids keeps the current project and account',
        () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(
        driver: driver,
        projectId: 'prj_1',
        accountId: 'acc_1',
      );
      hub.setConfig(NorbixConfig(baseUrl: 'https://hub.norbix.ai'));
      await hub.projects.getProjectTokens();
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_1/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_1'));
      expect(_headers(driver)[_account], equals('acc_1'));
    });

    test('setConfig with ids moves route and headers together', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver, projectId: 'prj_1');
      hub.setConfig(NorbixConfig(
        baseUrl: 'https://hub.norbix.ai',
        projectId: 'prj_new',
      ));
      await hub.projects.getProjectTokens();
      expect(hub.projectId, equals('prj_new'));
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_new/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_new'));
    });

    test('fromEnv reads NORBIX_HUB_PROJECT_ID / NORBIX_HUB_ACCOUNT_ID',
        () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub.fromEnv(
        driver: driver,
        overrides: const {
          'NORBIX_HUB_PROJECT_ID': 'prj_env',
          'NORBIX_HUB_ACCOUNT_ID': 'acc_env',
        },
      );
      await hub.projects.getProjectTokens();
      expect(
        driver.lastRequest!.url.path,
        equals('/v3/account/projects/prj_env/tokens'),
      );
      expect(_headers(driver)[_project], equals('prj_env'));
      expect(_headers(driver)[_account], equals('acc_env'));
    });
  });
}
