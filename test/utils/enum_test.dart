import 'package:iot_dashboard_mock/utils/enum.dart';
import 'package:test/test.dart';

enum TestEnum { test }

void main() {
  group('Enum', () {
    group('removeEnumPrefix', () {
      test('should replace with default separator', () {
        expect(removeEnumPrefix(TestEnum.test), equals('test'));
      });
      test('should replace with custom separator', () {
        const separator = '/';
        expect(removeEnumPrefix(TestEnum.test, separator: separator),
            equals('${separator}test'));
      });
    });
  });
}
