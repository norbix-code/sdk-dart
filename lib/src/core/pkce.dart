import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// A PKCE (RFC 7636, S256) verifier and its challenge for social sign-in and
/// link identity.
///
/// Keep [codeVerifier] in memory (never in a URL); send [codeChallenge] on the
/// start (`socialSignInUrl(codeChallenge:)`, `codeChallenge` on
/// `startLinkIdentity`) and [codeVerifier] on the exchange or the link finish
/// (`codeVerifier`). A code started with a challenge works only with the
/// matching verifier: CM-ERRORS-MEMBERSHIP-058 otherwise, and the code is used
/// up. A challenge that is not S256 is CM-ERRORS-MEMBERSHIP-059.
class PkcePair {
  const PkcePair(this.codeVerifier, this.codeChallenge);

  /// 43 characters `[A-Za-z0-9-_]`.
  final String codeVerifier;

  /// base64url (no padding) SHA-256 of [codeVerifier], 43 characters.
  final String codeChallenge;
}

final _verifierPattern = RegExp(r'^[A-Za-z0-9\-._~]{43,128}$');

/// A fresh verifier (32 bytes from `Random.secure()`, base64url) and its S256
/// challenge.
PkcePair createPkcePair() {
  final random = Random.secure();
  final bytes = List<int>.generate(32, (_) => random.nextInt(256));
  final verifier = _base64Url(bytes);
  return PkcePair(verifier, pkceChallenge(verifier));
}

/// The S256 challenge of [codeVerifier]: base64url (no padding) of SHA-256
/// over its ASCII bytes.
String pkceChallenge(String codeVerifier) {
  if (!_verifierPattern.hasMatch(codeVerifier)) {
    throw ArgumentError.value(codeVerifier, 'codeVerifier',
        'a PKCE code verifier is 43 to 128 characters of A-Z a-z 0-9 - . _ ~');
  }
  return _base64Url(sha256.convert(ascii.encode(codeVerifier)).bytes);
}

String _base64Url(List<int> bytes) =>
    base64Url.encode(bytes).replaceAll('=', '');
