import 'package:mockito/mockito.dart';

import '../harness/app.dart';

class MockAuthorizationParser extends Mock implements AuthorizationParser {}

AuthBasicCredentials createAuthBasicCredentialsFixture(
        {String username = 'username', String password = 'password'}) =>
    AuthBasicCredentials()
      ..username = 'test'
      ..password = 'test';
