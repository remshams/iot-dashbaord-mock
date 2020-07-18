import 'package:meta/meta.dart';

@immutable
class InMemoryDatabaseModel<Model> {
  final String id;
  final Model model;

  const InMemoryDatabaseModel(this.id, this.model);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InMemoryDatabaseModel<Model> && o.id == id && o.model == model;
  }

  @override
  int get hashCode => id.hashCode ^ model.hashCode;
}
