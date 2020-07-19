import 'package:iot_dashboard_mock/core/device/database/device.dart';
import 'package:iot_dashboard_mock/core/shared/database/in_memory_database.dart';

abstract class DeviceDatabase {
  Stream<List<DatabaseDevice>> list({String lastDeviceId, int numberOfDevices});
}

class InMemoryDeviceDatabase implements DeviceDatabase {
  final InMemoryDatabase<DatabaseDevice> _inMemoryDatabase;

  InMemoryDeviceDatabase(Map<String, DatabaseDevice> devices)
      : _inMemoryDatabase = InMemoryDatabase(devices);
  InMemoryDeviceDatabase.fromDeviceIterable(Iterable<DatabaseDevice> devices)
      : _inMemoryDatabase = InMemoryDatabase.fromModelsIterable(devices);

  @override
  Stream<List<DatabaseDevice>> list(
          {String lastDeviceId, int numberOfDevices}) =>
      _inMemoryDatabase.list(lastModelId: lastDeviceId, limit: numberOfDevices);
}
