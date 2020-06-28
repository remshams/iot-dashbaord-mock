import 'package:iot_dashboard_mock/server/iot_dashboard_mock.dart';
import 'package:iot_dashboard_mock/server/shared/system.dart';

class SystemController extends Controller {
  final System system;

  SystemController(this.system);

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    request.attachments[RequestAttachment.accountController] = system;
    return request;
  }
}
