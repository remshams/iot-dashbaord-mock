import 'package:aqueduct/aqueduct.dart';
import 'package:iot_dashboard_mock/server/shared/basic_auth_validator.dart';
import 'package:iot_dashboard_mock/server/shared/domains.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../core/account/fixture.dart';
import '../../core/device/database/fixture.dart';
import 'fixture.dart';

void main() {
  group('BasicAuthValidator', () {
    final authorizationParser = MockAuthorizationParser<AuthBasicCredentials>();
    final accountRepository = MockAccountRepository();
    final deviceDatabase = MockDeviceDatabase();
    final account = createAccountFixture();
    final credentials =
        createAuthBasicCredentialsFixture(username: account.username);
    final domains = Domains(accountRepository, deviceDatabase);
    final validator = BasicAuthValidator(domains);

    setUp(() {
      when(accountRepository.findAccount(name: credentials.username))
          .thenAnswer((_) => Stream.value([account]));
    });

    group('validate', () {
      test('should return authorization in case valid', () async {
        final authorizationReturned = await validator
            .validate<AuthBasicCredentials>(authorizationParser, credentials);
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
