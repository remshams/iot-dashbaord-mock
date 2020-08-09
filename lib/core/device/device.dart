import 'package:equatable/equatable.dart';
import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:meta/meta.dart';

@immutable
class Device extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const Device(this.id, this.name, {this.description, this.imageUrl});

  @override
  List<Object> get props => [id, name, description, imageUrl];

  Device copyWith({
    String id,
    String name,
    String description,
    String imageUrl,
  }) {
    return Device(
      id ?? this.id,
      name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Device prependHostToImageUrl(Host host) => imageUrl != null
      ? copyWith(imageUrl: prependHostToUrl(imageUrl, host))
      : this;
}
