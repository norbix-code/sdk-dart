import 'dart:convert';

import 'package:http/http.dart' as http;

import 'norbix_error.dart';

class TransportConfig {
  final String baseUrlApi;
  final String baseUrlHub;
  final String apiVersion;
  final String hubVersion;
  final String? apiKey;
  final String? bearerToken;

  const TransportConfig({
    required this.baseUrlApi,
    required this.baseUrlHub,
    required this.apiVersion,
    required this.hubVersion,
    this.apiKey,
    this.bearerToken,
  });
}

class Transport {
  Transport(this.config, {http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  TransportConfig config;
  final http.Client _httpClient;

  Future<dynamic> send({
    required String host,
    required String route,
    String method = 'GET',
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? pathParams,
  }) async {
    final resolved = _resolveUrl(
      host: host,
      route: route,
      query: query,
      pathParams: pathParams,
    );

    final allHeaders = _buildHeaders(headers);
    final request = http.Request(method.toUpperCase(), resolved)
      ..headers.addAll(allHeaders);

    if (body != null && method.toUpperCase() != 'GET') {
      request.body = jsonEncode(body);
    }

    final streamed = await _httpClient.send(request);
    final response = await http.Response.fromStream(streamed);
    return _parseResponse(response);
  }

  Uri _resolveUrl({
    required String host,
    required String route,
    Map<String, dynamic>? query,
    Map<String, dynamic>? pathParams,
  }) {
    var normalizedRoute = route;
    final params = pathParams ?? const <String, dynamic>{};
    for (final entry in params.entries) {
      normalizedRoute =
          normalizedRoute.replaceAll('{${entry.key}}', '${entry.value}');
    }

    final version = host == 'api' ? config.apiVersion : config.hubVersion;
    normalizedRoute = normalizedRoute.replaceAll('{version}', version);

    final baseUrl = host == 'api' ? config.baseUrlApi : config.baseUrlHub;
    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    final fullUrl = normalizedRoute.startsWith('/')
        ? '$base$normalizedRoute'
        : '$base/$normalizedRoute';

    final uri = Uri.parse(fullUrl);
    if (query == null || query.isEmpty) return uri;

    return uri.replace(
      queryParameters: {
        ...uri.queryParameters,
        ...query.map((k, v) => MapEntry(k, '$v')),
      },
    );
  }

  Map<String, String> _buildHeaders(Map<String, String>? headers) {
    final out = <String, String>{'content-type': 'application/json'};
    if (config.apiKey != null && config.apiKey!.isNotEmpty) {
      out['x-api-key'] = config.apiKey!;
    }
    if (config.bearerToken != null && config.bearerToken!.isNotEmpty) {
      out['authorization'] = 'Bearer ${config.bearerToken!}';
    }
    if (headers != null) {
      out.addAll(headers);
    }
    return out;
  }

  dynamic _parseResponse(http.Response response) {
    final body = response.body.trim();
    final isJson = response.headers['content-type']?.contains('json') ?? false;
    dynamic parsed = body;

    if (body.isNotEmpty && isJson) {
      parsed = jsonDecode(body);
    } else if (body.isEmpty) {
      parsed = null;
    }

    if (response.statusCode >= 400) {
      final message = parsed is Map<String, dynamic>
          ? (parsed['message']?.toString() ??
              parsed['error']?.toString() ??
              'Request failed')
          : 'Request failed';
      final code = parsed is Map<String, dynamic>
          ? (parsed['code']?.toString() ?? 'NORBIX_HTTP_ERROR')
          : 'NORBIX_HTTP_ERROR';

      throw NorbixError(
        message: message,
        code: code,
        status: response.statusCode,
        details: parsed is Map<String, dynamic>
            ? parsed
            : {'body': parsed, 'status': response.statusCode},
      );
    }

    return parsed;
  }

  void close() => _httpClient.close();
}
