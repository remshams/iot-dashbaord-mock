import 'package:iot_dashboard_mock/core/device/database/device.dart';
import 'package:test/test.dart';

import '../fixture.dart';
import 'fixture.dart';

void main() {
  final device = createDeviceFixture();
  final databaseDevice = createDatabaseDeviceFixture(
      id: device.id, name: device.name, description: device.description);
  group('Device', () {
    group('convertToDatabaseDevice', () {
      test('should convert', () {
        expect(convertToDatabaseDevice(device), equals(databaseDevice));
      });
    });
    group('DatabaseDevice', () {
      group('convertToDevice', () {
        test('should convert', () {
          expect(convertToDevice(databaseDevice), equals(device));
        });
      });
    });
  });
}
