enum AppRoute { currentAccount, devices, ping }

// TODO Refactor to removePrefix method
String toPath(dynamic route) =>
    route.toString().replaceAll('${route.runtimeType}.', '/');

extension AppRouteExtension on AppRoute {
  String get path => toPath(this);
}
