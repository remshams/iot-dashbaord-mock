import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:iot_dashboard_mock/core/shared/environment/host.dart';

class DeviceService {
  final DeviceDatabase _deviceDatabase;
  final Host host;

  DeviceService(this._deviceDatabase, this.host);

  Stream<List<Device>> list({String lastDeviceId, int numberOfDevices}) {
    return _deviceDatabase
        .list(lastDeviceId: lastDeviceId, limit: numberOfDevices)
        .map((devices) => devices
            .map((device) => device.prependHostToImageUrl(host))
            .toList());
  }
}
