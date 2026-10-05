import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// `hub.smsNotifications` — all 34 SMS Hub endpoints, one test per method,
/// against the fake driver (never a real server, never a real provider):
/// verb, full path with the ids substituted in the gateway's own spelling,
/// and the body for the writes that carry one.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  group('hub.smsNotifications — module', () {
    test('enableSms → GET /v1/notifications/sms/enable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.enableSms();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/enable'),
      );
    });

    test('disableSms → GET /v1/notifications/sms/disable', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.disableSms();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/disable'),
      );
    });

    test(
        'getSmsDisableDependencies → GET /v1/notifications/sms/disable-dependencies',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsDisableDependencies();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/disable-dependencies'),
      );
    });

    test('getSmsSettings → GET /v1/notifications/sms/settings', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsSettings();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/settings'),
      );
    });

    test('previewSmsNotification → GET /v1/notifications/sms/preview',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .previewSmsNotification(query: {'hash': 'abc.def'});

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/preview?hash=abc.def'),
      );
    });
  });

  group('hub.smsNotifications — integrations', () {
    test('getSmsIntegrations → GET /v1/notifications/sms/integrations',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsIntegrations();

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations'),
      );
    });

    test('getSmsIntegration → GET /v1/notifications/sms/integrations/nbin_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsIntegration(id: 'nbin_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/nbin_1'),
      );
    });

    test('saveSmsIntegration → POST /v1/notifications/sms/integrations',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.saveSmsIntegration(body: {
        'integration': {
          'smsType': 'Fake',
          'integrationName': 'sms-sdk-secondary-fake'
        }
      });

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations'),
      );
      expect(driver.lastRequest!.body, contains('"smsType":"Fake"'));
    });

    test('testSmsIntegration → POST /v1/notifications/sms/integrations/test',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.testSmsIntegration(
          body: {'integrationId': 'nbin_1', 'phoneNumber': '+37060000000'});

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/test'),
      );
      expect(driver.lastRequest!.body, contains('"integrationId":"nbin_1"'));
    });

    test(
        'confirmSmsIntegrationHumanDelivery → POST /v1/notifications/sms/integrations/confirm-human-delivery',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.confirmSmsIntegrationHumanDelivery(
          body: {'integrationId': 'nbin_1'});

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/confirm-human-delivery'),
      );
      expect(driver.lastRequest!.body, contains('"integrationId":"nbin_1"'));
    });

    test(
        'deleteSmsIntegration → DELETE /v1/notifications/sms/integrations/nbin_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.deleteSmsIntegration(id: 'nbin_1');

      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/nbin_1'),
      );
    });

    test(
        'setSmsIntegrationAsDefault → PUT /v1/notifications/sms/integrations/nbin_1/default',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .setSmsIntegrationAsDefault(id: 'nbin_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/nbin_1/default'),
      );
    });

    test(
        'enableSmsIntegration → PUT /v1/notifications/sms/integrations/nbin_1/enable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.enableSmsIntegration(id: 'nbin_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/nbin_1/enable'),
      );
    });

    test(
        'disableSmsIntegration → PUT /v1/notifications/sms/integrations/nbin_1/disable',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .disableSmsIntegration(id: 'nbin_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/integrations/nbin_1/disable'),
      );
    });
  });

  group('hub.smsNotifications — templates', () {
    test('getSmsTemplates → GET /v1/notifications/sms/templates', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsTemplates(query: {'pageSize': 20});

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates?pageSize=20'),
      );
    });

    test('getSmsTemplate → GET /v1/notifications/sms/templates/tpl_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsTemplate(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1'),
      );
    });

    test('createSmsTemplate → POST /v1/notifications/sms/templates', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.createSmsTemplate(body: {
        'name': 'sms-sdk-secondary-t1',
        'content': {'body': 'Hi @Model.FirstName'}
      });

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates'),
      );
      expect(
          driver.lastRequest!.body, contains('"name":"sms-sdk-secondary-t1"'));
    });

    test('updateSmsTemplate → PUT /v1/notifications/sms/templates', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.updateSmsTemplate(
          body: {'id': 'tpl_1', 'name': 'sms-sdk-secondary-t1'});

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates'),
      );
      expect(driver.lastRequest!.body, contains('"id":"tpl_1"'));
    });

    test('deleteSmsTemplate → DELETE /v1/notifications/sms/templates/tpl_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.deleteSmsTemplate(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1'),
      );
    });

    test(
        'archiveSmsTemplate → PUT /v1/notifications/sms/templates/tpl_1/archive',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.archiveSmsTemplate(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1/archive'),
      );
    });

    test(
        'unArchiveSmsTemplate → PUT /v1/notifications/sms/templates/tpl_1/unarchive',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.unArchiveSmsTemplate(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('PUT'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1/unarchive'),
      );
    });

    test('cloneSmsTemplate → POST /v1/notifications/sms/templates/tpl_1/clone',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.cloneSmsTemplate(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1/clone'),
      );
    });

    test(
        'getSmsMessageContentTokens → GET /v1/notifications/sms/templates/tpl_1/tokens',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsMessageContentTokens(id: 'tpl_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/tpl_1/tokens'),
      );
    });

    test('renderSms → POST /v1/notifications/sms/templates/render', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.renderSms(body: {
        'code': 'Hi @Model.FirstName',
        'tokens': [
          {'name': 'FirstName', 'value': 'Ada'}
        ]
      });

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/templates/render'),
      );
      expect(
          driver.lastRequest!.body, contains('"code":"Hi @Model.FirstName"'));
      expect(driver.lastRequest!.body, contains('"value":"Ada"'));
    });
  });

  group('hub.smsNotifications — campaigns', () {
    test('getSmsCampaigns → GET /v1/notifications/sms/campaigns', () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsCampaigns(query: {'templateId': 'tpl_1'});

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns?templateId=tpl_1'),
      );
    });

    test('createSmsCampaign → POST /v1/notifications/sms/campaigns', () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.createSmsCampaign(
          body: {'templateId': 'tpl_1', 'deliveryStrategy': 'AllUsers'});

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns'),
      );
      expect(driver.lastRequest!.body, contains('"templateId":"tpl_1"'));
    });

    test('getSmsCampaign → GET /v1/notifications/sms/campaigns/cmp_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsCampaign(id: 'cmp_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1'),
      );
    });

    test('deleteSmsCampaign → DELETE /v1/notifications/sms/campaigns/cmp_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.deleteSmsCampaign(id: 'cmp_1');

      expect(driver.lastRequest!.method, equals('DELETE'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1'),
      );
    });

    test('stopSmsCampaign → POST /v1/notifications/sms/campaigns/cmp_1/stop',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.stopSmsCampaign(id: 'cmp_1');

      expect(driver.lastRequest!.method, equals('POST'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/stop'),
      );
    });

    test(
        'getSmsCampaignStatistics → GET /v1/notifications/sms/campaigns/cmp_1/stats',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsCampaignStatistics(id: 'cmp_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/stats'),
      );
    });

    test(
        'getSmsCampaignBatches → GET /v1/notifications/sms/campaigns/cmp_1/batches',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsCampaignBatches(id: 'cmp_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/batches'),
      );
    });

    test(
        'getSmsCampaignBatchNotifications → GET /v1/notifications/sms/campaigns/cmp_1/batches/b_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsCampaignBatchNotifications(id: 'cmp_1', batchId: 'b_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/batches/b_1'),
      );
    });

    test(
        'getSmsCampaignBatchNotification → GET /v1/notifications/sms/campaigns/cmp_1/batches/b_1/n_1',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver).smsNotifications.getSmsCampaignBatchNotification(
          id: 'cmp_1', batchId: 'b_1', notificationId: 'n_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/batches/b_1/n_1'),
      );
    });

    test(
        'getSmsCampaignMessages → GET /v1/notifications/sms/campaigns/cmp_1/messages',
        () async {
      final driver = FakeHttpDriver();
      await _client(driver)
          .smsNotifications
          .getSmsCampaignMessages(campaignId: 'cmp_1');

      expect(driver.lastRequest!.method, equals('GET'));
      expect(
        driver.lastRequest!.url.toString(),
        endsWith('/v1/notifications/sms/campaigns/cmp_1/messages'),
      );
    });
  });

  test('a stop that the gateway refuses throws the typed error', () async {
    final driver = FakeHttpDriver((_) => const HttpDriverResponse(
          statusCode: 400,
          headers: {'content-type': 'application/json'},
          body: '{"responseStatus":{"errorCode":"CM-ERRORS-SMS-001",'
              '"message":"Campaign is already stopped"}}',
        ));

    await expectLater(
      _client(driver).smsNotifications.stopSmsCampaign(id: 'cmp_1'),
      throwsA(isA<NorbixError>()),
    );
  });
}
