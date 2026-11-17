import 'package:norbix/norbix_api.dart';
import 'package:norbix/norbix_hub.dart' show NorbixHub;
import 'package:test/test.dart';

import '../_fake_driver.dart';

// The first three labels are the server's own values (project DTO
// `hostLabel`, a project's DNS record), not this decoder's — devops
// docs/tasks/clients-project-host.md.
const _vectors = <String, String>{
  'pr_5XvmrTA6JVggZdmEE5bGdm': 'pr-022c4aca9f9e4df787ab0a20c83c44b6',
  'pr_3vlTD52e9VK8lXzdv0SmWG': 'pr-184336d00e2141c3be5138e8dcf52e81',
  'pr_89W9MJvt0StwxsEvyohlJ': 'pr-60d101b1938747659947d507192a5204',
  'pr_xCeyU0VjHvjVi5MpOYSGY': 'pr-6b8b6182960c416098d153d3eb0e601f',
};
const _notAProjectId = <String>[
  'p1',
  'proj_123',
  'pr_',
  'pr_!!!',
  'pr_zzzzzzzzzzzzzzzzzzzzzzz',
  'acc_oOAAIfAzbauZ6f0NHEHjP',
  '',
  // 22 digits, but 2^128 or more.
  'pr_zzzzzzzzzzzzzzzzzzzzzz',
  // A GUID that is not version 4 (all zero).
  'pr_0',
];

const _virginia = 'pr_5XvmrTA6JVggZdmEE5bGdm';
const _virginiaHost =
    'https://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.norbix.ai';
const _germany = 'pr_3vlTD52e9VK8lXzdv0SmWG';
const _germanyHost =
    'https://pr-184336d00e2141c3be5138e8dcf52e81.api.norbix.ai';

const _project = 'norbix-project-id';

String _url(FakeHttpDriver d) => d.lastRequest!.url.toString();
Map<String, String> _headers(FakeHttpDriver d) => d.lastRequest!.headers;

