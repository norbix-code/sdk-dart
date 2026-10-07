import 'package:norbix/norbix_api.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixApi _client(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('api.database — every method sends its verb and route', () {
    test(
        'aggregate sends POST /{version}/database/collections/{collectionName}/aggregate',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.aggregate(
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
        'changeResponsibility sends PUT /{version}/database/collections/{collectionName}/{id}/responsibility',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.changeResponsibility(
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
        'count sends GET /{version}/database/collections/{collectionName}/count',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .count(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/count'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'deleteMany sends DELETE /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteMany(
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
        'deleteOne sends DELETE /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.deleteOne(
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
        'distinct sends GET /{version}/database/collections/{collectionName}/distinct',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .distinct(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/distinct'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'executeAggregate sends POST /{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.executeAggregate(
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
    test('find sends GET /{version}/database/collections/{collectionName}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .find(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/collections/collectionName_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findOne sends GET /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findOne(
          collectionName: 'collectionName_1', id: 'id_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/id_1'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findTerms sends GET /{version}/database/taxonomies/{taxonomyName}/terms',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .findTerms(taxonomyName: 'taxonomyName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(
          req.url.path, equals('/v3/database/taxonomies/taxonomyName_1/terms'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findTermsChildren sends GET /{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findTermsChildren(
          taxonomyName: 'taxonomyName_1',
          parentId: 'parentId_1',
          query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(
          req.url.path,
          equals(
              '/v3/database/taxonomies/taxonomyName_1/terms/parentId_1/children'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findTermTree sends GET /{version}/database/taxonomies/{taxonomyName}/terms/tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .findTermTree(taxonomyName: 'taxonomyName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyName_1/terms/tree'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test('findTaxonomyTree sends GET /{version}/database/taxonomies/tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findTaxonomyTree(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/taxonomies/tree'));
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
    test('getDatabaseSchemas sends GET /{version}/database/schemas', () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.getDatabaseSchemas(query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/schemas'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'insertMany sends POST /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.insertMany(
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
        'insertOne sends POST /{version}/database/collections/{collectionName}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.insertOne(
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
        'replaceOne sends PUT /{version}/database/collections/{collectionName}/{id}/replace',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.replaceOne(
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
        'updateMany sends PUT /{version}/database/collections/{collectionName}/many',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateMany(
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
        'updateOne sends PUT /{version}/database/collections/{collectionName}/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.updateOne(
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
    test(
        'findOwn sends GET /{version}/database/collections/{collectionName}/own',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .database
          .findOwn(collectionName: 'collectionName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/collections/collectionName_1/own'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
    test(
        'findMergedTermTree sends GET /{version}/database/taxonomies/{taxonomyName}/merged-tree',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findMergedTermTree(
          taxonomyName: 'taxonomyName_1', query: {'q': 'v'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path,
          equals('/v3/database/taxonomies/taxonomyName_1/merged-tree'));
      expect(req.url.queryParameters['q'], equals('v'));
    });
  });

  group('api.database — taxonomy trees', () {
    test('findMergedTermTree passes the integration id as a query value',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).database.findMergedTermTree(
        taxonomyName: 'services',
        query: {'databaseIntegrationId': 'int_1'},
      );
      expect(
          driver.lastRequest!.url.toString(),
          endsWith(
              '/v3/database/taxonomies/services/merged-tree?databaseIntegrationId=int_1'));
    });
  });
}
