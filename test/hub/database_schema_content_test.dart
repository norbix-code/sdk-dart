/// The Database schema-content gateway contract (audit/schema-content), seen
/// from the Dart SDK: `expandReferences` on the record reads with the typed
/// `{ id, display }` result, `arrayFilters` on the record updates, nested
/// documents through dotted paths, files by id, and the new error codes.
///
/// Every test uses a fake driver; no real server is contacted.
library;

import 'dart:convert';

import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

NorbixHub _hub(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

NorbixApi _api(FakeHttpDriver driver) => NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

FakeHttpDriver _answering(Map<String, Object?> body, {int status = 200}) =>
    FakeHttpDriver((_) => HttpDriverResponse(
          statusCode: status,
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

Map<String, dynamic> _bodyOf(FakeHttpDriver driver) =>
    jsonDecode(driver.lastRequest!.body!) as Map<String, dynamic>;

void main() {
  group('expandReferences — the flag on every record read', () {
    test('api.find sends expandReferences=true as a query parameter', () async {
      final driver = FakeHttpDriver();
      await _api(driver).database.find(
            collectionName: 'orders',
            query: {'pageSize': 20},
            expandReferences: true,
          );
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/database/collections/orders'));
      expect(req.url.queryParameters['expandReferences'], equals('true'));
      expect(req.url.queryParameters['pageSize'], equals('20'));
    });

    test('api.findOne and api.findOwn carry the flag the same way', () async {
      final driver = FakeHttpDriver();
      final api = _api(driver);

      await api.database.findOne(
          collectionName: 'orders', id: 'rec_1', expandReferences: true);
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/rec_1'));
      expect(driver.lastRequest!.url.queryParameters['expandReferences'],
          equals('true'));

      await api.database
          .findOwn(collectionName: 'orders', expandReferences: true);
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/own'));
      expect(driver.lastRequest!.url.queryParameters['expandReferences'],
          equals('true'));
    });

    test('hub.findRecords and hub.findOneRecord carry the flag', () async {
      final driver = FakeHttpDriver();
      final hub = _hub(driver);

      await hub.database
          .findRecords(collectionName: 'orders', expandReferences: true);
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders'));
      expect(driver.lastRequest!.url.queryParameters['expandReferences'],
          equals('true'));

      await hub.database.findOneRecord(
          collectionName: 'orders', id: 'rec_1', expandReferences: true);
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/rec_1'));
      expect(driver.lastRequest!.url.queryParameters['expandReferences'],
          equals('true'));
    });

    test('left unset, the query is exactly what the caller sent', () async {
      final driver = FakeHttpDriver();
      await _api(driver)
          .database
          .find(collectionName: 'orders', query: {'pageSize': 5});
      expect(
          driver.lastRequest!.url.queryParameters, equals({'pageSize': '5'}));

      await _api(driver).database.find(collectionName: 'orders');
      expect(driver.lastRequest!.url.queryParameters, isEmpty);
    });

    test('expandReferences: false is sent explicitly', () async {
      final driver = FakeHttpDriver();
      await _hub(driver)
          .database
          .findRecords(collectionName: 'orders', expandReferences: false);
      expect(driver.lastRequest!.url.queryParameters['expandReferences'],
          equals('false'));
    });
  });

  group('ExpandedReference — the typed { id, display } result', () {
    // The record as the gateway returns it inside `result` (a JSON string per
    // record), read with expandReferences: true.
    const record = {
      '_id': 'rec_1',
      'customer': {'id': 'usr_1', 'display': 'Jane Doe'},
      'assignee': {'id': 'pr_p_nr_admin', 'display': 'Admin'},
      'tags': [
        {
          'id': '6650',
          'display': {'en': 'News', 'lt': 'Naujienos'}
        },
        {'id': '6651', 'display': null},
      ],
      'address': {
        'region': {'id': 'term_9', 'display': 'north'},
      },
      'lines': [
        {
          'sku': 'A-1',
          'product': {'id': 'rec_p1', 'display': 'Lamp'},
        },
      ],
      'plain': 'usr_2',
    };

    test('a single reference reads from the decoded record', () async {
      final driver = _answering({
        'result': [jsonEncode(record)],
        'totalCount': 1,
      });
      final res = await _api(driver)
          .database
          .find(collectionName: 'orders', expandReferences: true) as Map;
      final first = jsonDecode((res['result'] as List).first as String)
          as Map<String, dynamic>;

      final customer = ExpandedReference.maybeFrom(first['customer'])!;
      expect(customer.id, equals('usr_1'));
      expect(customer.display, equals('Jane Doe'));
      expect(customer.displayText(), equals('Jane Doe'));
      expect(customer.isMissing, isFalse);
    });

    test('a multiple reference reads as a list; a gone target is missing', () {
      final tags = ExpandedReference.listFrom(record['tags']);
      expect(tags, hasLength(2));
      expect(tags[0].id, equals('6650'));
      expect(tags[0].displayText(language: 'lt'), equals('Naujienos'));
      expect(tags[0].displayText(language: 'de'), equals('News'));
      expect(tags[0].displayText(), equals('News'));
      expect(tags[1].id, equals('6651'));
      expect(tags[1].isMissing, isTrue);
      expect(tags[1].displayText(), isNull);
    });

    test('a reference inside a nested form or an array item reads in place',
        () {
      final address = record['address'] as Map<String, Object?>;
      expect(ExpandedReference.maybeFrom(address['region'])!.displayText(),
          equals('north'));
      final line = (record['lines'] as List).first as Map<String, Object?>;
      expect(
          ExpandedReference.maybeFrom(line['product'])!.id, equals('rec_p1'));
    });

    test('a stored id (no expansion) is not an expanded reference', () {
      expect(ExpandedReference.maybeFrom(record['plain']), isNull);
      expect(ExpandedReference.maybeFrom(null), isNull);
      expect(ExpandedReference.listFrom(['usr_1', 'usr_2']), isEmpty);
      expect(ExpandedReference.listFrom(record['customer']), hasLength(1));
    });

    test('a non-text display value keeps its JSON form', () {
      final ref = ExpandedReference.fromJson({'id': 'rec_2', 'display': 42});
      expect(ref.displayText(), equals('42'));
      expect(ref.toJson(), equals({'id': 'rec_2', 'display': 42}));
    });
  });

  group('arrayFilters — nested documents on update', () {
    test('api.updateOne adds arrayFilters to the body as a JSON string',
        () async {
      final driver = FakeHttpDriver();
      await _api(driver).database.updateOne(
        collectionName: 'orders',
        id: 'rec_1',
        body: {'update': '{"lines.\$[line].qty":3}'},
        arrayFilters: [
          {'line.sku': 'A-1'},
        ],
      );
      final req = driver.lastRequest!;
      expect(req.method, equals('PUT'));
      expect(req.url.path, equals('/v3/database/collections/orders/rec_1'));
      final body = _bodyOf(driver);
      expect(body['update'], equals('{"lines.\$[line].qty":3}'));
      expect(body['arrayFilters'], equals('[{"line.sku":"A-1"}]'));
    });

    test('api.updateMany: a string is sent as is', () async {
      final driver = FakeHttpDriver();
      await _api(driver).database.updateMany(
            collectionName: 'orders',
            body: {'filter': '{}', 'update': '{"lines.\$[].qty":1}'},
            arrayFilters: '[{"\$or":[{"line.sku":"A"},{"line.sku":"B"}]}]',
          );
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/many'));
      expect(_bodyOf(driver)['arrayFilters'],
          equals('[{"\$or":[{"line.sku":"A"},{"line.sku":"B"}]}]'));
    });

    test('hub.updateOneRecord and hub.updateManyRecords do the same', () async {
      final driver = FakeHttpDriver();
      final hub = _hub(driver);

      await hub.database.updateOneRecord(
        collectionName: 'orders',
        id: 'rec_1',
        body: {'update': '{"lines.\$[line].qty":3}'},
        arrayFilters: [
          {'line.sku': 'A-1'},
        ],
      );
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/rec_1'));
      expect(_bodyOf(driver)['arrayFilters'], equals('[{"line.sku":"A-1"}]'));

      await hub.database.updateManyRecords(
        collectionName: 'orders',
        body: {
          'filter': '{"status":"open"}',
          'update': '{"lines.\$[l].done":true}'
        },
        arrayFilters: [
          {'l.done': false},
        ],
      );
      expect(driver.lastRequest!.url.path,
          equals('/v3/database/collections/orders/many'));
      expect(_bodyOf(driver)['arrayFilters'], equals('[{"l.done":false}]'));
    });

    test('a dotted path update needs no filters and the body is untouched',
        () async {
      final driver = FakeHttpDriver();
      await _api(driver).database.updateOne(
        collectionName: 'orders',
        id: 'rec_1',
        body: {'update': '{"address.city":"Vilnius","lines.2.qty":3}'},
      );
      expect(_bodyOf(driver),
          equals({'update': '{"address.city":"Vilnius","lines.2.qty":3}'}));
    });

    test('arrayFilters on a body that is not a map is an ArgumentError',
        () async {
      final driver = FakeHttpDriver();
      expect(
        () => _api(driver).database.updateOne(
          collectionName: 'orders',
          id: 'rec_1',
          body: 'not a map',
          arrayFilters: [
            {'line.sku': 'A-1'},
          ],
        ),
        throwsArgumentError,
      );
      expect(driver.requests, isEmpty);
    });
  });

  group('files by id', () {
    test('api.files.getFileById hits /files/{integration}/by-id/{id}',
        () async {
      final driver = _answering({
        'file': {'id': 'nbfl_1', 'fileName': 'a.pdf'},
        'isPublic': false,
        'publicUrl': null,
      });
      final res = await _api(driver)
          .files
          .getFileById(filesIntegrationId: 'nbin_1', id: 'nbfl_1') as Map;
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/files/nbin_1/by-id/nbfl_1'));
      expect((res['file'] as Map)['fileName'], equals('a.pdf'));
    });

    test('hub.files.getFileById sends the two values as query parameters',
        () async {
      final driver = FakeHttpDriver();
      await _hub(driver).files.getFileById(
          filesIntegrationId: 'nbin_1',
          id: '0f4b7e2a-3c1d-4e5f-8a9b-0c1d2e3f4a5b');
      final req = driver.lastRequest!;
      expect(req.method, equals('GET'));
      expect(req.url.path, equals('/v3/files/item/by-id'));
      expect(req.url.queryParameters['filesIntegrationId'], equals('nbin_1'));
      expect(req.url.queryParameters['id'],
          equals('0f4b7e2a-3c1d-4e5f-8a9b-0c1d2e3f4a5b'));
    });

    test('an unknown id is a 404 NorbixNotFoundError', () async {
      final driver = _answering(
        _refused('CM-ERRORS-FILES-003', 'File not found'),
        status: 404,
      );
      final err = await _errorOf(_api(driver)
          .files
          .getFileById(filesIntegrationId: 'nbin_1', id: 'nbfl_missing'));
      expect(err, isA<NorbixNotFoundError>());
      expect(err.httpStatus, equals(404));
    });
  });

  group('new error codes surface as NorbixError', () {
    test('CM-ERRORS-DATABASE-056: a linked source the caller may not read',
        () async {
      final driver = _answering(_refused(
        'CM-ERRORS-DATABASE-056',
        'You can read orders, but not the people it links to',
        {
          'SourceKind': 'user',
          'Source': 'users',
          'Fields': 'customer',
          'MissingPermissions': 'membership:read',
        },
      ));
      final err = await _errorOf(_api(driver)
          .database
          .find(collectionName: 'orders', expandReferences: true));
      expect(err.errorCode, equals('CM-ERRORS-DATABASE-056'));
      expect(err.errors.single.context['SourceKind'], equals('user'));
    });

    test('CM-ERRORS-DATABASE-046: a repeated entry in a unique list', () async {
      final driver = _answering(_refused(
        'CM-ERRORS-DATABASE-046',
        "Field 'tags' is invalid: repeated entry",
        {'FieldName': 'tags', 'Keyword': 'uniqueItems'},
      ));
      final err = await _errorOf(_hub(driver).database.insertRecord(
          collectionName: 'orders', body: {'document': '{"tags":["a","a"]}'}));
      expect(err.errorCode, equals('CM-ERRORS-DATABASE-046'));
      expect(err.errors.single.context['Keyword'], equals('uniqueItems'));
    });

    test('CM-ERRORS-DATABASE-053: a nested collection reference that is gone',
        () async {
      final driver = _answering(_refused(
        'CM-ERRORS-DATABASE-053',
        "Field 'lines[1].product' is invalid: record rec_x not found",
        {
          'FieldName': 'lines[1].product',
          'Keyword': 'reference',
          'MissingId': 'rec_x',
        },
      ));
      final err = await _errorOf(_api(driver).database.insertOne(
          collectionName: 'orders',
          body: {'document': '{"lines":[{},{"product":"rec_x"}]}'}));
      expect(err.errorCode, equals('CM-ERRORS-DATABASE-053'));
      expect(
          err.errors.single.context['FieldName'], equals('lines[1].product'));
    });

    test('CM-ERRORS-SCHEMA-036: a schema nested too deep', () async {
      final driver = _answering(_refused(
          'CM-ERRORS-SCHEMA-036', 'Nesting deeper than 5 levels is refused'));
      final err = await _errorOf(_hub(driver)
          .database
          .saveDatabaseSchema(body: {'collectionName': 'deep'}));
      expect(err.errorCode, equals('CM-ERRORS-SCHEMA-036'));
    });

    test('CM-ERRORS-TAXONOMIES-012: an explicit slug another term has',
        () async {
      final driver = _answering(_refused(
          'CM-ERRORS-TAXONOMIES-012',
          "Slug 'news' is used by term 6650",
          {'Slug': 'news', 'OtherTermId': '6650'}));
      final err = await _errorOf(_hub(driver).database.saveDatabaseTaxonomyTerm(
          taxonomyId: 'tax_1',
          body: {'document': '{"name":"News","slug":"news"}'}));
      expect(err.errorCode, equals('CM-ERRORS-TAXONOMIES-012'));
    });
  });

  group('term slug on read', () {
    test('findTerms rows carry slug (null for a legacy term)', () async {
      final driver = _answering({
        'result': [
          {'id': '6650', 'name': 'News', 'slug': 'news'},
          {'id': '6651', 'name': 'Old', 'slug': null},
        ],
      });
      final res =
          await _api(driver).database.findTerms(taxonomyName: 'topics') as Map;
      final rows = res['result'] as List;
      expect((rows[0] as Map)['slug'], equals('news'));
      expect((rows[1] as Map)['slug'], isNull);
    });
  });
}
