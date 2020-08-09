import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Host extends Equatable {
  final String host;
  final int port;

  const Host(this.host, this.port);

  @override
  List<Object> get props => [host, port];
}

String prependHostToUrl(String url, Host host) => url.startsWith('/')
    ? '${host.host}:${host.port}$url'
    : '${host.host}:${host.port}/$url';
