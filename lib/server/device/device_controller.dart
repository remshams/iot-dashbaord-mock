import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:iot_dashboard_mock/server/server.dart';
import 'package:iot_dashboard_mock/server/shared/domains.dart';

class DeviceController extends ResourceController {
  final Domains _domains;

  DeviceController(this._domains);

  @Operation.get()
  Future<Response> devices(
      {@Bind.query('lastDeviceId') String lastDeviceId,
      @Bind.query('limit') int limit}) async {
    return Response.ok(await _domains.deviceDatabase
        .list(lastDeviceId: lastDeviceId, numberOfDevices: limit)
        .map((devices) => devices.map(fromDevice).toList())
        .first);
  }
}
