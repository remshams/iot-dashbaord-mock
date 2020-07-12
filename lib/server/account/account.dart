import 'package:aqueduct/aqueduct.dart';
import 'package:iot_dashboard_mock/server/dto/account.dart';
import 'package:iot_dashboard_mock/server/shared/account_authorization.dart';

Future<Response> currentAccount(Request req) async {
  final accountAuthorization = req.authorization as AccountAuthorization;
  return Response.ok(AccountDto.fromAccount(accountAuthorization.account));
}
