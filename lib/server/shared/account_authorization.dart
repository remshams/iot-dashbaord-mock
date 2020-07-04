import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:iot_dashboard_mock/server/iot_dashboard_mock.dart';

class AccountAuthorization extends Authorization {
  final Account account;

  AccountAuthorization(int ownerID, AuthValidator validator,
      {String clientID,
      AuthBasicCredentials credentials,
      List<AuthScope> scopes,
      this.account})
      : super(clientID, ownerID, validator,
            credentials: credentials, scopes: scopes);
}
