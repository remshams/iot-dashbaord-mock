import 'package:iot_dashboard_mock/core/account/model.dart';

abstract class AccountRepository {
  Stream<List<Account>> findAccount({String name});
}

class InMemoryAccountRepository implements AccountRepository {
  final Map<int, Account> _accounts;

  const InMemoryAccountRepository(this._accounts);

  InMemoryAccountRepository.fromIterable(Iterable<Account> accounts)
      : this(_accountsFromIterable(accounts));

  static Map<int, Account> _accountsFromIterable(Iterable<Account> accounts) {
    return Map.fromIterable(accounts, key: (account) => account.id as int);
  }

  @override
  Stream<List<Account>> findAccount({String name}) {
    return Stream.value(_accounts.values).map((accounts) => accounts
        .where((account) => name == null || account.name == name)
        .toList());
  }
}
