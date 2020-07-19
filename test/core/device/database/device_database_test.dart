import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:test/test.dart';

import '../../../matchers/iterable.dart';
import 'fixture.dart';

void main() {
  group('DeviceDatabase', () {
    final devices = createDatabaseDeviceListFixture(min: 10);
    final repository = InMemoryDeviceDatabase.fromDeviceIterable(devices);
    group('list', () {
      test('should emit list of all stored devices', () {
        expect(repository.list(), emits(deepEquals(devices)));
      });
    });
  });
}
