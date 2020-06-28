import 'package:iot_dashboard_mock/core/account/account.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:test/test.dart';

import '../../matchers/iterable.dart';
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

        expect(
            findAccount(
                name: name, loader: createLoader(accounts: accountsWithName)),
            emits(deepEquals([accountsWithName[0]])));
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