void main() {
  group('project host — the label', () {
    _vectors.forEach((projectId, label) {
      test('$projectId → $label', () {
        expect(projectHostLabel(projectId), equals(label));
      });
    });

    for (final value in _notAProjectId) {
      test('"$value" is not a project id: no label, no throw', () {
        expect(projectHostLabel(value), isNull);
      });
    }

    test('null gives no label', () {
      expect(projectHostLabel(null), isNull);
    });
  });

  group('project host — default base URL', () {
    test('API calls go to the project host and still send norbix-project-id',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _virginia, driver: driver);

      await api.users.getUsers();

      expect(_url(driver), equals('$_virginiaHost/v3/membership/auth'));
      expect(_headers(driver)[_project], equals(_virginia));
      // The config keeps the address it was given: the host is per request.
      expect(api.config.baseUrl, equals('https://api.norbix.ai'));
    });

    test('Hub calls stay on the shared host', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(projectId: _virginia, driver: driver);

      await hub.accounts.getAccountRegions();

      expect(_url(driver), equals('https://hub.norbix.ai/v3/account/regions'));
      expect(_headers(driver)[_project], equals(_virginia));
    });

    test('a Hub client with no project stays on the shared host', () async {
      final driver = FakeHttpDriver();
      final hub = NorbixHub(driver: driver);

      await hub.accounts.getAccountRegions();

      expect(_url(driver), startsWith('https://hub.norbix.ai/'));
      expect(_headers(driver).containsKey(_project), isFalse);
    });

    test('the project id from NORBIX_API_PROJECT_ID gives the project host too',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi.fromEnv(
        overrides: {'NORBIX_API_PROJECT_ID': _germany},
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)[_project], equals(_germany));
    });

    test('sign-in (/auth) goes to the project host', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _virginia, driver: driver);

      await api.auth.authenticate();

      expect(_url(driver), equals('$_virginiaHost/auth'));
    });

    test('raw bytes and raw answers go to the project host as well', () async {
      final driver = FakeHttpDriver();
      final t = Transport(
        config: NorbixConfig(
            baseUrl: kNorbixApiDefaultBaseUrl, projectId: _virginia),
        driver: driver,
      );

      await t.sendBytes(route: '/{version}/files/f1');
      expect(_url(driver), equals('$_virginiaHost/v3/files/f1'));
      await t.sendRaw(route: '/{version}/echo');
      expect(_url(driver), equals('$_virginiaHost/v3/echo'));
    });

    test('no project id keeps the shared host', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(driver: driver);

      await api.users.getUsers();

      expect(_url(driver), startsWith('https://api.norbix.ai/'));
      expect(_headers(driver).containsKey(_project), isFalse);
    });

    test('a project id that is not a Norbix id keeps the shared host',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: 'p1', driver: driver);

      await api.users.getUsers();

      expect(_url(driver), startsWith('https://api.norbix.ai/'));
      expect(_headers(driver)[_project], equals('p1'));
    });

    test(
        'setProjectId moves the calls to the new project: host and header agree',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _virginia, driver: driver);

      api.setProjectId(_germany);
      await api.users.getUsers();
      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)[_project], equals(_germany));

      api.setProjectId('p1');
      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.norbix.ai/'));
      expect(_headers(driver)[_project], equals('p1'));

      api.setProjectId(null);
      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.norbix.ai/'));
      expect(_headers(driver).containsKey(_project), isFalse);
    });

    test('setConfig moves the calls to the new config project', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _virginia, driver: driver);

      api.setConfig(
        NorbixConfig(baseUrl: kNorbixApiDefaultBaseUrl, projectId: _germany),
      );
      await api.users.getUsers();

      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)[_project], equals(_germany));
    });

    test('a per-call norbix-project-id header moves that call only', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _virginia, driver: driver);

      await api.users.getUsers(headers: {_project: _germany});
      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)[_project], equals(_germany));

      await api.users.getUsers();
      expect(_url(driver), startsWith('$_virginiaHost/'));
      expect(_headers(driver)[_project], equals(_virginia));
    });

    test(
        'the social sign-in link stays on the shared host (the callback comes back there)',
        () {
      final api = NorbixApi(projectId: _virginia, driver: FakeHttpDriver());

      final url = api.users.socialSignInUrl('google').toString();

      expect(
        url,
        startsWith('https://api.norbix.ai/v3/membership/auth/social/google?'),
      );
      expect(url, contains('projectId=$_virginia'));
    });
  });

  group('project host — with a region', () {
    test(
        'API: the project host with no region label; Hub: the regional host; nb-region still sent',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(
        projectId: _germany,
        region: 'nb-eu-germany',
        driver: driver,
      );
      await api.users.getUsers();
      expect(_url(driver), equals('$_germanyHost/v3/membership/auth'));
      expect(_headers(driver)['nb-region'], equals('nb-eu-germany'));
      expect(_headers(driver)[_project], equals(_germany));

      final hub = NorbixHub(
        projectId: _germany,
        region: 'nb-eu-germany',
        driver: driver,
      );
      await hub.accounts.getAccountRegions();
      expect(_url(driver), startsWith('https://nb-eu-germany.hub.norbix.ai/'));
      expect(_headers(driver)['nb-region'], equals('nb-eu-germany'));
    });

    test('NORBIX_API_REGION does not add a region label to the project host',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi.fromEnv(
        overrides: {
          'NORBIX_API_PROJECT_ID': _germany,
          'NORBIX_API_REGION': 'nb-eu-germany',
        },
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)['nb-region'], equals('nb-eu-germany'));
    });

    test('setRegion leaves the API on the project host', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(projectId: _germany, driver: driver);

      api.setRegion('nb-eu-germany');
      await api.users.getUsers();
      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver)['nb-region'], equals('nb-eu-germany'));

      api.setRegion(null);
      await api.users.getUsers();
      expect(_url(driver), startsWith('$_germanyHost/'));
      expect(_headers(driver).containsKey('nb-region'), isFalse);
    });

    test('an id that does not decode keeps the regional API host', () async {
      final driver = FakeHttpDriver();
      final api =
          NorbixApi(projectId: 'p1', region: 'nb-eu-germany', driver: driver);

      await api.users.getUsers();

      expect(_url(driver), startsWith('https://nb-eu-germany.api.norbix.ai/'));
    });

    test('the social sign-in link uses the regional shared host', () {
      final api = NorbixApi(
        projectId: _germany,
        region: 'nb-eu-germany',
        driver: FakeHttpDriver(),
      );

      expect(
        api.users.socialSignInUrl('google').toString(),
        startsWith('https://nb-eu-germany.api.norbix.ai/'),
      );
    });
  });

  group('project host — a custom base URL is never rewritten', () {
    test('config baseUrl (staging)', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(
        config: NorbixConfig(
          baseUrl: 'https://api.norbix.io',
          projectId: _virginia,
          region: 'nb-eu-germany',
        ),
        driver: driver,
      );

      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.norbix.io/'));
      expect(_headers(driver)[_project], equals(_virginia));

      api.setProjectId(_germany);
      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.norbix.io/'));
      expect(_headers(driver)[_project], equals(_germany));

      expect(
        api.users.socialSignInUrl('google').toString(),
        startsWith('https://api.norbix.io/'),
      );
    });

    test('NORBIX_API_BASE_URL', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi.fromEnv(
        overrides: {
          'NORBIX_API_PROJECT_ID': _virginia,
          'NORBIX_API_BASE_URL': 'https://api.norbix.io',
        },
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('https://api.norbix.io/'));
      expect(_headers(driver)[_project], equals(_virginia));
    });

    test('localhost', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(
        config: NorbixConfig(
            baseUrl: 'http://localhost:5002', projectId: _virginia),
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('http://localhost:5002/'));
    });

    test(
        'the default address written out is the default (told by value, as for regions)',
        () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi(
        config: NorbixConfig(
            baseUrl: 'https://api.norbix.ai/', projectId: _virginia),
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('$_virginiaHost/'));
    });

    test('composeProjectBaseUrl rewrites the API default only', () {
      expect(
        composeProjectBaseUrl('https://api.norbix.ai', _virginia),
        equals(_virginiaHost),
      );
      expect(composeProjectBaseUrl('https://hub.norbix.ai', _virginia), isNull);
      expect(composeProjectBaseUrl('https://api.norbix.io', _virginia), isNull);
      expect(composeProjectBaseUrl('https://api.norbix.ai', 'p1'), isNull);
      expect(composeProjectBaseUrl('https://api.norbix.ai', null), isNull);
    });
  });
}
