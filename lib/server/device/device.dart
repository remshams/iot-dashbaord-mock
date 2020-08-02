import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:meta/meta.dart';

@immutable
class DeviceDto {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const DeviceDto(this.id, this.name, this.description, this.imageUrl);
  DeviceDto.fromDevice(Device device)
      : this(device.id, device.name, device.description, device.imageUrl);
  DeviceDto.fromJson(Map<String, dynamic> json)
      : this(json['id'] as String, json['name'] as String,
            json['description'] as String, json['imageUrl'] as String);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DeviceDto &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ imageUrl.hashCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl
      };
}

DeviceDto fromDevice(Device device) => DeviceDto.fromDevice(device);
Map<String, dynamic> toJson(DeviceDto deviceDto) => deviceDto.toJson();
