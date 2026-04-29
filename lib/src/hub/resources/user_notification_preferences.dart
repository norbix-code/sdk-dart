// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Per-user notification opt-ins.
class UserNotificationPreferencesResource extends Resource {
  UserNotificationPreferencesResource(super.transport);

  /// `GET /{version}/notifications/user/preferences`
  Future<Object?> getUserNotificationPreferences({ Map<String, Object?>? query, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/user/preferences',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `PUT /{version}/notifications/user/preferences`
  Future<Object?> updateUserNotificationsPreferences({ Map<String, Object?>? query, Object? body, Map<String, String>? headers }) {
    return transport.send(
      route: '/{version}/notifications/user/preferences',
      method: 'PUT',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }
}
