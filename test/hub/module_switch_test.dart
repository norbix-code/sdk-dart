import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Every Hub module on / off switch (`/{version}/<module>/enable|disable`)
/// is a PUT. The gateway moved them from GET to PUT; the old GET paths are
/// a hidden, deprecated alias that is removed after 0.2. One test per
/// method, against the fake driver (never a real server): verb and full URL.
NorbixHub _client(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

typedef _Call = Future<Object?> Function(NorbixHub hub);

void main() {
  final cases = <String, (String, _Call)>{
    'database.enableDatabase': (
      'database/enable',
      (h) => h.database.enableDatabase()
    ),
    'database.disableDatabase': (
      'database/disable',
      (h) => h.database.disableDatabase()
    ),
    'files.enableFiles': ('files/enable', (h) => h.files.enableFiles()),
    'files.disableFiles': ('files/disable', (h) => h.files.disableFiles()),
    'pushNotifications.enablePush': (
      'notifications/push/enable',
      (h) => h.pushNotifications.enablePush()
    ),
    'pushNotifications.disablePush': (
      'notifications/push/disable',
      (h) => h.pushNotifications.disablePush()
    ),
    'smsNotifications.enableSms': (
      'notifications/sms/enable',
      (h) => h.smsNotifications.enableSms()
    ),
    'smsNotifications.disableSms': (
      'notifications/sms/disable',
      (h) => h.smsNotifications.disableSms()
    ),
    'emailNotifications.enableEmail': (
      'notifications/email/enable',
      (h) => h.emailNotifications.enableEmail()
    ),
    'emailNotifications.disableEmail': (
      'notifications/email/disable',
      (h) => h.emailNotifications.disableEmail()
    ),
    'payments.enablePayments': (
      'payments/enable',
      (h) => h.payments.enablePayments()
    ),
    'payments.disablePayments': (
      'payments/disable',
      (h) => h.payments.disablePayments()
    ),
    'logs.enableLogging': ('logs/enable', (h) => h.logs.enableLogging()),
    'logs.disableLogging': ('logs/disable', (h) => h.logs.disableLogging()),
    'membership.enableMembership': (
      'membership/enable',
      (h) => h.membership.enableMembership()
    ),
    'membership.disableMembership': (
      'membership/disable',
      (h) => h.membership.disableMembership()
    ),
    'scheduler.enableScheduler': (
      'scheduler/enable',
      (h) => h.scheduler.enableScheduler()
    ),
    'scheduler.disableScheduler': (
      'scheduler/disable',
      (h) => h.scheduler.disableScheduler()
    ),
  };

  group('hub module on / off switches send PUT', () {
    cases.forEach((name, c) {
      final (path, call) = c;
      test('$name → PUT /v3/$path', () async {
        final driver = FakeHttpDriver();
        await call(_client(driver));

        expect(driver.lastRequest!.method, equals('PUT'));
        expect(
          driver.lastRequest!.url.toString(),
          equals('https://hub.norbix.ai/v3/$path'),
        );
      });
    });
  });
}
