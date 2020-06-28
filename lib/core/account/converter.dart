import 'package:iot_dashboard_mock/core/account/model.dart';

Account fromAccountJson(Map<String, dynamic> accountJson) {
  return Account(accountJson['id'] as int, accountJson['name'] as String,
      accountJson['email'] as String);
}

Map<String, dynamic> toAccountJson(Account account) {
  return {'id': account.id, 'name': account.name, 'email': account.email};
}

List<Account> fromDbJson(Map<String, dynamic> dbJson) {
  return (dbJson['accounts'] as Iterable<Map<String, dynamic>>)
      .map(fromAccountJson)
      .toList();
}
