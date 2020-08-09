import 'package:iot_dashboard_mock/core/device/device_service.dart';
import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../matchers/iterable.dart';
import '../shared/environment/fixture.dart';
import 'database/fixture.dart';
import 'fixture.dart';

void main() {
  group('Device Service', () {
    final host = createHostFixture();
    final deviceDatabase = MockDeviceDatabase();
    final devices = createDeviceListFixture(min: 2);
    final deviceService = DeviceService(deviceDatabase, host);

    setUp(() {
      when(deviceDatabase.list()).thenAnswer((_) => Stream.value(devices));
    });
    group('list', () {
      test('should add host to device image urls', () {
        final devicesExpected = devices
            .map((device) => device.copyWith(
                imageUrl: device.imageUrl != null
                    ? prependHostToUrl(device.imageUrl, host)
                    : device.imageUrl))
            .toList();

        expect(deviceService.list(), emits(deepEquals(devicesExpected)));
      });
    });
  });
}
