import 'package:iot_dashboard_mock/utils/enum.dart';

enum AppRoute { currentAccount, devices, ping, img }

String toPath(dynamic route) => removeEnumPrefix(route);

extension AppRouteExtension on AppRoute {
  String get path => toPath(this);
}
