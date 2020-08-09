import 'package:iot_dashboard_mock/server/server.dart';
import 'package:iot_dashboard_mock/server/shared/account_authorization.dart';
import 'package:iot_dashboard_mock/server/shared/domains.dart';

class BasicAuthValidator extends AuthValidator {
  final Domains _domains;

  BasicAuthValidator(this._domains);

  @override
  FutureOr<AccountAuthorization> validate<T>(
      AuthorizationParser<T> parser, T authorizationData,
      {List<AuthScope> requiredScope}) {
    final basicAuthData = authorizationData as AuthBasicCredentials;
    return _domains.accountRepository
        .findAccount(name: basicAuthData.username)
        .map((accounts) => accounts.length == 1
            ? AccountAuthorization(
                accounts[0],
                this,
              )
            : null)
        .single;
  }
}
