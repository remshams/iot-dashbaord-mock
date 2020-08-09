import 'package:iot_dashboard_mock/iot_dashboard_mock.dart';
import 'package:iot_dashboard_mock/server/configuration.dart';
import 'package:iot_dashboard_mock/server/server.dart';

Future main() async {
  const configPath = 'config.yaml';
  final serverConfiguration = ServerConfiguration.fromConfig(configPath);
  final app = Application<IotDashboardMockChannel>()
    ..options.configurationFilePath = configPath
    ..options.address = serverConfiguration.host
    ..options.port = serverConfiguration.port;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
