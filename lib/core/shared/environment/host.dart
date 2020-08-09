import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Host extends Equatable {
  final String host;
  final int number;

  const Host(this.host, this.number);

  @override
  List<Object> get props => [host, number];
}
