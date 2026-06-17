/// Closed catalog of event names a destination may subscribe to.
///
/// Source: gateway Domain trigger event-name value objects.
const List<String> kNorbixWebhookEventNames = [
  'database.record.inserted',
  'database.record.updated',
  'database.record.deleted',
  'database.record.replaced',
  'database.record.responsibilityChanged',
  'database.records.inserted',
  'database.records.updated',
  'database.records.deleted',
  'membership.user.registered',
  'membership.user.invited',
  'membership.user.verified',
  'membership.user.updated',
  'membership.user.deleted',
  'membership.user.blocked',
  'membership.user.reactivated',
  'files.file.uploaded',
  'files.file.deleted',
];

/// Named event constants — use these instead of raw strings.
///
/// ```dart
/// receiver.on(NorbixWebhookEvents.membershipUserRegistered, (user, event) {});
/// ```
abstract final class NorbixWebhookEvents {
  // database
  static const databaseRecordInserted = 'database.record.inserted';
  static const databaseRecordUpdated = 'database.record.updated';
  static const databaseRecordDeleted = 'database.record.deleted';
  static const databaseRecordReplaced = 'database.record.replaced';
  static const databaseRecordResponsibilityChanged =
      'database.record.responsibilityChanged';
  static const databaseRecordsInserted = 'database.records.inserted';
  static const databaseRecordsUpdated = 'database.records.updated';
  static const databaseRecordsDeleted = 'database.records.deleted';

  // membership
  static const membershipUserRegistered = 'membership.user.registered';
  static const membershipUserInvited = 'membership.user.invited';
  static const membershipUserVerified = 'membership.user.verified';
  static const membershipUserUpdated = 'membership.user.updated';
  static const membershipUserDeleted = 'membership.user.deleted';
  static const membershipUserBlocked = 'membership.user.blocked';
  static const membershipUserReactivated = 'membership.user.reactivated';

  // files
  static const filesFileUploaded = 'files.file.uploaded';
  static const filesFileDeleted = 'files.file.deleted';
}
