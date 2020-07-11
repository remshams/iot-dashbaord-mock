enum AppRoute { currentAccount, ping }

String toPath(dynamic route) =>
    route.toString().replaceAll('${route.runtimeType}.', '/');

extension AppRouteExtension on AppRoute {
  String get path => toPath(this);
}
