import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:rxdart/subjects.dart';

abstract class DeviceRepository {
  Stream<List<Device>> list({String lastDeviceId, int numberOfDevices});
}

class InMemoryDeviceRepository implements DeviceRepository {
  BehaviorSubject<Map<String, Device>> _devices;

  InMemoryDeviceRepository(Map<String, Device> devices)
      : _devices = BehaviorSubject.seeded(devices);
  InMemoryDeviceRepository.fromDeviceIterable(Iterable<Device> devices)
      : this(_devicesFromIterable(devices));

  static Map<String, Device> _devicesFromIterable(Iterable<Device> devices) =>
      Map.fromIterable(devices, key: (device) => device.id as String);

  @override
  Stream<List<Device>> list({String lastDeviceId, int numberOfDevices}) =>
      _devices.map((devicesById) => devicesById.values.toList());
}
