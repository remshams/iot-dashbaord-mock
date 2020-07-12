import 'package:iot_dashboard_mock/server/dto/account.dart';
import 'package:test/test.dart';

void main() {
  group('AccountDto', () {
    const accountDto = AccountDto('0', 'test', 'test@test.de');
    final accountJson = {
      'id': accountDto.id,
      'username': accountDto.username,
      'email': accountDto.email
    };
    group('fromJson', () {
      test('should create from json', () {
        expect(AccountDto.fromJson(accountJson), equals(accountDto));
      });
    });
    group('toJson', () {
      test('should convert to json', () {
        expect(accountDto.toJson(), equals(accountJson));
      });
    });
  });
}
