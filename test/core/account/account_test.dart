import 'package:collection/collection.dart';
import 'package:iot_dashboard_mock/core/account/account.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:test/test.dart';

import 'fixture.dart';

void main() {
  group('Account', () {
    final accounts = createAccountListFixture(min: 2);
    final createLoader = ({List<Account> accounts}) =>
        () => Stream.value(accounts ?? createAccountListFixture(min: 2));
    group('findAccount', () {
      test('should emit all accounts in case no query is specified', () {
        expect(findAccount(loader: createLoader(accounts: accounts)),
            emits(accounts));
      });
      test('should emit accounts filtered by name', () {
        const name = 'testName';
        final accountsWithName = [
          createAccountFixture(name: name),
          ...accounts
        ];
        final accounts$ = findAccount(
                name: name, loader: createLoader(accounts: accountsWithName))
            .map((accountsReturned) => const ListEquality()
                .equals(accountsReturned, [accountsWithName[0]]));

        expect(accounts$, emits(true));
      });
      test(
          'should emit empty list in case no account with the given name exists',
          () {
        expect(findAccount(name: 'doesNotExist', loader: createLoader()),
            emits([]));
      });
    });
  });
}
