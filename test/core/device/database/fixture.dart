import 'package:iot_dashboard_mock/core/device/database/device.dart';
import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:mockito/mockito.dart';

import '../fixture.dart';

class MockDeviceDatabase extends Mock implements DeviceDatabase {}

DatabaseDevice createDatabaseDeviceFixture(
        {String id = '0',
        String name = 'testDevice',
        String description = 'testDeviceDescription'}) =>
    convertToDatabaseDevice(
        createDeviceFixture(id: id, name: name, description: description));

List<DatabaseDevice> createDatabaseDeviceListFixture(
        {int min = 0, int max = 12}) =>
    createDeviceListFixture(min: min, max: max)
        .map(convertToDatabaseDevice)
        .toList();
