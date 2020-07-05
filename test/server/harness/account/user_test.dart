import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/server/dto/account.dart';

import '../app.dart';

Future main() async {
  final harness = Harness()..install();

  group('currentUser', () {
    group('GET', () {
      test('should return user', () async {
        final response = await harness.agent.get('currentUser');

        expect(response, hasStatus(HttpStatus.ok));
        expect(response,
            hasBody(equals(AccountDto.fromAccount(accounts[0]).toJson())));
      });
    });
  });
}
