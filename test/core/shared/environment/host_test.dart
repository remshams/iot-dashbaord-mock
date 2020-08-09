import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:test/test.dart';

void main() {
  group('Host', () {
    group('prependHostToUrl', () {
      const host = Host('localhost', 8080);
      const url = 'test/test';
      final urlExpected = '${host.host}:${host.port.toString()}/$url';
      test('should append host and port to url', () {
        expect(prependHostToUrl(url, host), equals(urlExpected));
      });
      test('should only add slash in case not already there', () {
        const urlWithSlash = '/$url';

        expect(prependHostToUrl(urlWithSlash, host), equals(urlExpected));
      });
    });
  });
}
