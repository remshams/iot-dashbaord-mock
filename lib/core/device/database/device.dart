import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:iot_dashboard_mock/core/shared/database/model.dart';
import 'package:meta/meta.dart';

@immutable
class DatabaseDevice implements DatabaseModel {
  @override
  final String id;
  final Device device;

  const DatabaseDevice(this.id, this.device);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DatabaseDevice && o.id == id && o.device == device;
  }

  @override
  int get hashCode => id.hashCode ^ device.hashCode;
}

DatabaseDevice convertDevice(Device device) =>
    DatabaseDevice(device.id, device);
Device convertDatabaseDevice(DatabaseDevice databaseDevice) =>
    databaseDevice.device;
