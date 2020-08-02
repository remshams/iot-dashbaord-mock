import 'package:iot_dashboard_mock/utils/enum.dart';

enum AppRoute { currentAccount, devices, ping }

String toPath(dynamic route) => removeEnumPrefix(route, separator: '/');

extension AppRouteExtension on AppRoute {
  String get path => toPath(this);
}
