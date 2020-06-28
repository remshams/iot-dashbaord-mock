import 'package:iot_dashboard_mock/core/account/converter.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';
import 'package:test/test.dart';

import 'fixture.dart';

void main() {
  group('Account Converter', () {
    const id = 0;
    const name = 'test';
    const email = 'test@test.de';
    const accountJson = {'id': id, 'name': name, 'email': email};
    const account = Account(id, name, email);
    group('fromAccountJson', () {
      test('should return account from json', () {
        expect(fromAccountJson(accountJson), equals(account));
      });
    });
    group('fromDbJson', () {
      final accounts = createAccountListFixture(min: 2);
      final dbJson = {'accounts': accounts.map(toAccountJson)};
      test('should return accounts', () {
        expect(fromDbJson(dbJson), equals(accounts));
      });
    });
    group('toAccountJson', () {
      test('should return account json', () {
        expect(toAccountJson(account), equals(accountJson));
      });
    });
  });
}
