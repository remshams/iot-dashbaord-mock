import 'package:iot_dashboard_mock/core/device/database/device.dart';
import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:test/test.dart';

import '../../../matchers/iterable.dart';
import '../fixture.dart';

void main() {
  group('DeviceDatabase', () {
    final devices = createDeviceListFixture(min: 10);
    final databaseDevices = devices.map(convertToDatabaseDevice).toList();
    final repository =
        InMemoryDeviceDatabase.fromDatabaseDeviceIterable(databaseDevices);

    group('fromDeviceIterable', () {
      test('should pupulate database with provided devices', () {
        final repositoryFromDevices =
            InMemoryDeviceDatabase.fromDeviceIterable(devices);
        expect(
            repositoryFromDevices.list(), emits(deepEquals(databaseDevices)));
      });
    });
    group('list', () {
      test('should emit list of all stored devices', () {
        expect(repository.list(), emits(deepEquals(databaseDevices)));
      });
    });
  });
}
