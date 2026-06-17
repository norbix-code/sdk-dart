// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Notification contacts: identities, merge and marketing consent.
class ContactsResource extends Resource {
  ContactsResource(super.transport);

  /// `POST /{version}/notifications/contacts/{contactId}/identities`
  Future<Object?> addContactIdentity(
      {required Object contactId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts/{contactId}/identities',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `POST /{version}/notifications/contacts`
  Future<Object?> createContact(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/notifications/contacts/{contactId}`
  Future<Object?> deleteContact(
      {required Object contactId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts/{contactId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `GET /{version}/notifications/contacts`
  Future<Object?> getAllContacts(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/notifications/contacts/{contactId}`
  Future<Object?> getContact(
      {required Object contactId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts/{contactId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `POST /{version}/notifications/contacts/{contactId}/marketing-state/{channel}/consent`
  Future<Object?> grantContactConsent(
      {required Object contactId,
      required Object channel,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/contacts/{contactId}/marketing-state/{channel}/consent',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'channel': channel},
    );
  }

  /// `POST /{version}/notifications/contacts/merge`
  Future<Object?> mergeContacts(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/notifications/contacts/merge',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/notifications/contacts/{contactId}/identities/{identityId}/promote`
  Future<Object?> promoteContactIdentity(
      {required Object contactId,
      required Object identityId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/contacts/{contactId}/identities/{identityId}/promote',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'contactId': contactId,
        'identityId': identityId
      },
    );
  }

  /// `DELETE /{version}/notifications/contacts/{contactId}/identities/{identityId}`
  Future<Object?> removeContactIdentity(
      {required Object contactId,
      required Object identityId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/contacts/{contactId}/identities/{identityId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{
        'contactId': contactId,
        'identityId': identityId
      },
    );
  }

  /// `POST /{version}/notifications/contacts/{contactId}/marketing-state/{channel}/unsubscribe`
  Future<Object?> unsubscribeContact(
      {required Object contactId,
      required Object channel,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/notifications/contacts/{contactId}/marketing-state/{channel}/unsubscribe',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'channel': channel},
    );
  }
}
