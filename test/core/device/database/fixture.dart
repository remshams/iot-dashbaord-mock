import 'package:iot_dashboard_mock/core/device/database/device.dart';

import '../fixture.dart';

DatabaseDevice createDatabaseDeviceFixture(
        {String id = '0',
        String name = 'testDevice',
        String description = 'testDeviceDescription'}) =>
    convertDevice(
        createDeviceFixture(id: id, name: name, description: description));

List<DatabaseDevice> createDatabaseDeviceListFixture(
        {int min = 0, int max = 12}) =>
    createDeviceListFixture(min: min, max: max).map(convertDevice).toList();
