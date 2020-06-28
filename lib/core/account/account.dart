import 'dart:convert';
import 'dart:io';

import 'package:iot_dashboard_mock/core/account/converter.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';

AccountDbLoader createJsonFileLoader(String path) {
  return () => Stream.fromFuture(File(path).readAsString())
      .map((dbJson) => jsonDecode(dbJson) as Map<String, dynamic>)
      .map(fromDbJson);
}

Stream<List<Account>> loadAccounts() {
  return Stream.error(UnimplementedError());
}

Stream<List<Account>> findAccount(
    {String name, AccountDbLoader loader = loadAccounts}) {
  return loader().map((accounts) => accounts
      .where((account) => name == null || account.name == name)
      .toList());
}
