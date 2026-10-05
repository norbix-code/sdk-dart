/// The Database "last wave" gateway contract (refactoringV2), seen from the
/// Dart SDK: collection imports, the empty-filter flag `allRecords`, the
/// per-env schema triggers and the new database error codes.
///
/// Every test uses a fake driver; no real server is contacted.
library;

import 'dart:convert';

import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _hub(FakeHttpDriver driver, {String env = 'PROD'}) => NorbixHub(
      config:
          NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k', env: env),
      driver: driver,
    );

NorbixApi _api(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _answering(Map<String, Object?> body) =>
    FakeHttpDriver((_) => HttpDriverResponse(
          statusCode: 200,
          headers: const {'content-type': 'application/json'},
          body: jsonEncode(body),
        ));

Map<String, Object?> _refused(String code, String message,
        [Map<String, Object?> context = const {}]) =>
    {
      'responseStatus': {
        'isSuccess': false,
        'errors': [
          {'errorCode': code, 'message': message, 'context': context},
        ],
      },
    };

Future<NorbixError> _errorOf(Future<Object?> call) => call.then<NorbixError>(
    (_) => throw StateError('the call should have failed'),
    onError: (Object e) => e as NorbixError);

void main() {
  group('hub.database — collection imports', () {
    test(
        'requestImportUploadUrl sends POST /{version}/database/imports/upload-url',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.requestImportUploadUrl(
          body: {'fileName': 'cars.csv', 'contentType': 'text/csv'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v1/database/imports/upload-url'));
      expect(jsonDecode(req.body!),
          equals({'fileName': 'cars.csv', 'contentType': 'text/csv'}));
    });

    test('analyzeImportFile sends POST /{version}/database/imports/analyze',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.analyzeImportFile(body: {'fileKey': 'k_1'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v1/database/imports/analyze'));
      expect(jsonDecode(req.body!), equals({'fileKey': 'k_1'}));
    });

    test('createCollectionImport sends POST /{version}/database/imports',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.createCollectionImport(
          body: {'collectionName': 'cars', 'fileKey': 'k_1'});
      final req = driver.lastRequest!;
      expect(req.method, equals('POST'));
      expect(req.url.path, equals('/v1/database/imports'));
      expect(jsonDecode(req.body!),
          equals({'collectionName': 'cars', 'fileKey': 'k_1'}));
    });

    test('getCollectionImports sends GET /{version}/database/imports',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver)
          .database
          .getCollectionImports(query: {'pageSize': 10, 'pageNumber': 0});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v1/database/imports'));
      expect(req.url.queryParameters,
          equals({'pageSize': '10', 'pageNumber': '0'}));
    });

    test('getCollectionImport sends GET /{version}/database/imports/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.getCollectionImport(id: 'imp_1');
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v1/database/imports/imp_1'));
    });

    test('deleteCollectionImport sends DELETE /{version}/database/imports/{id}',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.deleteCollectionImport(id: 'imp_1');
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v1/database/imports/imp_1'));
    });
  });

  group('empty filter needs allRecords', () {
    test('hub updateManyRecords sends allRecords with an empty filter',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.updateManyRecords(
          collectionName: 'cars',
          body: {
            'filter': '{}',
            'update': '{"sold":true}',
            'allRecords': true
          });
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v1/database/collections/cars/many'));
      expect(
          jsonDecode(req.body!),
          equals(
              {'filter': '{}', 'update': '{"sold":true}', 'allRecords': true}));
    });

    test('hub deleteManyRecords sends allRecords with an empty filter',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.deleteManyRecords(
          collectionName: 'cars', body: {'filter': '{}', 'allRecords': true});
      final req = driver.lastRequest!;
      expect(req.method, equals('DELETE'));
      expect(req.url.path, equals('/v1/database/collections/cars/many'));
      expect(
          jsonDecode(req.body!), equals({'filter': '{}', 'allRecords': true}));
    });

    test('api updateMany and deleteMany send allRecords', () async {
      final driver = FakeHttpDriver();
      final api = _api(driver);
      await api.database.updateMany(collectionName: 'cars', body: {
        'filter': '{}',
        'update': '{"sold":true}',
        'allRecords': true
      });
      await api.database.deleteMany(
          collectionName: 'cars', body: {'filter': '{}', 'allRecords': true});
      expect(
          driver.requests.map((r) => '${r.method} ${r.url.path}').toList(),
          equals([
            'PUT /v1/database/collections/cars/many',
            'DELETE /v1/database/collections/cars/many',
          ]));
      expect(jsonDecode(driver.requests[0].body!)['allRecords'], isTrue);
      expect(jsonDecode(driver.requests[1].body!)['allRecords'], isTrue);
    });

    test('an empty filter without allRecords fails with CM-ERRORS-DATABASE-037',
        () async {
      final driver = _answering(_refused('CM-ERRORS-DATABASE-037',
          'An empty filter matches every record. Set AllRecords to true.'));
      final error = await _errorOf(_api(driver)
          .database
          .deleteMany(collectionName: 'cars', body: {'filter': '{}'}));
      expect(error.errorCode, equals('CM-ERRORS-DATABASE-037'));
      expect(error.httpStatus, equals(200));
    });
  });

  group('new record error codes surface as NorbixError', () {
    test(r'an update with $ operators fails with CM-ERRORS-DATABASE-035',
        () async {
      final driver = _answering(_refused('CM-ERRORS-DATABASE-035',
          r'Update operators such as $inc are not allowed.'));
      final error = await _errorOf(_hub(driver).database.updateOneRecord(
          collectionName: 'cars',
          id: 'r_1',
          body: {'update': r'{"$inc":{"n":1}}'}));
      expect(error.errorCode, equals('CM-ERRORS-DATABASE-035'));
    });

    test(
        'a broken insert-many document fails with CM-ERRORS-DATABASE-036 and its index',
        () async {
      final driver = _answering(_refused(
          'CM-ERRORS-DATABASE-036', 'Invalid record document', {'Index': 1}));
      final error = await _errorOf(
          _api(driver).database.insertMany(collectionName: 'cars', body: {
        'documents': ['{"a":1}', '{broken']
      }));
      expect(error.errorCode, equals('CM-ERRORS-DATABASE-036'));
      expect(error.errors.single.context, equals({'Index': 1}));
    });
  });

  group('schema triggers follow the client env', () {
    test('getSchemaTriggers sends the norbix-env header of the client',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver, env: 'TEST')
          .database
          .getSchemaTriggers(query: {'schemaId': 'sch_1'});
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.headers['norbix-env'], equals('TEST'));
    });

    test('a PROD client sends no norbix-env header', () async {
      final driver = FakeHttpDriver();
      await _hub(driver).database.enableSchemaTrigger(triggerId: 'trg_1');
      expect(driver.lastRequest!.headers.containsKey('norbix-env'), isFalse);
    });
  });
}
