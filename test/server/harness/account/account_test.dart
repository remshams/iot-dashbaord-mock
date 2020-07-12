import 'dart:io';

import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/server/dto/account.dart';
import 'package:iot_dashboard_mock/server/routing/routes.dart';

import '../app.dart';

Future main() async {
  final harness = Harness()..install();

  group('currentAccount', () {
    group('GET', () {
      test('should return account', () async {
        final response =
            await harness.agent.get(toPath(AppRoute.currentAccount));

        expect(response, hasStatus(HttpStatus.ok));
        expect(response,
            hasBody(equals(AccountDto.fromAccount(accounts[0]).toJson())));
      });
    });
  });
}
