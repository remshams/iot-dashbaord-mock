import 'package:faker/faker.dart';
import 'package:iot_dashboard_mock/core/shared/database/model.dart';
import 'package:meta/meta.dart';

const faker = Faker();

@immutable
class DatabaseModelInt implements DatabaseModel {
  @override
  final String id;
  final int value;

  const DatabaseModelInt(this.id, this.value);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DatabaseModelInt && o.id == id && o.value == value;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode;
}

List<DatabaseModelInt> createDatabaseModelListFixture(
        {int min = 0, int max = 12}) =>
    List.generate(faker.randomGenerator.integer(max, min: min),
        (index) => DatabaseModelInt(index.toString(), index));
