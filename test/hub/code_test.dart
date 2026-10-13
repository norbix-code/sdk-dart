import 'dart:convert';

import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.code` — every Code Hub endpoint (39: the module switch, the
/// integrations, the marketplace and the five cloud-function routes of
/// `Code.Functions.md`), against the fake driver (never a real server): the
/// verb and the full path with every id substituted; for the five
/// cloud-function routes also where the parameters go (query / body).
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

void main() {
  group('hub.code — every route: verb and path', () {
    test('39 routes, no duplicate names', () {
      expect(_routes.length, equals(39));
      expect(_routes.map((r) => r.name).toSet().length, equals(39));
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
  });
}
