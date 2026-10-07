import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.database — every method sends its verb and route', () {
    test(
        'aggregateRecords sends POST /{version}/database/collections/{collectionName}/aggregate',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.aggregateRecords(
          collectionName: 'collectionName_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/aggregate'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'applyDatabaseSchemaBundle sends POST /{version}/database/schemas/apply-bundle',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.applyDatabaseSchemaBundle(
          query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/schemas/apply-bundle'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'changeRecordResponsibility sends PUT /{version}/database/collections/{collectionName}/{id}/responsibility',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.changeRecordResponsibility(
          collectionName: 'collectionName_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(
          req.url.path,
          equals(
              '/v3/database/collections/collectionName_1/id_1/responsibility'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'countRecords sends GET /{version}/database/collections/{collectionName}/count',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .countRecords(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/count'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'deleteDatabaseAggregate sends DELETE /{version}/database/aggregates/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteDatabaseAggregate(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/aggregates/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteDatabaseIntegration sends DELETE /{version}/database/integrations/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteDatabaseIntegration(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/integrations/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('deleteDatabaseSchema sends DELETE /{version}/database/schemas/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteDatabaseSchema(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/schemas/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteDatabaseTaxonomy sends DELETE /{version}/database/taxonomies/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteDatabaseTaxonomy(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/taxonomies/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteDatabaseTaxonomyTerm sends DELETE /{version}/database/taxonomies/{taxonomyId}/terms/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteDatabaseTaxonomyTerm(
          taxonomyId: 'taxonomyId_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyId_1/terms/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteManyDatabaseTaxonomyTerms sends DELETE /{version}/database/taxonomies/{taxonomyId}/terms/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteManyDatabaseTaxonomyTerms(
          taxonomyId: 'taxonomyId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyId_1/terms/many'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteManyRecords sends DELETE /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteManyRecords(
          collectionName: 'collectionName_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/many'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteRecord sends DELETE /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteRecord(
          collectionName: 'collectionName_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'deleteSchemaTrigger sends DELETE /{version}/database/schemas/triggers/{triggerId}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteSchemaTrigger(
          triggerId: 'triggerId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/schemas/triggers/triggerId_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('disableDatabase sends PUT /{version}/database/disable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.disableDatabase(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/disable'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'disableDatabaseIntegration sends PUT /{version}/database/integrations/{id}/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.disableDatabaseIntegration(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/integrations/id_1/disable'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'disableSchemaTrigger sends PATCH /{version}/database/schemas/triggers/{triggerId}/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.disableSchemaTrigger(
          triggerId: 'triggerId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PATCH'));
      expect(req.url.path,
          equals('/v3/database/schemas/triggers/triggerId_1/disable'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'discardDatabaseSchemaDraft sends DELETE /{version}/database/schemas/{id}/draft',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.discardDatabaseSchemaDraft(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/draft'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'distinctRecordValues sends GET /{version}/database/collections/{collectionName}/distinct',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.distinctRecordValues(
          collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/distinct'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('enableDatabase sends PUT /{version}/database/enable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.enableDatabase(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/enable'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'enableDatabaseIntegration sends PUT /{version}/database/integrations/{id}/enable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.enableDatabaseIntegration(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/integrations/id_1/enable'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'enableSchemaTrigger sends PATCH /{version}/database/schemas/triggers/{triggerId}/enable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.enableSchemaTrigger(
          triggerId: 'triggerId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PATCH'));
      expect(req.url.path,
          equals('/v3/database/schemas/triggers/triggerId_1/enable'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'executeRecordsAggregate sends POST /{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.executeRecordsAggregate(
          collectionName: 'collectionName_1',
          aggregateId: 'aggregateId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(
          req.url.path,
          equals(
              '/v3/database/collections/collectionName_1/aggregates/aggregateId_1/execute'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'findOneRecord sends GET /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findOneRecord(
          collectionName: 'collectionName_1', id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findRecords sends GET /{version}/database/collections/{collectionName}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .findRecords(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/collections/collectionName_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getAllowedFlexTiers sends GET /{version}/database/integrations/flex-tiers',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getAllowedFlexTiers(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/integrations/flex-tiers'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getCollectionIndexes sends GET /{version}/database/collections/{collectionName}/indexes',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getCollectionIndexes(
          collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/indexes'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseAggregate sends GET /{version}/database/aggregates/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseAggregate(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/aggregates/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseAggregates sends GET /{version}/database/aggregates',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseAggregates(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/aggregates'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseIntegration sends GET /{version}/database/integrations/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseIntegration(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/integrations/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseIntegrations sends GET /{version}/database/integrations',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseIntegrations(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/integrations'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseMergedTermTree sends GET /{version}/database/taxonomies/{taxonomyName}/merged-tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseMergedTermTree(
          taxonomyName: 'taxonomyName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyName_1/merged-tree'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseSchema sends GET /{version}/database/schemas/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseSchema(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseSchemaDraft sends GET /{version}/database/schemas/{id}/draft',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseSchemaDraft(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/draft'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseSchemaListSettings sends GET /{version}/database/schemas/{id}/list-settings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseSchemaListSettings(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/list-settings'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseSchemaVersionDiff sends GET /{version}/database/schemas/{id}/versions/diff',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseSchemaVersionDiff(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/versions/diff'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseSchemaVersions sends GET /{version}/database/schemas/{id}/versions',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseSchemaVersions(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/versions'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseSchemas sends GET /{version}/database/schemas', () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseSchemas(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseTaxonomies sends GET /{version}/database/taxonomies',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseTaxonomies(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/taxonomies'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getDatabaseTaxonomy sends GET /{version}/database/taxonomies/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getDatabaseTaxonomy(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/taxonomies/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseTaxonomyTerm sends GET /{version}/database/taxonomies/{taxonomyId}/terms/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseTaxonomyTerm(
          taxonomyId: 'taxonomyId_1', id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyId_1/terms/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseTaxonomyTermTree sends GET /{version}/database/taxonomies/{taxonomyName}/terms/tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseTaxonomyTermTree(
          taxonomyName: 'taxonomyName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyName_1/terms/tree'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'getDatabaseTaxonomyTree sends GET /{version}/database/taxonomies/tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseTaxonomyTree(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/taxonomies/tree'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getSchemaTrigger sends GET /{version}/database/schemas/triggers/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .getSchemaTrigger(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/triggers/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('getSchemaTriggers sends GET /{version}/database/schemas/triggers',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getSchemaTriggers(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas/triggers'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'insertManyRecords sends POST /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.insertManyRecords(
          collectionName: 'collectionName_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/many'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'insertRecord sends POST /{version}/database/collections/{collectionName}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.insertRecord(
          collectionName: 'collectionName_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/collections/collectionName_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'publishDatabaseSchema sends POST /{version}/database/schemas/{id}/publish',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.publishDatabaseSchema(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/publish'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'renameDatabaseSchema sends PUT /{version}/database/schemas/{id}/rename',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.renameDatabaseSchema(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/rename'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'replaceRecord sends PUT /{version}/database/collections/{collectionName}/{id}/replace',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.replaceRecord(
          collectionName: 'collectionName_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/id_1/replace'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'revealManagedFlexConnectionString sends GET /{version}/database/integrations/{id}/connection-string',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .revealManagedFlexConnectionString(id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/integrations/id_1/connection-string'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('saveDatabaseAggregate sends POST /{version}/database/aggregates',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .saveDatabaseAggregate(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/aggregates'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('saveDatabaseIntegration sends POST /{version}/database/integrations',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .saveDatabaseIntegration(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/integrations'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('saveDatabaseSchema sends POST /{version}/database/schemas', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .saveDatabaseSchema(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/schemas'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('saveDatabaseTaxonomy sends POST /{version}/database/taxonomies',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .saveDatabaseTaxonomy(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/taxonomies'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'saveDatabaseTaxonomyTerm sends POST /{version}/database/taxonomies/{taxonomyId}/terms',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.saveDatabaseTaxonomyTerm(
          taxonomyId: 'taxonomyId_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(
          req.url.path, equals('/v3/database/taxonomies/taxonomyId_1/terms'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('saveSchemaTrigger sends POST /{version}/database/schemas/triggers',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .saveSchemaTrigger(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/schemas/triggers'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'seedCollectionRecords sends POST /{version}/database/collections/seed',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .seedCollectionRecords(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/collections/seed'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'setDatabaseIntegrationAsDefault sends PUT /{version}/database/integrations/{id}/default',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.setDatabaseIntegrationAsDefault(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/integrations/id_1/default'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test('testDatabaseAggregate sends POST /{version}/database/aggregates/test',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .testDatabaseAggregate(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/aggregates/test'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'testDatabaseIntegration sends POST /{version}/database/integrations/test',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .testDatabaseIntegration(query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v3/database/integrations/test'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateDatabaseSchemaDraft sends PUT /{version}/database/schemas/{id}/draft',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateDatabaseSchemaDraft(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/draft'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateDatabaseSchemaEmbed sends PUT /{version}/database/schemas/{id}/embed',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateDatabaseSchemaEmbed(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/embed'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateDatabaseSchemaListSettings sends PUT /{version}/database/schemas/{id}/list-settings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateDatabaseSchemaListSettings(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/list-settings'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateDatabaseSchemaSettings sends PUT /{version}/database/schemas/{id}/settings',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateDatabaseSchemaSettings(
          id: 'id_1', query: {'q': 'v'}, body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/schemas/id_1/settings'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateDatabaseTaxonomyTerm sends PUT /{version}/database/taxonomies/{taxonomyId}/terms/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateDatabaseTaxonomyTerm(
          taxonomyId: 'taxonomyId_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyId_1/terms/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateManyRecords sends PUT /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateManyRecords(
          collectionName: 'collectionName_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/many'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
    test(
        'updateOneRecord sends PUT /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateOneRecord(
          collectionName: 'collectionName_1',
          id: 'id_1',
          query: {'q': 'v'},
          body: {'probe': 'value'});
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
      expect(req.body, contains('"probe":"value"'));
    });
  });

  group('hub.database — records', () {
    test('findRecords returns the decoded response', () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 200,
            headers: {'content-type': 'application/json'},
            body: '{"result":"[{\\"_id\\":\\"r1\\"}]","totalCount":1}',
          ));
      final res = await _client(driver).database.findRecords(
        collectionName: 'orders',
        query: {'pageSize': 10, 'pageNumber': 0},
      );
      expect(res, isA<Map>());
      expect((res as Map)['totalCount'], equals(1));
      expect(driver.lastRequest!.url.queryParameters,
          equals({'pageSize': '10', 'pageNumber': '0'}));
    });

    test('a collection name with a space is URL-encoded in the path', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .findOneRecord(collectionName: 'my orders', id: 'r 1');
      expect(driver.lastRequest!.url.toString(),
          endsWith('/v3/database/collections/my%20orders/r%201'));
    });

    test('insertRecord sends the document as the JSON body', () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.insertRecord(
        collectionName: 'orders',
        body: {
          'document': '{"title":"First"}',
          'waitForFileUpload': false,
        },
      );
      expect(driver.lastRequest!.method, equals('POST'));
      expect(
          driver.lastRequest!.body,
          equals(
              '{"document":"{\\"title\\":\\"First\\"}","waitForFileUpload":false}'));
    });

    test('a refused call throws NorbixError', () async {
      final driver = FakeHttpDriver((_) => const HttpDriverResponse(
            statusCode: 404,
            headers: {'content-type': 'application/json'},
            body:
                '{"responseStatus":{"errorCode":"NotFound","message":"Record not found"}}',
          ));
      await expectLater(
        _client(driver)
            .database
            .findOneRecord(collectionName: 'orders', id: 'x'),
        throwsA(isA<NorbixError>()),
      );
    });
  });
}
