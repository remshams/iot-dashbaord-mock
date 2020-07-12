import 'package:iot_dashboard_mock/core/device/device_respository.dart';
import 'package:test/test.dart';

import '../../matchers/iterable.dart';
import 'fixture.dart';

void main() {
  group('DeviceRepository', () {
    final devices = createDeviceListFixture(min: 2);
    final repository = InMemoryDeviceRepository.fromDeviceIterable(devices);
    group('list', () {
      test('should list all stored devices', () {
        expect(repository.list(), emits(deepEquals(devices)));
      });
      test('should list number of requested devices', () {});
      test('should list devices starting from given last deviceId', () {});
    });
  });
}
