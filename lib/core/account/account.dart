import 'package:iot_dashboard_mock/core/account/model.dart';

Stream<List<Account>> loadAccounts() {
  return Stream.error(UnimplementedError());
}

Stream<List<Account>> findAccount(
    {String name, AccountDbLoader loader = loadAccounts}) {
  return loader().map((accounts) => accounts
      .where((account) => name == null || account.name == name)
      .toList());
}
