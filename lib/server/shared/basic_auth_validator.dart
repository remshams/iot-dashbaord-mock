import 'package:iot_dashboard_mock/server/iot_dashboard_mock.dart';

class BasicAuthValidator extends AuthValidator {
  @override
  FutureOr<Authorization> validate<AuthBasicCredentials>(
      AuthorizationParser<AuthBasicCredentials> parser,
      AuthBasicCredentials authorizationData,
      {List<AuthScope> requiredScope}) {
    return null;
  }
}
