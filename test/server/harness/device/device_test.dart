import 'dart:io';

import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:test/test.dart';

import '../app.dart';

void main() {
  group('Device', () {
    final harness = Harness()..install();

    // TODO Add tests for filter params
    group('devices', () {
      test('should return device list', () async {
        final responseBodyExpected = devices.map(fromDevice).map(toJson);

        final response = await harness.agent.get(toPath(AppRoute.devices));

        expect(response, hasStatus(HttpStatus.ok));
        expect(response, hasBody(equals(responseBodyExpected)));
      });
    });
  });
}
