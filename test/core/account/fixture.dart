import 'package:faker/faker.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';

const faker = Faker();

Account createAccountFixture(
    {int id = 0, String name = 'user', String email = 'user@gmail.com'}) {
  return Account(id, name, email);
}

List<Account> createAccountListFixture({int min = 0, int max = 12}) {
  return List.generate(
      faker.randomGenerator.integer(max, min: min),
      (index) => createAccountFixture(
          id: index, name: faker.person.name(), email: faker.internet.email()));
}
