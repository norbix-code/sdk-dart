import 'dart:convert';

/// Helpers the record read / write methods share. Internal — not exported.

/// Adds `expandReferences` to the query of a record read when the caller set
/// the flag. A `null` flag leaves the query untouched, so the response stays
/// byte-for-byte what it was.
Map<String, Object?>? withExpandReferences(
  Map<String, Object?>? query,
  bool? expandReferences,
) {
  if (expandReferences == null) return query;
  return <String, Object?>{...?query, 'expandReferences': expandReferences};
}

/// Adds `arrayFilters` to the body of a record update. The gateway takes the
/// filters as one JSON string (a MongoDB extended-JSON array of filter
/// documents), so a Dart list is encoded here; a string is sent as is.
///
/// Throws an [ArgumentError] when there is a value to add but the body is
/// not a map — the SDK cannot put a member into a body it does not know the
/// shape of.
Object? withArrayFilters(Object? body, Object? arrayFilters) {
  if (arrayFilters == null) return body;
  final encoded =
      arrayFilters is String ? arrayFilters : jsonEncode(arrayFilters);
  if (body == null) return <String, Object?>{'arrayFilters': encoded};
  if (body is Map) {
    return <String, Object?>{
      ...Map<String, Object?>.from(body),
      'arrayFilters': encoded,
    };
  }
  throw ArgumentError.value(
    body,
    'body',
    'arrayFilters can only be added to a map body '
        '(the update request as a map); got ${body.runtimeType}',
  );
}
