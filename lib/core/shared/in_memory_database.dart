import 'package:iot_dashboard_mock/core/shared/model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

class InMemoryDatabase {
  BehaviorSubject<Map<String, InMemoryDatabaseModel>> _models;

  InMemoryDatabase(Map<String, InMemoryDatabaseModel> models)
      : _models = BehaviorSubject.seeded(models);
  InMemoryDatabase.fromModelsIterable(Iterable<InMemoryDatabaseModel> models)
      : this(_modelsFromIterable(models));

  static Map<String, InMemoryDatabaseModel> _modelsFromIterable(
          Iterable<InMemoryDatabaseModel> models) =>
      Map.fromIterable(models, key: (dynamic model) => model.id as String);

  Stream<List<InMemoryDatabaseModel>> list({String lastModelId, int limit}) =>
      _models.value.isEmpty
          ? Stream.value([])
          : _models.map((models) {
              final firstModelIndex = _firstModelIndex(models, lastModelId);
              return Tuple3(
                  firstModelIndex,
                  _lastModelIndex(firstModelIndex, models.length, limit),
                  models);
            }).map((tuple) {
              return tuple.item3.values
                  .toList()
                  .sublist(tuple.item1, tuple.item2)
                  .toList();
            });

  int _firstModelIndex(
          Map<String, InMemoryDatabaseModel> models, String lastModelId) =>
      models[lastModelId] != null
          ? models.values.toList().indexOf(models[lastModelId]) + 1
          : 0;
  int _lastModelIndex(
          int startIndex, int totalNumberOfModels, int numberOfModels) =>
      numberOfModels == null
          ? totalNumberOfModels
          : startIndex + numberOfModels <= totalNumberOfModels
              ? startIndex + numberOfModels
              : totalNumberOfModels;
}
