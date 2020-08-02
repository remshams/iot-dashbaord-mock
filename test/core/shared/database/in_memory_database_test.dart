import 'package:iot_dashboard_mock/core/shared/database/in_memory_database.dart';
import 'package:iot_dashboard_mock/core/shared/database/model.dart';
import 'package:test/test.dart';

import '../../../matchers/iterable.dart';
import 'fixture.dart';

void main() {
  group('InMemoryDatabase', () {
    final models = createDatabaseModelListFixture(min: 10);
    final repository = InMemoryDatabase.fromModelsIterable(models);
    group('list', () {
      test('should emit list of all stored models', () {
        expect(repository.list(), emits(deepEquals(models)));
      });
      test('should emit list number of requested models', () {
        expect(
            repository.list(limit: 2), emits(deepEquals(models.sublist(0, 2))));
      });
      test('should emit list of models starting from given last model id', () {
        expect(repository.list(lastModelId: models[0].id),
            emits(deepEquals(models.sublist(1))));
      });
      test(
          'should emit list of models starting from last id with the requested number of models',
          () {
        expect(repository.list(lastModelId: models[2].id, limit: 2),
            emits(deepEquals(models.sublist(3, 5))));
      });
      test(
          'should emit list of models when number of requested models exceeds models list length',
          () {
        expect(
            repository.list(limit: models.length), emits(deepEquals(models)));
      });
      test('should emit empty list when lastModelId is last model in list', () {
        expect(repository.list(lastModelId: models.last.id),
            emits(<DatabaseModel>[]));
      });
      test(
          'should emit rest of list when last model plus number of requested models exceeds model list length',
          () {
        expect(
            repository.list(
                lastModelId: models[models.length - 4].id, limit: 4),
            emits(deepEquals(models.sublist(models.length - 3))));
      });
    });
  });
}
