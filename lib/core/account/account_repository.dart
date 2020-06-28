import 'package:iot_dashboard_mock/core/account/model.dart';

class InMemporyAccountRepository {
  final Map<int, Account> _accounts;

  const InMemporyAccountRepository(this._accounts);

  InMemporyAccountRepository.fromIterable(Iterable<Account> accounts)
      : this(_accountsFromIterable(accounts));

  static Map<int, Account> _accountsFromIterable(Iterable<Account> accounts) {
    return Map.fromIterable(accounts, key: (account) => account.id as int);
  }

  Stream<List<Account>> findAccount({String name}) {
    return Stream.value(_accounts.values).map((accounts) => accounts
        .where((account) => name == null || account.name == name)
        .toList());
  }
}
