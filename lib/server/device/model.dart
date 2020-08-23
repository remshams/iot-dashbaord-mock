import 'package:iot_dashboard_mock/utils/enum.dart';

enum DeviceQueryParam { pageSize, lastDeviceId }

extension DeviceQueryParamExtension on DeviceQueryParam {
  String get requestName => removeEnumPrefix(this);
}
