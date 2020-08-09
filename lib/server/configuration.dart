import 'package:iot_dashboard_mock/server/server.dart';

class ServerConfiguration extends Configuration {
  String host;
  int port;

  ServerConfiguration(String fileName) : super.fromFile(File(fileName));
}
