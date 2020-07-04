import 'package:iot_dashboard_mock/server/iot_dashboard_mock.dart';
import 'package:iot_dashboard_mock/server/shared/account_authorization.dart';
import 'package:iot_dashboard_mock/server/shared/system.dart';

class BasicAuthValidator extends AuthValidator {
  final System _system;

  BasicAuthValidator(this._system);

  @override
  FutureOr<AccountAuthorization> validate<T>(
      AuthorizationParser<T> parser, T authorizationData,
      {List<AuthScope> requiredScope}) {
    final basicAuthData = authorizationData as AuthBasicCredentials;
    return _system.accountRepository
        .findAccount(name: basicAuthData.username)
        .map((accounts) => accounts.length == 1
            ? AccountAuthorization(accounts[0].id, this, account: accounts[0])
            : null)
        .single;
  }
}
