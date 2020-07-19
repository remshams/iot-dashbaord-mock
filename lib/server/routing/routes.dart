enum AppRoute { currentAccount, devices, ping }

String toPath(dynamic route) =>
    route.toString().replaceAll('${route.runtimeType}.', '/');

extension AppRouteExtension on AppRoute {
  String get path => toPath(this);
}
