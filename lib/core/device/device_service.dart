import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:iot_dashboard_mock/core/device/device.dart';

class DeviceService {
  final DeviceDatabase _deviceDatabase;

  DeviceService(this._deviceDatabase);

  Stream<List<Device>> list({String lastDeviceId, int numberOfDevices}) {
    return _deviceDatabase.list(
        lastDeviceId: lastDeviceId, limit: numberOfDevices);
  }
}
