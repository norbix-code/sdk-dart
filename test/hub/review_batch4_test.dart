import 'package:norbix/norbix_api.dart' show NorbixApi;
import 'package:norbix/norbix_hub.dart';
import 'package:test/test.dart';

import '../_fake_driver.dart';

/// Review batch 4 routes: one team member, one user's AI plan, the workflow
/// filters. Exact-route checks against the fake driver.
NorbixHub _hub(FakeHttpDriver driver) => NorbixHub(
      config: NorbixConfig(baseUrl: 'https://hub.norbix.ai', apiKey: 'k'),
      driver: driver,
    );

void main() {
  test('accounts.getTeamMember → GET /v3/account/team/member/{memberId}',
      () async {
    final driver = FakeHttpDriver();
    await _hub(driver).accounts.getTeamMember(memberId: 'usr_1');
    expect(driver.lastRequest!.method, 'GET');
    expect(driver.lastRequest!.url.toString(),
        'https://hub.norbix.ai/v3/account/team/member/usr_1');
    expect(driver.lastRequest!.body, isNull);
  });

  test('hub membership.getUserAiPlan → GET /v3/membership/users/{id}/ai-plan',
      () async {
    final driver = FakeHttpDriver();
    await _hub(driver).membership.getUserAiPlan(
        userId: 'ct_1', query: {'databaseIntegrationId': 'int_1'});
    expect(driver.lastRequest!.method, 'GET');
    expect(driver.lastRequest!.url.toString(),
        'https://hub.norbix.ai/v3/membership/users/ct_1/ai-plan?databaseIntegrationId=int_1');
  });

  test('api users.getUserAiPlan → GET /v3/membership/users/{id}/ai-plan',
      () async {
    final driver = FakeHttpDriver();
    await NorbixApi(
      config: NorbixConfig(baseUrl: 'https://api.example.test', apiKey: 'k'),
      driver: driver,
    ).users.getUserAiPlan(userId: 'ct_1');
    expect(driver.lastRequest!.method, 'GET');
    expect(driver.lastRequest!.url.toString(),
        'https://api.example.test/v3/membership/users/ct_1/ai-plan');
  });

  test('code.getCodeWorkflows passes search', () async {
    final driver = FakeHttpDriver();
    await _hub(driver).code.getCodeWorkflows(query: {'search': 'invoice'});
    expect(driver.lastRequest!.url.toString(),
        'https://hub.norbix.ai/v3/code/workflows?search=invoice');
  });

  test('code.getCodeWorkflowRuns passes workflowVersion', () async {
    final driver = FakeHttpDriver();
    await _hub(driver)
        .code
        .getCodeWorkflowRuns(id: 'wf_1', query: {'workflowVersion': 2});
    expect(driver.lastRequest!.url.toString(),
        'https://hub.norbix.ai/v3/code/workflows/wf_1/runs?workflowVersion=2');
  });
}
