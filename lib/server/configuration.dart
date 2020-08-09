import 'package:iot_dashboard_mock/server/server.dart';

class ServerConfiguration extends Configuration {
  String host;
  int port;

  ServerConfiguration(this.host, this.port);
  ServerConfiguration.fromConfig(String fileName)
      : super.fromFile(File(fileName));
}
