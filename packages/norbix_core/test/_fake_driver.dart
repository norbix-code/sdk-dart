import 'package:norbix_core/norbix_core.dart';

/// Test double for [HttpDriver]. Records the request and replies with a
/// scripted [HttpDriverResponse].
class FakeHttpDriver implements HttpDriver {
  HttpDriverRequest? lastRequest;
  final List<HttpDriverRequest> requests = [];

  /// Function that returns the response for a given attempt index.
  HttpDriverResponse Function(int attempt) responder;

  FakeHttpDriver([
    this.responder = _defaultResponder,
  ]);

  static HttpDriverResponse _defaultResponder(int attempt) =>
      const HttpDriverResponse(
        statusCode: 200,
        headers: {'content-type': 'application/json'},
        body: '{"ok":true}',
      );

  @override
  Future<HttpDriverResponse> send(HttpDriverRequest request) async {
    lastRequest = request;
    requests.add(request);
    return responder(requests.length - 1);
  }

  @override
  void close() {}
}
