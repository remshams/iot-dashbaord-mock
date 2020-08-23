import 'dart:io';

import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:iot_dashboard_mock/server/device/model.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:test/test.dart';

import '../app.dart';

void main() {
  group('Device', () {
    final harness = Harness()..install();
    const host = Host('localhost', 8080);
    final devicesImageUrlsProcessed =
        devices.map((device) => device.prependHostToImageUrl(host)).toList();

    group('devices', () {
      test('should return device list', () async {
        final responseBodyExpected =
            devicesImageUrlsProcessed.map(fromDevice).map(toJson);

        final response = await harness.agent.get(toPath(AppRoute.devices));

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseBodyExpected)));
      });
      test('should return requested number of devices', () async {
        const limit = 2;
        final responseBodyExpected = devicesImageUrlsProcessed
            .sublist(0, limit)
            .map(fromDevice)
            .map(toJson);

        final response = await harness.agent.get(
            '${toPath(AppRoute.devices)}?${DeviceQueryParam.pageSize.requestName}=$limit');

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseBodyExpected)));
      });
      test('should return request devices from last device id', () async {
        final lastDeviceId = devicesImageUrlsProcessed[0].id;
        final responseExpected =
            devicesImageUrlsProcessed.sublist(1).map(fromDevice).map(toJson);

        final response = await harness.agent.get(
            '${toPath(AppRoute.devices)}?${DeviceQueryParam.lastDeviceId.requestName}=$lastDeviceId');

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseExpected)));
      });
    });
  });
}
