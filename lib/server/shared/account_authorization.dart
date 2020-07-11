import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:iot_dashboard_mock/server/server.dart';

class AccountAuthorization extends Authorization {
  final Account account;

  AccountAuthorization(this.account, AuthValidator validator)
      : super(
          null,
          null,
          validator,
        );
}
