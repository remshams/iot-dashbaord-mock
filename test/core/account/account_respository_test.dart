import 'package:iot_dashboard_mock/core/account/account_repository.dart';
import 'package:test/test.dart';

import '../../matchers/iterable.dart';
import 'fixture.dart';

void main() {
  group('Account Repository', () {
    final accounts = createAccountListFixture(min: 2);
    final accountsRepository = InMemoryAccountRepository.fromIterable(accounts);

    group('findAccount', () {
      test('should emit all accounts in case no query is specified', () {
        expect(accountsRepository.findAccount(), emits(accounts));
      });
      test('should emit accounts filtered by name', () {
        const name = 'testName';
        final accountsWithName = [
          createAccountFixture(id: 99, name: name),
          ...accounts
        ];

        expect(
            InMemoryAccountRepository.fromIterable(accountsWithName)
                .findAccount(name: name),
            emits(deepEquals([accountsWithName[0]])));
      });
      test(
          'should emit empty list in case no account with the given name exists',
          () {
        expect(accountsRepository.findAccount(name: 'doesNotExist'), emits([]));
      });
    });
  });
}
