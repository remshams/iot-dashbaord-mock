import 'package:meta/meta.dart';

@immutable
class Device {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const Device(this.id, this.name, {this.description, this.imageUrl});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Device &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ imageUrl.hashCode;
}
