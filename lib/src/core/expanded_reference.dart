/// A reference value as the gateway returns it when a record is read with
/// `expandReferences: true` (`find`, `findOne`, `findOwn` on the API client;
/// `findRecords`, `findOneRecord` on the Hub client).
///
/// Without the flag a reference field holds the stored id (or a list of ids
/// when the field is `multiple`). With the flag every reference value becomes
/// `{ "id": ..., "display": ... }`:
///
/// - `id` — the stored id, unchanged.
/// - `display` — the target's display value, chosen by the schema's
///   `displayField`: a user's `displayName` / `email` / …, a role's name, a
///   term's `title` (the term name — a string or a `{ lang: text }` map) or
///   `slug`, or the named field of the target record (whatever type it has).
///   `null` when the target is gone (a deleted record, term, user, …).
///
/// Nested forms and arrays are expanded in place, at any depth. The SDK does
/// not decode records into classes, so this helper reads one value out of the
/// decoded JSON:
///
/// ```dart
/// final res = await api.database.find(
///   collectionName: 'orders', expandReferences: true) as Map<String, dynamic>;
/// final first = jsonDecode(res['result'][0] as String) as Map<String, dynamic>;
/// final customer = ExpandedReference.maybeFrom(first['customer']);
/// print(customer?.displayText());              // "Jane Doe"
/// for (final tag in ExpandedReference.listFrom(first['tags'])) {
///   print('${tag.id}: ${tag.displayText(language: 'en') ?? 'missing'}');
/// }
/// ```
class ExpandedReference {
  /// The stored id of the target (a user id `usr_…`, a role view id, a term
  /// id, a record id, a file id).
  final String id;

  /// The target's display value, or `null` when the target does not exist
  /// any more.
  final Object? display;

  const ExpandedReference({required this.id, this.display});

  /// Builds one from a decoded `{ "id": ..., "display": ... }` object.
  factory ExpandedReference.fromJson(Map<String, dynamic> json) =>
      ExpandedReference(
        id: '${json['id']}',
        display: json['display'],
      );

  /// Reads a single reference out of a decoded record value. Answers `null`
  /// when the value is not an expanded reference — for instance the plain id
  /// a read without `expandReferences` returns, or a missing field.
  static ExpandedReference? maybeFrom(Object? value) {
    if (value is Map<String, dynamic> && value.containsKey('id')) {
      return ExpandedReference.fromJson(value);
    }
    if (value is Map && value.containsKey('id')) {
      return ExpandedReference.fromJson(Map<String, dynamic>.from(value));
    }
    return null;
  }

  /// Reads a `multiple` reference (a list of expanded references) out of a
  /// decoded record value. A single expanded reference gives a one-item
  /// list; anything else (a plain id, a list of ids, `null`) gives an empty
  /// list.
  static List<ExpandedReference> listFrom(Object? value) {
    if (value is List) {
      return [
        for (final item in value)
          if (maybeFrom(item) case final ref?) ref,
      ];
    }
    final single = maybeFrom(value);
    return single == null ? const [] : [single];
  }

  /// True when the target is gone — `display` is `null`.
  bool get isMissing => display == null;

  /// The display value as one line of text.
  ///
  /// A string is returned as is; a `{ lang: text }` map (a translatable term
  /// name) gives the [language] entry, or the first entry when the language
  /// is not set or not present; any other value is its JSON-ish string form.
  /// `null` when the target is missing.
  String? displayText({String? language}) {
    final value = display;
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map) {
      if (value.isEmpty) return null;
      if (language != null && value[language] != null) {
        return '${value[language]}';
      }
      return '${value.values.first}';
    }
    return '$value';
  }

  Map<String, Object?> toJson() => {'id': id, 'display': display};

  @override
  String toString() => 'ExpandedReference(id: $id, display: $display)';
}
