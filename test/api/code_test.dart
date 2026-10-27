import 'dart:convert';

import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `api.code` — the four workflow routes of the Api host (beta,
/// `Code.Workflows.md` §7), against the fake driver: the verb, the full path
/// with the id substituted, and where the parameters go (query / body). The
/// two signed resume links also go out from a client with no credentials.
NorbixApi _client(FakeHttpDriver driver, {String? apiKey, String? bearer}) =>
    NorbixApi(
      config: NorbixConfig(
        baseUrl: 'https://api.norbix.ai',
        apiKey: apiKey,
        bearerToken: bearer,
      ),
      driver: driver,
    );

class _Route {
  const _Route(this.name, this.method, this.path, this.call,
      {this.query = const {}, this.body});
  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(CodeResource code) call;
  final Map<String, String> query;
  final Map<String, Object?>? body;
}

final _routes = <_Route>[
  _Route(
      'getCodeWorkflowWaitingRuns',
      'GET',
      '/v3/code/workflows/runs',
      (c) => c.getCodeWorkflowWaitingRuns(query: {
            'status': 'waiting',
            'waitingKind': 'approval',
            'assignee': 'me',
            'workflowId': 'wf_1',
            'key': 'ord_1',
            'pageSize': 5,
          }),
      query: {
        'status': 'waiting',
        'waitingKind': 'approval',
        'assignee': 'me',
        'workflowId': 'wf_1',
        'key': 'ord_1',
        'pageSize': '5',
      }),
  _Route(
      'resumeCodeWorkflowRun',
      'POST',
      '/v3/code/workflows/runs/run_1/resume',
      (c) => c.resumeCodeWorkflowRun(runId: 'run_1', body: {
            'stepId': 'approve',
            'decision': 'approved',
            'payload': {'note': 'ok'},
          }),
      body: {
        'stepId': 'approve',
        'decision': 'approved',
        'payload': {'note': 'ok'},
      }),
  _Route(
      'openCodeWorkflowResumeLink',
      'GET',
      '/v3/code/workflows/resume/tok_abc',
      (c) => c.openCodeWorkflowResumeLink(token: 'tok_abc')),
  _Route(
      'useCodeWorkflowResumeLink',
      'POST',
      '/v3/code/workflows/resume/tok_abc',
      (c) => c.useCodeWorkflowResumeLink(
          token: 'tok_abc', body: {'decision': 'rejected'}),
      body: {'decision': 'rejected'}),
];

void main() {
  group('api.code — workflows (beta): verb, path, query and body', () {
    test('4 routes, no duplicate names', () {
      expect(_routes.length, equals(4));
      expect(_routes.map((r) => r.name).toSet().length, equals(4));
    });

    for (final route in _routes) {
      test('${route.name} → ${route.method} ${route.path}', () async {
        final driver = FakeHttpDriver();
        await route.call(_client(driver, apiKey: 'k').code);

        final req = driver.lastRequest!;
        expect(req.method, equals(route.method));
        expect(req.url.path, equals(route.path));
        expect(req.url.queryParameters, equals(route.query));
        if (route.body == null) {
          expect(req.body, isNull);
        } else {
          expect(jsonDecode(req.body!), equals(route.body));
        }
      });
    }
  });

  // The signed resume link is its own key: a client with no credentials
  // still sends it, with no credential header and no error; a client with a
  // token still sends the token.
  group('api.code — signed resume links need no sign-in', () {
    final links = <String, Future<Object?> Function(CodeResource code)>{
      'openCodeWorkflowResumeLink': (c) =>
          c.openCodeWorkflowResumeLink(token: 'tok_abc'),
      'useCodeWorkflowResumeLink': (c) => c.useCodeWorkflowResumeLink(
          token: 'tok_abc', body: {'decision': 'approved'}),
    };

    for (final entry in links.entries) {
      test('${entry.key}: no credentials sends no auth and does not throw',
          () async {
        final driver = FakeHttpDriver();
        await entry.value(_client(driver).code);

        final req = driver.lastRequest!;
        expect(req.url.path, equals('/v3/code/workflows/resume/tok_abc'));
        expect(req.headers.containsKey('authorization'), isFalse);
        expect(req.headers.containsKey('x-api-key'), isFalse);
      });

      test('${entry.key}: a bearer token is sent as Authorization', () async {
        final driver = FakeHttpDriver();
        await entry.value(_client(driver, bearer: 'tok').code);

        expect(
            driver.lastRequest!.headers['authorization'], equals('Bearer tok'));
      });
    }
  });
}
