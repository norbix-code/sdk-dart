import 'package:norbix_core/norbix_core.dart';

/// Test double for [HttpDriver] used by norbix_api round-trip tests.
class FakeHttpDriver implements HttpDriver {
  HttpDriverRequest? lastRequest;
  final List<HttpDriverRequest> requests = [];

  HttpDriverResponse Function(int attempt) responder;

  FakeHttpDriver([this.responder = _ok]);

  static HttpDriverResponse _ok(int attempt) => const HttpDriverResponse(
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
