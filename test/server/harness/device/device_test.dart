import 'dart:io';

import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:iot_dashboard_mock/server/device/model.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:iot_dashboard_mock/utils/enum.dart';
import 'package:test/test.dart';

import '../app.dart';

void main() {
  group('Device', () {
    final harness = Harness()..install();

    group('devices', () {
      test('should return device list', () async {
        final responseBodyExpected = devices.map(fromDevice).map(toJson);

        final response = await harness.agent.get(toPath(AppRoute.devices));

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseBodyExpected)));
      });
      test('should return requested number of devices', () async {
        const limit = 2;
        final responseBodyExpected =
            devices.sublist(0, limit).map(fromDevice).map(toJson);

        final response = await harness.agent.get(
            '${toPath(AppRoute.devices)}?${removeEnumPrefix(DeviceQueryParam.limit)}=$limit');

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseBodyExpected)));
      });
      test('should return request devices from last device id', () async {
        final lastDeviceId = devices[0].id;
        final responseExpected = devices.sublist(1).map(fromDevice).map(toJson);

        final response = await harness.agent.get(
            '${toPath(AppRoute.devices)}?${removeEnumPrefix(DeviceQueryParam.lastDeviceId)}=$lastDeviceId');

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseExpected)));
      });
    });
  });
}
