import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/iot_dashboard_mock.dart';
import 'package:iot_dashboard_mock/server/server.dart';

export 'package:aqueduct/aqueduct.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:iot_dashboard_mock/iot_dashboard_mock.dart';
export 'package:test/test.dart';

/// A testing harness for iot_dashboard_mock.
///
/// A harness for testing an aqueduct application. Example test file:
///
///         void main() {
///           Harness harness = Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final response = await harness.agent.get("/path");
///             expectResponse(response, 200);
///           });
///         }
///
class Harness extends TestHarness<IotDashboardMockChannel> {
  final bool _withAuth;

  Harness({bool withAuth = true}) : _withAuth = withAuth;

  @override
  Future onSetUp() async {
    if (_withAuth == true) {
      _setupAuth();
    }
  }

  @override
  Future onTearDown() async {}

  void _setupAuth() {
    agent.setBasicAuthorization(accounts[0].username, 'password');
  }
}
