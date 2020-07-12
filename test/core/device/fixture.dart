import 'package:faker/faker.dart';
import 'package:iot_dashboard_mock/core/device/device.dart';

const faker = Faker();

Device createDeviceFixture(
        {String id = '0',
        String name = 'testDevice',
        String description = 'testDeviceDescription'}) =>
    Device(id, name, description: description);

List<Device> createDeviceListFixture({int min = 0, int max = 12}) =>
    List.generate(
        max - min,
        (index) => createDeviceFixture(
            id: index.toString(),
            name: faker.lorem.word(),
            description: faker.lorem.sentence()));
