import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:test/test.dart';

import '../../core/device/fixture.dart';

void main() {
  final deviceDto = DeviceDto.fromDevice(createDeviceFixture());

  group('Server Test', () {
    group('fromJson/toJson', () {
      test('should convert', () {
        expect(DeviceDto.fromJson(deviceDto.toJson()), equals(deviceDto));
      });
    });
  });
}
