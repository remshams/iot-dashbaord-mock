import 'package:iot_dashboard_mock/server/routing/routes.dart';
import 'package:test/test.dart';

void main() {
  group('Routing', () {
    group('toPath', () {
      test('should return path from enum', () {
        expect(toPath(AppRoute.currentAccount), equals('/currentUser'));
      });
    });
  });
}
