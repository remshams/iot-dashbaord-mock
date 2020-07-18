import 'package:iot_dashboard_mock/core/device/device_respository.dart';
import 'package:test/test.dart';

import '../../matchers/iterable.dart';
import 'fixture.dart';

void main() {
  group('DeviceRepository', () {
    final devices = createDeviceListFixture(min: 10);
    final repository = InMemoryDeviceRepository.fromDeviceIterable(devices);
    group('list', () {
      test('should emit list of all stored devices', () {
        expect(repository.list(), emits(deepEquals(devices)));
      });
      test('should emit list number of requested devices', () {
        expect(repository.list(numberOfDevices: 2),
            emits(deepEquals(devices.sublist(0, 2))));
      });
      test('should emit list devices starting from given last deviceId', () {
        expect(repository.list(lastDeviceId: devices[0].id),
            emits(deepEquals(devices.sublist(1))));
      });
      test(
          'should emit list devices starting from last id with the requested number of devices',
          () {
        expect(repository.list(lastDeviceId: devices[2].id, numberOfDevices: 2),
            emits(deepEquals(devices.sublist(3, 5))));
      });
      test(
          'should emit list of devices when number of requested devices exceeds device list length',
          () {
        expect(repository.list(numberOfDevices: devices.length),
            emits(deepEquals(devices)));
      });
      test('should emit empty list when lastDeviceId is last device in list',
          () {
        expect(repository.list(lastDeviceId: devices.last.id), emits([]));
      });
      test(
          'should emit rest of list when last device plus number of request devices exceeds device list length',
          () {
        expect(
            repository.list(
                lastDeviceId: devices[devices.length - 4].id,
                numberOfDevices: 4),
            emits(deepEquals(devices.sublist(devices.length - 3))));
      });
    });
  });
}
