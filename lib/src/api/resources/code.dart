// Written by hand in the generated-resource style: the generator
// (tool/generate_resources.*) is not on disk. Routes: references/api.dtos.dart.

import '../../core/resource.dart';

/// Code workflows on the Api host: a project user's waiting runs, resuming a
/// run, and the signed resume links.
///
/// Beta: Workflows are in beta; bugs may occur.
class CodeResource extends Resource {
  CodeResource(super.transport);

  /// Beta: `GET /{version}/code/workflows/runs`
  ///
  /// Runs across workflows (waiting by default). Query: `status?`,
  /// `waitingKind?`, `assignee?` (`me` or a `usr_…` id), `workflowId?`,
  /// `key?` and paging. Answers `WorkflowRunsResponse`.
  Future<Object?> getCodeWorkflowWaitingRuns(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// Beta: `POST /{version}/code/workflows/runs/{RunId}/resume`
  ///
  /// Resume a waiting run. Body: `stepId?`, `decision?` (`approved` /
  /// `rejected`), `payload?`. Answers `WorkflowRunResponse`.
  Future<Object?> resumeCodeWorkflowRun(
      {required Object runId,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/runs/{RunId}/resume',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'RunId': runId},
    );
  }

  /// Beta: `GET /{version}/code/workflows/resume/{Token}`
  ///
  /// Open a signed resume link (an approval in an e-mail). The token is the
  /// key: no sign-in needed — auth is sent when the client has it, never
  /// required. Answers `CodeWorkflowResumeLinkResponse`.
  Future<Object?> openCodeWorkflowResumeLink(
      {required Object token,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/resume/{Token}',
      method: 'GET',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Token': token},
    );
  }

  /// Beta: `POST /{version}/code/workflows/resume/{Token}`
  ///
  /// Act on a signed resume link. Body: `decision?`, `payload?`. The token
  /// is the key: no sign-in needed. Answers `WorkflowRunResponse`.
  Future<Object?> useCodeWorkflowResumeLink(
      {required Object token,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/code/workflows/resume/{Token}',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'Token': token},
    );
  }
}
