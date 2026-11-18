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

  group('project host — an address with no project host is used as given', () {
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
        'the default address written out gets the project host (trailing slash too)',
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

  group('project host — round 2: any address that serves one', () {
    const customHost =
        'https://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.customer.com';
    const template = 'https://{projectHostLabel}.api.customer.com';

    NorbixApi apiOn(
      String baseUrl,
      String? projectId,
      FakeHttpDriver d, {
      String? region,
    }) =>
        NorbixApi(
          config: NorbixConfig(
            baseUrl: baseUrl,
            projectId: projectId,
            region: region,
          ),
          driver: d,
        );

    test('the placeholder constant', () {
      expect(kNorbixProjectHostLabelPlaceholder, equals('{projectHostLabel}'));
    });

    group('projectApiBaseUrl', () {
      void expectHosts(
        String baseUrl,
        String? projectId,
        String project,
        String shared,
      ) {
        final hosts = projectApiBaseUrl(baseUrl, projectId);
        expect(hosts.project, equals(project), reason: 'project');
        expect(hosts.shared, equals(shared), reason: 'shared');
      }

      test('https://api.norbix.ai → project host', () {
        expectHosts(
          'https://api.norbix.ai',
          _virginia,
          _virginiaHost,
          'https://api.norbix.ai',
        );
      });

      test(
        'a regional norbix.ai address → project host, shared is regional',
        () {
          expectHosts(
            'https://nb-eu-germany.api.norbix.ai',
            _germany,
            _germanyHost,
            'https://nb-eu-germany.api.norbix.ai',
          );
        },
      );

      test('a norbix.ai address keeps its path', () {
        expectHosts(
          'https://api.norbix.ai/v3',
          _virginia,
          '$_virginiaHost/v3',
          'https://api.norbix.ai/v3',
        );
      });

      test('a template is filled; shared drops the placeholder', () {
        expectHosts(
          template,
          _virginia,
          customHost,
          'https://api.customer.com',
        );
      });

      test('a template with a port and a path', () {
        expectHosts(
          'http://{projectHostLabel}.api.local.norbix.test:8443/v3',
          _virginia,
          'http://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.local.norbix.test:8443/v3',
          'http://api.local.norbix.test:8443/v3',
        );
      });

      test('a template with an id that does not decode → shared', () {
        expectHosts(
          template,
          'p1',
          'https://api.customer.com',
          'https://api.customer.com',
        );
        expectHosts(
          template,
          null,
          'https://api.customer.com',
          'https://api.customer.com',
        );
      });

      test('a pasted project host gets the current project label', () {
        expectHosts(
          customHost,
          _germany,
          'https://pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com',
          'https://api.customer.com',
        );
      });

      test('a pasted project host in upper case is one too', () {
        expectHosts(
          'https://PR-022C4ACA9F9E4DF787AB0A20C83C44B6.api.customer.com:8443',
          _germany,
          'https://pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com:8443',
          'https://api.customer.com:8443',
        );
      });

      test(
        'a pasted project host with an id that does not decode → shared',
        () {
          expectHosts(
            customHost,
            'p1',
            'https://api.customer.com',
            'https://api.customer.com',
          );
        },
      );

      test('a pasted norbix.ai project host follows the project', () {
        expectHosts(
          '$_virginiaHost/v3',
          _germany,
          '$_germanyHost/v3',
          'https://api.norbix.ai/v3',
        );
      });

      for (final asGiven in [
        'https://api.customer.com',
        'https://api.norbix.io',
        'http://localhost:5002',
        'http://api.norbix.ai',
        'https://hub.norbix.ai',
        'https://a.b.api.norbix.ai',
        'https://api.norbix.ai.evil.com',
        'not a url',
        '',
      ]) {
        test('"$asGiven" is used as given', () {
          expectHosts(asGiven, _virginia, asGiven, asGiven);
        });
      }

      test('a norbix.ai address with an id that does not decode stays', () {
        expectHosts(
          'https://nb-eu-germany.api.norbix.ai',
          'p1',
          'https://nb-eu-germany.api.norbix.ai',
          'https://nb-eu-germany.api.norbix.ai',
        );
      });
    });

    test(
        'a written-out regional norbix.ai address: project host; sign-in link on the regional shared host',
        () async {
      final driver = FakeHttpDriver();
      final api = apiOn(
        'https://nb-eu-germany.api.norbix.ai',
        _germany,
        driver,
      );

      await api.users.getUsers();

      expect(_url(driver), equals('$_germanyHost/v3/membership/auth'));
      expect(_headers(driver)[_project], equals(_germany));
      expect(
        api.users.socialSignInUrl('google').toString(),
        startsWith(
          'https://nb-eu-germany.api.norbix.ai/v3/membership/auth/social/google?',
        ),
      );
    });

    test('a written-out https://api.norbix.ai with a region', () async {
      final driver = FakeHttpDriver();
      final api = apiOn(
        'https://api.norbix.ai',
        _germany,
        driver,
        region: 'nb-eu-germany',
      );

      await api.users.getUsers();

      expect(_url(driver), equals('$_germanyHost/v3/membership/auth'));
      expect(_headers(driver)['nb-region'], equals('nb-eu-germany'));
      expect(
        api.users.socialSignInUrl('google').toString(),
        startsWith('https://nb-eu-germany.api.norbix.ai/'),
      );
    });

    test(
        'a template: the project host; switching project moves host and header together',
        () async {
      final driver = FakeHttpDriver();
      final api = apiOn(template, _virginia, driver);

      await api.users.getUsers();
      expect(_url(driver), equals('$customHost/v3/membership/auth'));
      expect(_headers(driver)[_project], equals(_virginia));

      api.setProjectId(_germany);
      await api.users.getUsers();
      expect(
        _url(driver),
        equals(
          'https://pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com/v3/membership/auth',
        ),
      );
      expect(_headers(driver)[_project], equals(_germany));

      await api.users.getUsers(headers: {_project: _virginia});
      expect(_url(driver), startsWith('$customHost/'));
      expect(_headers(driver)[_project], equals(_virginia));

      api.setProjectId('p1');
      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.customer.com/'));
      expect(_headers(driver)[_project], equals('p1'));

      api.setProjectId(null);
      await api.users.getUsers();
      expect(_url(driver), startsWith('https://api.customer.com/'));
      expect(_headers(driver).containsKey(_project), isFalse);
    });

    test('a template: the sign-in link is on the shared address', () {
      final api = apiOn(template, _virginia, FakeHttpDriver());

      final url = api.users.socialSignInUrl('google').toString();

      expect(
        url,
        startsWith(
          'https://api.customer.com/v3/membership/auth/social/google?',
        ),
      );
      expect(url, contains('projectId=$_virginia'));
    });

    test('a template from NORBIX_API_BASE_URL', () async {
      final driver = FakeHttpDriver();
      final api = NorbixApi.fromEnv(
        overrides: {
          'NORBIX_API_PROJECT_ID': _virginia,
          'NORBIX_API_BASE_URL': template,
        },
        driver: driver,
      );

      await api.users.getUsers();

      expect(_url(driver), startsWith('$customHost/'));
    });

    test('a template with a port', () async {
      final driver = FakeHttpDriver();
      final api = apiOn(
        'http://{projectHostLabel}.api.local.norbix.test:8443',
        _virginia,
        driver,
      );

      await api.users.getUsers();

      expect(
        _url(driver),
        equals(
          'http://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.local.norbix.test:8443/v3/membership/auth',
        ),
      );
    });

    test('a template with p1 goes to the shared address', () async {
      final driver = FakeHttpDriver();
      final api = apiOn(template, 'p1', driver);

      await api.users.getUsers();

      expect(
        _url(driver),
        equals('https://api.customer.com/v3/membership/auth'),
      );
      expect(_headers(driver)[_project], equals('p1'));
    });

    test('a pasted project host follows the client project', () async {
      final driver = FakeHttpDriver();
      final api = apiOn(customHost, _germany, driver);

      await api.users.getUsers();

      expect(
        _url(driver),
        equals(
          'https://pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com/v3/membership/auth',
        ),
      );
      expect(_headers(driver)[_project], equals(_germany));
      expect(
        api.users.socialSignInUrl('google').toString(),
        startsWith('https://api.customer.com/'),
      );
    });

    for (final asGiven in [
      'https://api.customer.com',
      'https://api.norbix.io',
      'http://localhost:5002',
      'http://api.norbix.ai',
    ]) {
      test('$asGiven is called as given', () async {
        final driver = FakeHttpDriver();
        final api = apiOn(asGiven, _virginia, driver);

        await api.users.getUsers();

        expect(_url(driver), equals('$asGiven/v3/membership/auth'));
        expect(_headers(driver)[_project], equals(_virginia));
      });
    }

    group('the Hub stays on its URL', () {
      for (final hubUrl in [
        'https://nb-eu-germany.api.norbix.ai',
        'https://api.norbix.ai',
        customHost,
      ]) {
        test(hubUrl, () async {
          final driver = FakeHttpDriver();
          final hub = NorbixHub(
            config: NorbixConfig(baseUrl: hubUrl, projectId: _germany),
            driver: driver,
          );

          await hub.accounts.getAccountRegions();

          expect(_url(driver), equals('$hubUrl/v3/account/regions'));
          expect(_headers(driver)[_project], equals(_germany));
        });
      }
    });
  });
}
