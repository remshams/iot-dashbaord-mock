import 'package:iot_dashboard_mock/server/server.dart';

class DeviceController extends ResourceController {
  @Operation.get()
  Future<Response> devices(
      {@Bind.query('lastDeviceId') String lastDeviceId,
      @Bind.query('limit') int limit}) async {
    return Response.serverError(body: 'Not implemented');
  }
}
