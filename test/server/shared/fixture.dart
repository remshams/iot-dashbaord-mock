import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:iot_dashboard_mock/server/shared/account_authorization.dart';
import 'package:mockito/mockito.dart';

import '../../core/account/fixture.dart';
import '../harness/app.dart';

class MockAuthorizationParser extends Mock implements AuthorizationParser {}

class MockRequest extends Mock implements Request {}

class MockAuthValidator extends Mock implements AuthValidator {}

AuthBasicCredentials createAuthBasicCredentialsFixture(
        {String username = 'username', String password = 'password'}) =>
    AuthBasicCredentials()
      ..username = 'test'
      ..password = 'test';

AccountAuthorization createAccountAuthorizationFixture(
    {Account account, AuthValidator validator}) {
  final fixtureAccount = createAccountFixture();
  return AccountAuthorization(
      account ?? fixtureAccount, validator ?? MockAuthValidator());
}
