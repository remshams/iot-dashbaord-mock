import 'package:faker/faker.dart';
import 'package:iot_dashboard_mock/core/shared/model.dart';

const faker = Faker();

List<InMemoryDatabaseModel<int>> createInMemoryDatabaseModelListFixture(
        {int min = 0, int max = 12}) =>
    List.generate(faker.randomGenerator.integer(max, min: min),
        (index) => InMemoryDatabaseModel(index.toString(), index));
