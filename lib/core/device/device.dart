import 'package:meta/meta.dart';

@immutable
class Device {
  final String id;
  final String name;
  final String description;

  const Device(this.id, this.name, {this.description});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Device &&
        o.id == id &&
        o.name == name &&
        o.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
