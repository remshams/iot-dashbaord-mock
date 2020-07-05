import 'package:iot_dashboard_mock/server/account/user.dart';
import 'package:iot_dashboard_mock/server/dto/account.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../core/account/fixture.dart';
import '../harness/app.dart';
import '../shared/fixture.dart';

void main() {
  group('Server Account', () {
    final account = createAccountFixture();
    final accountAuthorization =
        createAccountAuthorizationFixture(account: account);
    final request = MockRequest();

    setUp(() {
      when(request.authorization).thenReturn(accountAuthorization);
    });

    group('currentUser', () {
      test('should return response with current user account', () async {
        final response = await currentUser(request);

        expect(response.body, equals(AccountDto.fromAccount(account)));
      });
    });
  });
}
