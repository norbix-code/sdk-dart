import 'dart:convert';
import 'dart:io' show SocketException;

import 'config.dart';
import 'errors.dart';
import 'http_driver.dart';

/// Internal HTTP transport used by every resource. You should not construct
/// this directly — the per-host clients (`NorbixApi`, `NorbixHub`) own one.
class Transport {
  Transport({
    required this.config,
    HttpDriver? driver,
  }) : _driver = driver ?? HttpClientDriver();

  /// Mutable so credentials can be rotated at runtime via
  /// `client.setApiKey(...)` without rebuilding the Transport.
  NorbixConfig config;
  final HttpDriver _driver;

  /// Send a request and return the parsed JSON body (Map, List, or null).
  ///
  /// Throws a typed [NorbixError] subclass on non-2xx responses or transport
  /// failures.
  Future<Object?> send({
    required String route,
    String method = 'GET',
    Map<String, Object?>? query,
    Object? body,
    Map<String, String>? headers,
    Map<String, Object?>? pathParams,
  }) async {
    final url = _resolveUrl(route: route, query: query, pathParams: pathParams);
    final allHeaders = _buildHeaders(headers);
    final encodedBody = (body == null || method.toUpperCase() == 'GET')
        ? null
        : jsonEncode(body);

    final request = HttpDriverRequest(
      method: method,
      url: url,
      headers: allHeaders,
      body: encodedBody,
      timeout: config.timeout,
    );

    Object? lastError;
    for (var attempt = 0; attempt <= config.maxRetries; attempt++) {
      try {
        final response = await _driver.send(request);
        if (response.statusCode >= 500 || response.statusCode == 429) {
          if (attempt < config.maxRetries) {
            await Future<void>.delayed(_backoff(attempt));
            continue;
          }
        }
        return _parseResponse(response);
      } on NorbixError {
        rethrow;
      } on SocketException catch (e) {
        lastError = NorbixTransportError(
          message: 'Network error: ${e.message}',
          details: {'osError': e.osError?.message},
        );
        if (attempt < config.maxRetries) {
          await Future<void>.delayed(_backoff(attempt));
          continue;
        }
        throw lastError;
      } catch (e) {
        lastError = NorbixTransportError(
          message: 'Transport failure: $e',
          details: const {},
        );
        if (attempt < config.maxRetries) {
          await Future<void>.delayed(_backoff(attempt));
          continue;
        }
        throw lastError;
      }
    }
    throw lastError as Object;
  }

  Duration _backoff(int attempt) {
    // 100ms, 200ms, 400ms, ... — capped at 5s.
    final ms = (100 << attempt).clamp(100, 5000);
    return Duration(milliseconds: ms);
  }

  Uri _resolveUrl({
    required String route,
    Map<String, Object?>? query,
    Map<String, Object?>? pathParams,
  }) {
    var normalizedRoute = route;
    if (pathParams != null) {
      pathParams.forEach((k, v) {
        if (v == null) return;
        normalizedRoute = normalizedRoute.replaceAll(
          '{$k}',
          Uri.encodeComponent('$v'),
        );
      });
    }
    normalizedRoute =
        normalizedRoute.replaceAll('{version}', config.apiVersion);

    final base = config.baseUrl;
    final fullUrl = normalizedRoute.startsWith('/')
        ? '$base$normalizedRoute'
        : '$base/$normalizedRoute';

    final uri = Uri.parse(fullUrl);
    if (query == null || query.isEmpty) return uri;

    final filtered = <String, String>{};
    query.forEach((k, v) {
      if (v == null) return;
      filtered[k] = '$v';
    });
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      ...filtered,
    });
  }

  Map<String, String> _buildHeaders(Map<String, String>? extra) {
    final out = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      ...config.defaultHeaders,
    };
    if (config.bearerToken != null && config.bearerToken!.isNotEmpty) {
      out['authorization'] = 'Bearer ${config.bearerToken}';
    } else if (config.apiKey != null && config.apiKey!.isNotEmpty) {
      out['x-api-key'] = config.apiKey!;
    }
    if (extra != null) out.addAll(extra);
    return out;
  }

  Object? _parseResponse(HttpDriverResponse response) {
    final body = response.body.trim();
    final isJson = response.headers['content-type']?.contains('json') ?? false;

    Object? parsed;
    if (body.isEmpty) {
      parsed = null;
    } else if (isJson) {
      try {
        parsed = jsonDecode(body);
      } catch (_) {
        parsed = body;
      }
    } else {
      parsed = body;
    }

    if (response.statusCode >= 400) {
      String message = 'Request failed';
      String code = 'NORBIX_HTTP_ERROR';
      Map<String, dynamic> details = <String, dynamic>{
        'status': response.statusCode,
      };
      if (parsed is Map<String, dynamic>) {
        message = (parsed['message'] ?? parsed['error'] ?? message).toString();
        code = (parsed['code'] ?? code).toString();
        details = {...parsed, 'status': response.statusCode};
      } else if (parsed != null) {
        details = {'body': parsed, 'status': response.statusCode};
      }
      final retryAfter = response.headers['retry-after'];
      if (retryAfter != null) details['retryAfter'] = retryAfter;
      throw NorbixError.fromHttp(
        status: response.statusCode,
        message: message,
        code: code,
        details: details,
      );
    }

    return parsed;
  }

  void close() => _driver.close();
}
