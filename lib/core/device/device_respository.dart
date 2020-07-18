import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

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
      Map.fromIterable(devices, key: (dynamic device) => device.id as String);

  @override
  Stream<List<Device>> list({String lastDeviceId, int numberOfDevices}) =>
      _devices.value.isEmpty
          ? Stream.value([])
          : _devices.map((devices) {
              final firstDeviceIndex = _firstDeviceIndex(devices, lastDeviceId);
              return Tuple3(
                  firstDeviceIndex,
                  _lastIndex(firstDeviceIndex, devices.length, numberOfDevices),
                  devices);
            }).map((tuple) {
              return tuple.item3.values
                  .toList()
                  .sublist(tuple.item1, tuple.item2)
                  .toList();
            });

  int _firstDeviceIndex(Map<String, Device> devices, String lastDeviceId) =>
      devices[lastDeviceId] != null
          ? devices.values.toList().indexOf(devices[lastDeviceId]) + 1
          : 0;
  int _lastIndex(
          int startIndex, int totalNumberOfDevices, int numberOfDevices) =>
      numberOfDevices == null
          ? totalNumberOfDevices
          : startIndex + numberOfDevices <= totalNumberOfDevices
              ? startIndex + numberOfDevices
              : totalNumberOfDevices;
}
