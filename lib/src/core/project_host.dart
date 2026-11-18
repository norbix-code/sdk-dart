/// A project's own API host.
///
/// Norbix serves every project on `pr-<32 hex>.api.norbix.ai`. The label is
/// the project id (`pr_` + base62) written as the hex of the same GUID, so it
/// is built here with no call. The gateway's side of this is
/// `ProjectId.HostLabel`.
library;

/// The SDK's built-in API default, the address [composeProjectBaseUrl]
/// rewrites. Where calls really go is decided by [projectApiBaseUrl].
const String kNorbixProjectHostDefaultBaseUrl = 'https://api.norbix.ai';

/// The placeholder an install on its own domain puts where the project's label
/// goes, e.g. `https://{projectHostLabel}.api.customer.com` (the
/// `apiUrlTemplate` of `GET /v3/echo`).
const String kNorbixProjectHostLabelPlaceholder = '{projectHostLabel}';

const String _norbixApiDomain = 'api.norbix.ai';
final RegExp _projectLabel = RegExp(r'^pr-[0-9a-f]{32}$', caseSensitive: false);

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

/// The project's own base URL under the SDK's built-in API default
/// (`https://api.norbix.ai` → `https://pr-022c….api.norbix.ai`). Returns null
/// for any other [baseUrl] or an id that does not decode. Kept for callers of
/// round 1; the client itself uses [projectApiBaseUrl].
String? composeProjectBaseUrl(String baseUrl, String? projectId) {
  if (baseUrl != kNorbixProjectHostDefaultBaseUrl) return null;
  final label = projectHostLabel(projectId);
  if (label == null) return null;
  final uri = Uri.parse(baseUrl);
  return '${uri.scheme}://$label.${uri.host}';
}

/// Where a project's API calls go, from the API base URL the client has
/// (the built-in default with its region composed, or the URL as the user
/// gave it):
///
/// - a template with `{projectHostLabel}` (an install on its own domain that
///   serves project hosts) gets the project's label;
/// - an address that is already a project's host (`https://pr-<32 hex>.…`, a
///   pasted `apiHost`) gets the current project's label, so the host and the
///   `norbix-project-id` header always name the same project;
/// - a norbix.ai API address — `https://api.norbix.ai` or
///   `https://<region>.api.norbix.ai` — becomes `https://pr-<hex>.api.norbix.ai`
///   (its DNS record follows the project's region);
/// - any other address (staging, localhost, `http://`, a plain own domain) is
///   used as given.
///
/// `shared` is the same address without a project label; the social sign-in
/// link is built on it. With a project id that does not decode, `project` is
/// `shared`. Scheme, port and path are kept. Never throws.
({String project, String shared}) projectApiBaseUrl(
  String baseUrl,
  String? projectId,
) {
  final label = projectHostLabel(projectId);

  // A string replacement, before any parsing: `{` is not valid in a host.
  if (baseUrl.contains(kNorbixProjectHostLabelPlaceholder)) {
    final shared =
        baseUrl.replaceAll('$kNorbixProjectHostLabelPlaceholder.', '');
    return (
      project: label == null
          ? shared
          : baseUrl.replaceAll(kNorbixProjectHostLabelPlaceholder, label),
      shared: shared,
    );
  }

  final uri = Uri.tryParse(baseUrl);
  if (uri == null || uri.host.isEmpty) {
    return (project: baseUrl, shared: baseUrl);
  }
  final labels = uri.host.toLowerCase().split('.');

  if (labels.length > 1 && _projectLabel.hasMatch(labels.first)) {
    final rest = labels.skip(1).join('.');
    final shared = _withHost(uri, rest);
    return (
      project: label == null ? shared : _withHost(uri, '$label.$rest'),
      shared: shared,
    );
  }

  final host = labels.join('.');
  final isNorbixApi = host == _norbixApiDomain ||
      (labels.length == 4 && host.endsWith('.$_norbixApiDomain'));
  if (isNorbixApi && uri.scheme == 'https') {
    return (
      project:
          label == null ? baseUrl : _withHost(uri, '$label.$_norbixApiDomain'),
      shared: baseUrl,
    );
  }

  return (project: baseUrl, shared: baseUrl);
}

/// [uri] with another host; scheme, port, path and query are kept.
String _withHost(Uri uri, String host) => uri.replace(host: host).toString();
