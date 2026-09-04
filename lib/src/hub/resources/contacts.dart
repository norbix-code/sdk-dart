// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Membership contacts: identities, merge and marketing consent.
class ContactsResource extends Resource {
  ContactsResource(super.transport);

  /// `POST /{version}/membership/users/{contactId}/identities`
  Future<Object?> addContactIdentity(
      {required Object contactId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{contactId}/identities',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `POST /{version}/membership/users`
  Future<Object?> createContact(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `DELETE /{version}/membership/users/{contactId}`
  Future<Object?> deleteContact(
      {required Object contactId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{contactId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `GET /{version}/membership/users`
  Future<Object?> getAllContacts(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/membership/users/{contactId}`
  Future<Object?> getContact(
      {required Object contactId,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{contactId}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId},
    );
  }

  /// `POST /{version}/membership/users/merge`
  Future<Object?> mergeContacts(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/merge',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/membership/users/{contactId}/identities/{authId}/promote`
  Future<Object?> promoteContactIdentity(
      {required Object contactId,
      required Object authId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route:
          '/{version}/membership/users/{contactId}/identities/{authId}/promote',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'authId': authId},
    );
  }

  /// `DELETE /{version}/membership/users/{contactId}/identities/{authId}`
  Future<Object?> removeContactIdentity(
      {required Object contactId,
      required Object authId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/membership/users/{contactId}/identities/{authId}',
      method: 'DELETE',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'contactId': contactId, 'authId': authId},
    );
  }
}
