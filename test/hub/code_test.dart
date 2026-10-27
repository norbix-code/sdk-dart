import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.code` — every Code Hub endpoint (70: the module switch, the
/// integrations, the marketplace, the five cloud-function routes of
/// `Code.Functions.md` and the 26 workflow routes of `Code.Workflows.md`),
/// against the fake driver (never a real server): the verb and the full path
/// with every id substituted; for the cloud-function and workflow routes also
/// where the parameters go (query / body).
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

class _Route {
  const _Route(this.name, this.method, this.path, this.call);
  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(CodeResource code) call;
}

const _base = 'https://hub.norbix.ai';

final _routes = <_Route>[
  _Route('enableCode', 'PUT', '/v3/code/enable', (c) => c.enableCode()),
  _Route('disableCode', 'PUT', '/v3/code/disable', (c) => c.disableCode()),
  _Route('getCodeIntegrations', 'GET', '/v3/code/integrations',
      (c) => c.getCodeIntegrations()),
  _Route('getCodeIntegration', 'GET', '/v3/code/integrations/int_1',
      (c) => c.getCodeIntegration(id: 'int_1')),
  _Route('saveCodeIntegration', 'POST', '/v3/code/integrations',
      (c) => c.saveCodeIntegration()),
  _Route('testCodeIntegration', 'POST', '/v3/code/integrations/test',
      (c) => c.testCodeIntegration()),
  _Route(
      'confirmCodeIntegrationHumanDelivery',
      'POST',
      '/v3/code/integrations/confirm-human-delivery',
      (c) => c.confirmCodeIntegrationHumanDelivery()),
  _Route('deleteCodeIntegration', 'DELETE', '/v3/code/integrations/int_1',
      (c) => c.deleteCodeIntegration(id: 'int_1')),
  _Route('enableCodeIntegration', 'PUT', '/v3/code/integrations/int_1/enable',
      (c) => c.enableCodeIntegration(id: 'int_1')),
  _Route('disableCodeIntegration', 'PUT', '/v3/code/integrations/int_1/disable',
      (c) => c.disableCodeIntegration(id: 'int_1')),
  _Route('getMarketplaceListings', 'GET', '/v3/code/marketplace/listings',
      (c) => c.getMarketplaceListings()),
  _Route('getMarketplaceListing', 'GET', '/v3/code/marketplace/listings/lst_1',
      (c) => c.getMarketplaceListing(listingViewId: 'lst_1')),
  _Route(
      'getMarketplaceListingFunctionTokens',
      'GET',
      '/v3/code/marketplace/listings/lst_1/functions/fn-key/tokens',
      (c) => c.getMarketplaceListingFunctionTokens(
          listingViewId: 'lst_1', functionKey: 'fn-key')),
  _Route(
      'getMarketplaceIntegrations',
      'GET',
      '/v3/code/marketplace/integrations',
      (c) => c.getMarketplaceIntegrations()),
  _Route(
      'getMarketplaceIntegration',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1',
      (c) => c.getMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'saveMarketplaceIntegration',
      'POST',
      '/v3/code/marketplace/integrations',
      (c) => c.saveMarketplaceIntegration()),
  _Route(
      'deleteMarketplaceIntegration',
      'DELETE',
      '/v3/code/marketplace/integrations/mpi_1',
      (c) => c.deleteMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'enableMarketplaceIntegration',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/enable',
      (c) => c.enableMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'disableMarketplaceIntegration',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/disable',
      (c) => c.disableMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'testMarketplaceIntegration',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/test',
      (c) => c.testMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'getMarketplaceIntegrationTools',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/tools',
      (c) => c.getMarketplaceIntegrationTools(integrationViewId: 'mpi_1')),
  _Route(
      'getMarketplaceIntegrationAccess',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/access',
      (c) => c.getMarketplaceIntegrationAccess(integrationViewId: 'mpi_1')),
  _Route(
      'setMarketplaceIntegrationRoleAccess',
      'PUT',
      '/v3/code/marketplace/integrations/mpi_1/access/roles',
      (c) => c.setMarketplaceIntegrationRoleAccess(integrationViewId: 'mpi_1')),
  _Route(
      'saveMarketplaceIntegrationCustomAccess',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/access/roles/custom',
      (c) =>
          c.saveMarketplaceIntegrationCustomAccess(integrationViewId: 'mpi_1')),
  _Route(
      'startMarketplaceIntegrationSignIn',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/oauth/start',
      (c) => c.startMarketplaceIntegrationSignIn(integrationViewId: 'mpi_1')),
  _Route(
      'signOutMarketplaceIntegration',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/oauth/sign-out',
      (c) => c.signOutMarketplaceIntegration(integrationViewId: 'mpi_1')),
  _Route(
      'replaceMarketplaceIntegrationSecrets',
      'PUT',
      '/v3/code/marketplace/integrations/mpi_1/secrets',
      (c) =>
          c.replaceMarketplaceIntegrationSecrets(integrationViewId: 'mpi_1')),
  _Route(
      'revealMarketplaceIntegrationSecrets',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/secrets/reveal',
      (c) => c.revealMarketplaceIntegrationSecrets(integrationViewId: 'mpi_1')),
  _Route(
      'setMarketplaceIntegrationTokenMappings',
      'PUT',
      '/v3/code/marketplace/integrations/mpi_1/token-mappings',
      (c) =>
          c.setMarketplaceIntegrationTokenMappings(integrationViewId: 'mpi_1')),
  _Route(
      'getMarketplaceFunctionCatalog',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/catalog',
      (c) => c.getMarketplaceFunctionCatalog(integrationViewId: 'mpi_1')),
  _Route(
      'getMarketplaceFunctions',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/functions',
      (c) => c.getMarketplaceFunctions(integrationViewId: 'mpi_1')),
  _Route(
      'getMarketplaceFunction',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/functions/mpf_1',
      (c) => c.getMarketplaceFunction(
          integrationViewId: 'mpi_1', functionViewId: 'mpf_1')),
  _Route(
      'saveMarketplaceFunction',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/functions',
      (c) => c.saveMarketplaceFunction(integrationViewId: 'mpi_1')),
  _Route(
      'deleteMarketplaceFunction',
      'DELETE',
      '/v3/code/marketplace/integrations/mpi_1/functions/mpf_1',
      (c) => c.deleteMarketplaceFunction(
          integrationViewId: 'mpi_1', functionViewId: 'mpf_1')),
  _Route(
      'enableMarketplaceFunction',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/enable',
      (c) => c.enableMarketplaceFunction(
          integrationViewId: 'mpi_1', functionViewId: 'mpf_1')),
  _Route(
      'disableMarketplaceFunction',
      'POST',
      '/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/disable',
      (c) => c.disableMarketplaceFunction(
          integrationViewId: 'mpi_1', functionViewId: 'mpf_1')),
  _Route(
      'getMarketplaceFunctionTokens',
      'GET',
      '/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/tokens',
      (c) => c.getMarketplaceFunctionTokens(
          integrationViewId: 'mpi_1', functionViewId: 'mpf_1')),
  _Route(
      'invokeMarketplaceFunction',
      'POST',
      '/v3/code/marketplace/functions/mpf_1/invoke',
      (c) => c.invokeMarketplaceFunction(functionViewId: 'mpf_1')),
  _Route(
      'getMarketplaceFunctionRuns',
      'GET',
      '/v3/code/marketplace/functions/runs',
      (c) => c.getMarketplaceFunctionRuns()),
  _Route('getCodeFunctions', 'GET', '/v3/code/functions',
      (c) => c.getCodeFunctions()),
  _Route('getCodeFunctionQualifiers', 'GET', '/v3/code/functions/qualifiers',
      (c) => c.getCodeFunctionQualifiers()),
  _Route('invokeCodeFunction', 'POST', '/v3/code/functions/invoke',
      (c) => c.invokeCodeFunction()),
  _Route('getCodeFunctionEventSample', 'GET', '/v3/code/functions/event-sample',
      (c) => c.getCodeFunctionEventSample()),
  _Route('getCodeFunctionRuns', 'GET', '/v3/code/functions/runs',
      (c) => c.getCodeFunctionRuns()),
];

/// A workflow route (beta): the call, the verb, the path with the id
/// substituted, and what must land in the query string and the JSON body.
class _WorkflowRoute {
  const _WorkflowRoute(this.name, this.method, this.path, this.call,
      {this.query = const {}, this.body});
  final String name;
  final String method;
  final String path;
  final Future<Object?> Function(CodeResource code) call;
  final Map<String, String> query;
  final Map<String, Object?>? body;
}

const _definition = <String, Object?>{
  'name': 'Order approval',
  'trigger': {'kind': 'manual'},
  'steps': [
    {'id': 'approve', 'kind': 'approval'},
  ],
};

final _workflowRoutes = <_WorkflowRoute>[
  _WorkflowRoute(
      'getCodeWorkflows',
      'GET',
      '/v3/code/workflows',
      (c) => c.getCodeWorkflows(query: {
            'isEnabled': true,
            'pageSize': 20,
            'startingAfter': 'wf_0',
          }),
      query: {'isEnabled': 'true', 'pageSize': '20', 'startingAfter': 'wf_0'}),
  _WorkflowRoute('saveCodeWorkflow', 'PUT', '/v3/code/workflows',
      (c) => c.saveCodeWorkflow(body: {'definition': _definition}),
      body: {'definition': _definition}),
  _WorkflowRoute('getCodeWorkflow', 'GET', '/v3/code/workflows/wf_1',
      (c) => c.getCodeWorkflow(id: 'wf_1', query: {'pinnedVersion': 3}),
      query: {'pinnedVersion': '3'}),
  _WorkflowRoute('deleteCodeWorkflow', 'DELETE', '/v3/code/workflows/wf_1',
      (c) => c.deleteCodeWorkflow(id: 'wf_1')),
  _WorkflowRoute('enableCodeWorkflow', 'PUT', '/v3/code/workflows/wf_1/enable',
      (c) => c.enableCodeWorkflow(id: 'wf_1')),
  _WorkflowRoute(
      'disableCodeWorkflow',
      'PUT',
      '/v3/code/workflows/wf_1/disable',
      (c) => c.disableCodeWorkflow(id: 'wf_1')),
  _WorkflowRoute(
      'publishCodeWorkflow',
      'POST',
      '/v3/code/workflows/wf_1/publish',
      (c) => c.publishCodeWorkflow(id: 'wf_1')),
  _WorkflowRoute('getCodeWorkflowDraft', 'GET', '/v3/code/workflows/wf_1/draft',
      (c) => c.getCodeWorkflowDraft(id: 'wf_1')),
  _WorkflowRoute(
      'discardCodeWorkflowDraft',
      'DELETE',
      '/v3/code/workflows/wf_1/draft',
      (c) => c.discardCodeWorkflowDraft(id: 'wf_1')),
  _WorkflowRoute(
      'getCodeWorkflowVersions',
      'GET',
      '/v3/code/workflows/wf_1/versions',
      (c) => c.getCodeWorkflowVersions(id: 'wf_1')),
  _WorkflowRoute(
      'getCodeWorkflowVersionDiff',
      'GET',
      '/v3/code/workflows/wf_1/versions/diff',
      (c) => c.getCodeWorkflowVersionDiff(
          id: 'wf_1', query: {'fromVersion': 1, 'toVersion': 2}),
      query: {'fromVersion': '1', 'toVersion': '2'}),
  _WorkflowRoute(
      'invokeCodeWorkflow',
      'POST',
      '/v3/code/workflows/wf_1/invoke',
      (c) => c.invokeCodeWorkflow(id: 'wf_1', body: {
            'payload': {'orderId': 'ord_1'},
            'waitSeconds': 10,
            'runVersion': 'draft',
          }),
      body: {
        'payload': {'orderId': 'ord_1'},
        'waitSeconds': 10,
        'runVersion': 'draft',
      }),
  _WorkflowRoute(
      'getCodeWorkflowRuns',
      'GET',
      '/v3/code/workflows/wf_1/runs',
      (c) => c.getCodeWorkflowRuns(id: 'wf_1', query: {
            'status': 'failed',
            'from': '2026-10-01T00:00:00Z',
            'to': '2026-10-27T00:00:00Z',
            'pageSize': 10,
          }),
      query: {
        'status': 'failed',
        'from': '2026-10-01T00:00:00Z',
        'to': '2026-10-27T00:00:00Z',
        'pageSize': '10',
      }),
  _WorkflowRoute(
      'resumeCodeWorkflowRunByKey',
      'POST',
      '/v3/code/workflows/wf_1/resume',
      (c) => c.resumeCodeWorkflowRunByKey(id: 'wf_1', body: {
            'key': 'ord_1',
            'stepId': 'approve',
            'decision': 'approved',
            'payload': {'note': 'ok'},
          }),
      body: {
        'key': 'ord_1',
        'stepId': 'approve',
        'decision': 'approved',
        'payload': {'note': 'ok'},
      }),
  _WorkflowRoute('validateCodeWorkflow', 'POST', '/v3/code/workflows/validate',
      (c) => c.validateCodeWorkflow(body: {'definition': _definition}),
      body: {'definition': _definition}),
  _WorkflowRoute('getCodeWorkflowSchema', 'GET', '/v3/code/workflows/schema',
      (c) => c.getCodeWorkflowSchema()),
  _WorkflowRoute('enableCodeWorkflows', 'PUT', '/v3/code/workflows/enable',
      (c) => c.enableCodeWorkflows()),
  _WorkflowRoute('disableCodeWorkflows', 'PUT', '/v3/code/workflows/disable',
      (c) => c.disableCodeWorkflows()),
  _WorkflowRoute(
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
  _WorkflowRoute('getCodeWorkflowRun', 'GET', '/v3/code/workflows/runs/run_1',
      (c) => c.getCodeWorkflowRun(runId: 'run_1')),
  _WorkflowRoute(
      'getCodeWorkflowRunLogs',
      'GET',
      '/v3/code/workflows/runs/run_1/logs',
      (c) => c.getCodeWorkflowRunLogs(
          runId: 'run_1',
          query: {'stepId': 'approve', 'level': 'error', 'pageSize': 50}),
      query: {'stepId': 'approve', 'level': 'error', 'pageSize': '50'}),
  _WorkflowRoute(
      'resumeCodeWorkflowRun',
      'POST',
      '/v3/code/workflows/runs/run_1/resume',
      (c) => c.resumeCodeWorkflowRun(runId: 'run_1', body: {
            'stepId': 'approve',
            'decision': 'rejected',
            'payload': {'reason': 'over budget'},
          }),
      body: {
        'stepId': 'approve',
        'decision': 'rejected',
        'payload': {'reason': 'over budget'},
      }),
  _WorkflowRoute(
      'retryCodeWorkflowRunStep',
      'POST',
      '/v3/code/workflows/runs/run_1/retry',
      (c) => c
          .retryCodeWorkflowRunStep(runId: 'run_1', body: {'stepId': 'charge'}),
      body: {'stepId': 'charge'}),
  _WorkflowRoute(
      'cancelCodeWorkflowRun',
      'POST',
      '/v3/code/workflows/runs/run_1/cancel',
      (c) => c.cancelCodeWorkflowRun(
          runId: 'run_1', body: {'reason': 'duplicate order'}),
      body: {'reason': 'duplicate order'}),
  _WorkflowRoute(
      'openCodeWorkflowResumeLink',
      'GET',
      '/v3/code/workflows/resume/tok_abc',
      (c) => c.openCodeWorkflowResumeLink(token: 'tok_abc')),
  _WorkflowRoute(
      'useCodeWorkflowResumeLink',
      'POST',
      '/v3/code/workflows/resume/tok_abc',
      (c) => c.useCodeWorkflowResumeLink(
          token: 'tok_abc', body: {'decision': 'approved'}),
      body: {'decision': 'approved'}),
];

void main() {
  group('hub.code — every route: verb and path', () {
    test('70 routes (44 + 26 workflow routes), no duplicate names', () {
      final names = [
        ..._routes.map((r) => r.name),
        ..._workflowRoutes.map((r) => r.name),
      ];
      expect(_routes.length, equals(44));
      expect(_workflowRoutes.length, equals(26));
      expect(names.toSet().length, equals(70));
    });

    for (final route in _routes) {
      test('${route.name} → ${route.method} ${route.path}', () async {
        final driver = FakeHttpDriver();
        await route.call(_client(driver).code);

        expect(driver.lastRequest!.method, equals(route.method));
        expect(
            driver.lastRequest!.url.toString(), equals('$_base${route.path}'));
      });
    }
  });

  group('hub.code — cloud functions', () {
    test('getCodeFunctions → GET /v3/code/functions, filters in the query',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getCodeFunctions(query: {
        'integrationId': 'int_1',
        'prefix': 'orders-',
        'tag': 'team=orders',
        'pageSize': 50,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/functions'));
      expect(
        req.url.queryParameters,
        equals({
          'integrationId': 'int_1',
          'prefix': 'orders-',
          'tag': 'team=orders',
          'pageSize': '50',
        }),
      );
      expect(req.body, isNull);
    });

    test('getCodeFunctionQualifiers → GET /v3/code/functions/qualifiers',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getCodeFunctionQualifiers(query: {
        'integrationId': 'int_1',
        'functionId': 'orders-on-update',
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/functions/qualifiers'));
      expect(
        req.url.queryParameters,
        equals({'integrationId': 'int_1', 'functionId': 'orders-on-update'}),
      );
      expect(req.body, isNull);
    });

    test('invokeCodeFunction → POST /v3/code/functions/invoke with the ref',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.invokeCodeFunction(body: {
        'functionRef': {
          'integrationId': 'int_1',
          'functionId': 'orders-on-update',
          'qualifier': 'prod',
        },
        'payload': {'orderId': '6ac54a59212c29912eaddd81', 'dryRun': true},
        'invocationType': 'Sync',
        'runAsUserId': 'usr_svc',
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.toString(), equals('$_base/v3/code/functions/invoke'));
      expect(
        jsonDecode(req.body!),
        equals({
          'functionRef': {
            'integrationId': 'int_1',
            'functionId': 'orders-on-update',
            'qualifier': 'prod',
          },
          'payload': {'orderId': '6ac54a59212c29912eaddd81', 'dryRun': true},
          'invocationType': 'Sync',
          'runAsUserId': 'usr_svc',
        }),
      );
    });

    test('getCodeFunctionEventSample → GET /v3/code/functions/event-sample',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getCodeFunctionEventSample(query: {
        'source': 'database',
        'event': 'database.record.updated',
        'schemaId': 'sch_1',
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/functions/event-sample'));
      expect(
        req.url.queryParameters,
        equals({
          'source': 'database',
          'event': 'database.record.updated',
          'schemaId': 'sch_1',
        }),
      );
      expect(req.body, isNull);
    });

    test('getCodeFunctionRuns → GET /v3/code/functions/runs, one of the ids',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getCodeFunctionRuns(query: {
        'triggerId': 'trg_1',
        'limit': 5,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/functions/runs'));
      expect(
        req.url.queryParameters,
        equals({'triggerId': 'trg_1', 'limit': '5'}),
      );
      expect(req.body, isNull);
    });

    test(
        'getMarketplaceFunctionRuns → GET /v3/code/marketplace/functions/runs, '
        'one of the ids', () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getMarketplaceFunctionRuns(query: {
        'taskId': 'tsk_9',
        'limit': 5,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/marketplace/functions/runs'));
      expect(
        req.url.queryParameters,
        equals({'taskId': 'tsk_9', 'limit': '5'}),
      );
      expect(req.body, isNull);
    });

    // Exactly one of functionId / triggerId / taskId (gateway item gw-runs).
    test(
        'getMarketplaceFunctionRuns → GET /v3/code/marketplace/functions/runs, '
        'a function\'s own runs by functionId', () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.getMarketplaceFunctionRuns(query: {
        'functionId': 'func_1p4R3gTobGZpD6fXvHT4rd',
        'limit': 50,
      });

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/code/marketplace/functions/runs'));
      expect(
        req.url.queryParameters,
        equals({'functionId': 'func_1p4R3gTobGZpD6fXvHT4rd', 'limit': '50'}),
      );
      expect(req.body, isNull);
    });

    // The stored MCP tool catalog of a connection (gateway item mcp-step1).
    test(
        'getMarketplaceIntegrationTools → GET '
        '/v3/code/marketplace/integrations/{id}/tools, id in the path',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .code
          .getMarketplaceIntegrationTools(integrationViewId: 'int_7Hq2mcpServer');

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/code/marketplace/integrations/int_7Hq2mcpServer/tools'));
      expect(req.url.queryParameters, isEmpty);
      expect(req.body, isNull);
    });

    // The access matrix of a connection (gateway item access, route 25).
    test(
        'getMarketplaceIntegrationAccess → GET '
        '/v3/code/marketplace/integrations/{id}/access, id in the path',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .code
          .getMarketplaceIntegrationAccess(integrationViewId: 'int_6Qp1dW2kRm8NsT4vYc0Hb');

      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access'));
      expect(req.url.queryParameters, isEmpty);
      expect(req.body, isNull);
    });

    // A role package (route 26): role, package and Manage flag in the body.
    test(
        'setMarketplaceIntegrationRoleAccess → PUT '
        '/v3/code/marketplace/integrations/{id}/access/roles, JSON body',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.setMarketplaceIntegrationRoleAccess(
          integrationViewId: 'int_6Qp1dW2kRm8NsT4vYc0Hb',
          body: {
            'roleId': 'acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU',
            'package': 'ReadOnly',
            'manage': false,
          });

      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path,
          equals('/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access/roles'));
      expect(req.url.queryParameters, isEmpty);
      expect(
          jsonDecode(req.body!),
          equals({
            'roleId': 'acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU',
            'package': 'ReadOnly',
            'manage': false,
          }));
    });

    // A custom access policy (route 27): the ticks in the body.
    test(
        'saveMarketplaceIntegrationCustomAccess → POST '
        '/v3/code/marketplace/integrations/{id}/access/roles/custom, JSON body',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).code.saveMarketplaceIntegrationCustomAccess(
          integrationViewId: 'int_6Qp1dW2kRm8NsT4vYc0Hb',
          body: {
            'roleId': 'acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU',
            'basePackage': 'ReadOnly',
            'tools': ['create_issue'],
            'functions': ['func_4hT2b9QkLm3XcT1yRfGh7a'],
            'manage': false,
            'newPolicyForThisRoleOnly': true,
          });

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(
          req.url.path,
          equals(
              '/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access/roles/custom'));
      expect(req.url.queryParameters, isEmpty);
      expect(
          jsonDecode(req.body!),
          equals({
            'roleId': 'acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU',
            'basePackage': 'ReadOnly',
            'tools': ['create_issue'],
            'functions': ['func_4hT2b9QkLm3XcT1yRfGh7a'],
            'manage': false,
            'newPolicyForThisRoleOnly': true,
          }));
    });

    // The OAuth sign-in start of an MCP connection (gateway item oauth, route 28).
    test(
        'startMarketplaceIntegrationSignIn → POST '
        '/v3/code/marketplace/integrations/{id}/oauth/start, id in the path',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .code
          .startMarketplaceIntegrationSignIn(integrationViewId: 'int_6Qp1dW2kRm8NsT4vYc0Hb');

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path,
          equals('/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/oauth/start'));
      expect(req.url.queryParameters, isEmpty);
      expect(req.body, isNull);
    });

    // The OAuth sign-out of an MCP connection (gateway item access-2b, route 30).
    test(
        'signOutMarketplaceIntegration → POST '
        '/v3/code/marketplace/integrations/{id}/oauth/sign-out, id in the path',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .code
          .signOutMarketplaceIntegration(integrationViewId: 'int_6Qp1dW2kRm8NsT4vYc0Hb');

      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path,
          equals('/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/oauth/sign-out'));
      expect(req.url.queryParameters, isEmpty);
      expect(req.body, isNull);
    });
  });

  group('hub.code — workflows (beta): verb, path, query and body', () {
    for (final route in _workflowRoutes) {
      test('${route.name} → ${route.method} ${route.path}', () async {
        final driver = FakeHttpDriver();
        await route.call(_client(driver).code);

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

    // The signed resume link is its own key: a client with no credentials
    // still sends it, with no credential header and no error.
    test('openCodeWorkflowResumeLink with no credentials sends no auth',
        () async {
      final driver = FakeHttpDriver();
      await NorbixHub(
        config: NorbixConfig(baseUrl: _base),
        driver: driver,
      ).code.openCodeWorkflowResumeLink(token: 'tok_abc');

      final req = driver.lastRequest!;
      expect(req.url.path, equals('/v3/code/workflows/resume/tok_abc'));
      expect(req.headers.containsKey('authorization'), isFalse);
      expect(req.headers.containsKey('x-api-key'), isFalse);
    });
  });
}
