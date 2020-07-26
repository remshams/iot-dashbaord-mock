import 'package:iot_dashboard_mock/server/device/device.dart';
import 'package:iot_dashboard_mock/server/server.dart';
import 'package:iot_dashboard_mock/server/shared/system.dart';

class DeviceController extends ResourceController {
  @Operation.get()
  Future<Response> devices(
      {@Bind.query('lastDeviceId') String lastDeviceId,
      @Bind.query('limit') int limit}) async {
    final system = request.attachments[RequestAttachment.system] as System;
    return Response.ok(await system.deviceDatabase
        .list()
        .map((devices) => devices.map(fromDevice).toList())
        .first);
  }
}
