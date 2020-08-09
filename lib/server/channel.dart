import 'package:iot_dashboard_mock/server/account/account.dart';
import 'package:iot_dashboard_mock/server/device/device_controller.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:iot_dashboard_mock/server/server.dart';
import 'package:iot_dashboard_mock/server/shared/basic_auth_validator.dart';
import 'package:iot_dashboard_mock/server/shared/domains.dart';

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
    final _router = Router();
    final _domains = Domains.inMemory();
    final _authValidator = BasicAuthValidator(_domains);

    _router
        .route(toPath(AppRoute.currentAccount))
        .link(() => Authorizer.basic(_authValidator))
        .linkFunction(currentAccount);
    _router
        .route(toPath(AppRoute.devices))
        .link(() => Authorizer.basic(_authValidator))
        .link(() => DeviceController(_domains));

    _router
        .route(toPath(AppRoute.ping))
        .linkFunction((request) => Response.ok('pong'));

    _router
        .route('${AppRoute.img.path}/*')
        .link(() => FileController('public/img'));

    return _router;
  }
}
