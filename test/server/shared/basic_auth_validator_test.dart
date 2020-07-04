import 'package:iot_dashboard_mock/server/shared/basic_auth_validator.dart';
import 'package:iot_dashboard_mock/server/shared/system.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../core/account/fixture.dart';
import 'fixture.dart';

void main() {
  group('BasicAuthValidator', () {
    final authorizationParser = MockAuthorizationParser();
    final accountRepository = MockAccountRepository();
    final account = createAccountFixture();
    final credentials =
        createAuthBasicCredentialsFixture(username: account.name);
    final system = System(accountRepository);
    final validator = BasicAuthValidator(system);

    setUp(() {
      when(accountRepository.findAccount(name: credentials.username))
          .thenAnswer((_) => Stream.value([account]));
    });

    group('validate', () {
      test('should return authorization in case valid', () async {
        final authorizationReturned =
            await validator.validate(authorizationParser, credentials);
        expect(authorizationReturned.ownerID, equals(account.id));
        expect(authorizationReturned.account, equals(account));
      });
      test('should return null in case not valid', () async {
        when(accountRepository.findAccount(name: credentials.username))
            .thenAnswer((_) => Stream.value([]));

        expect(await validator.validate(authorizationParser, credentials),
            equals(null));
      });
    });
  });
}
