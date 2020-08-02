import 'package:meta/meta.dart';

@immutable
abstract class DatabaseModel {
  final String id;

  const DatabaseModel(this.id);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DatabaseModel && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
