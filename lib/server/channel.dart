import 'package:iot_dashboard_mock/server/account/user.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:iot_dashboard_mock/server/server.dart';
import 'package:iot_dashboard_mock/server/shared/basic_auth_validator.dart';
import 'package:iot_dashboard_mock/server/shared/system.dart';
import 'package:iot_dashboard_mock/server/shared/system_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class IotDashboardMockChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    final system = System.inMemory();

    router
        .route(toPath(AppRoute.currentAccount))
        .link(() => Authorizer.basic(BasicAuthValidator(system)))
        .linkFunction(currentUser);

    router
        .route(toPath(AppRoute.ping))
        .linkFunction((request) => Response.ok('pong'));

    return SystemController(system)..link(() => router);
  }
}
