/// A project's own API host.
///
/// Norbix serves every project on `pr-<32 hex>.api.norbix.ai`. The label is
/// the project id (`pr_` + base62) written as the hex of the same GUID, so it
/// is built here with no call. The gateway's side of this is
/// `ProjectId.HostLabel`.
library;

/// The one base URL a project host is composed under: the SDK's built-in API
/// default. The Hub default and every user-supplied URL are never rewritten.
const String kNorbixProjectHostDefaultBaseUrl = 'https://api.norbix.ai';

const String _base62 =
    '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
const String _projectIdPrefix = 'pr_';

// .NET "N" format: the first three groups are stored little-endian.
const List<int> _hexOrder = [
  3,
  2,
  1,
  0,
  5,
  4,
  7,
  6,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15
];

final BigInt _sixtyTwo = BigInt.from(62);
final BigInt _maxGuid = BigInt.one << 128;
final BigInt _byteMask = BigInt.from(0xff);

/// The DNS label of a project: `pr_5XvmrTA6JVggZdmEE5bGdm` →
/// `pr-022c4aca9f9e4df787ab0a20c83c44b6`.
///
/// Returns null for anything that is not a Norbix project id (a test id,
/// another prefix, a value that is not a version-4 GUID) — it never throws.
String? projectHostLabel(String? projectId) {
  if (projectId == null || !projectId.startsWith(_projectIdPrefix)) return null;
  final digits = projectId.substring(_projectIdPrefix.length);
  // 62^22 is just above 2^128: a GUID never needs more than 22 digits.
  if (digits.isEmpty || digits.length > 22) return null;

  // BigInt, not int: a Dart int is 64 bits on the VM and 53 when compiled to
  // JavaScript, and the value needs 128.
  var value = BigInt.zero;
  for (var i = 0; i < digits.length; i++) {
    final digit = _base62.indexOf(digits[i]);
    if (digit < 0) return null;
    value = value * _sixtyTwo + BigInt.from(digit);
  }
  if (value >= _maxGuid) return null;

  // The number is the GUID's bytes, least significant first (.NET
  // `Guid.ToByteArray()`).
  final b = List<int>.filled(16, 0);
  for (var i = 0; i < 16; i++) {
    b[i] = (value & _byteMask).toInt();
    value = value >> 8;
  }

  // Only a version-4 GUID is a Norbix id (the gateway refuses the rest).
  if (b[7] >> 4 != 4 || b[8] >> 6 != 2) return null;

  final hex = StringBuffer('pr-');
  for (final i in _hexOrder) {
    hex.write(b[i].toRadixString(16).padLeft(2, '0'));
  }
  return hex.toString();
}

/// The project's own base URL: when [baseUrl] is the SDK's built-in API
/// default and [projectId] is a Norbix project id, the host label becomes a
/// subdomain prefix (`https://pr-022c….api.norbix.ai`). Returns null in every
/// other case — a custom base URL, the Hub default, no project id, or an id
/// that does not decode — and the caller keeps the URL it had.
String? composeProjectBaseUrl(String baseUrl, String? projectId) {
  if (baseUrl != kNorbixProjectHostDefaultBaseUrl) return null;
  final label = projectHostLabel(projectId);
  if (label == null) return null;
  final uri = Uri.parse(baseUrl);
  return '${uri.scheme}://$label.${uri.host}';
}
