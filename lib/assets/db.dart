import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:iot_dashboard_mock/core/device/device.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';

const accounts = [Account('0', 'mathias', 'remshams@gmail.com')];
List<Device> devices = [
  Device('0', 'SL63',
      description: 'SL63 AMG', imageUrl: '${toPath(AppRoute.files)}/sl63.jpg'),
  Device('1', 'JD 9620 RX',
      description: 'John Deere 9620 RX',
      imageUrl: '${toPath(AppRoute.files)}/jd.jpg'),
  Device('2', 'Velociraptor', imageUrl: '${toPath(AppRoute.files)}/velo.jpg'),
  Device('3', 'MacBook Pro 16',
      description: 'MacBook Pro 16 Zoll 8Core 16Gb',
      imageUrl: '${toPath(AppRoute.files)}/mbp.jpg'),
];
