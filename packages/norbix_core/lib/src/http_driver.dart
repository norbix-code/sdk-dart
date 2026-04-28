import 'package:http/http.dart' as http;

/// Pluggable HTTP driver. Default is the standard `package:http` client.
/// Tests inject `MockClient`; Flutter apps can swap in `dio` or a custom
/// pinned-cert client by implementing this interface.
abstract class HttpDriver {
  Future<HttpDriverResponse> send(HttpDriverRequest request);
  void close();
}

class HttpDriverRequest {
  final String method;
  final Uri url;
  final Map<String, String> headers;
  final String? body;
  final Duration timeout;

  const HttpDriverRequest({
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    this.timeout = const Duration(seconds: 30),
  });
}

class HttpDriverResponse {
  final int statusCode;
  final Map<String, String> headers;
  final String body;

  const HttpDriverResponse({
    required this.statusCode,
    required this.headers,
    required this.body,
  });
}

/// Default driver, backed by `package:http`.
class HttpClientDriver implements HttpDriver {
  HttpClientDriver([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<HttpDriverResponse> send(HttpDriverRequest request) async {
    final req = http.Request(request.method.toUpperCase(), request.url)
      ..headers.addAll(request.headers);
    if (request.body != null) req.body = request.body!;
    final streamed = await _client.send(req).timeout(request.timeout);
    final response = await http.Response.fromStream(streamed);
    return HttpDriverResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  void close() => _client.close();
}
