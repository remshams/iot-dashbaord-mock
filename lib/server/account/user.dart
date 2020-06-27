import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

Future<Response> currentUser(Request req) async {
  print(req.authorization);
  return Response.serverError(body: 'Not implemented');
}
