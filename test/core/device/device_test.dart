import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:test/test.dart';

import '../shared/environment/fixture.dart';
import 'fixture.dart';

void main() {
  group('Device', () {
    group('prependHostToImageUrl', () {
      final host = createHostFixture();
      final device = createDeviceFixture(imageUrl: 'test/test.jpg');
      test('should add host to image url', () {
        expect(
            device.prependHostToImageUrl(host),
            equals(device.copyWith(
                imageUrl: prependHostToUrl(device.imageUrl, host))));
      });
      test('should not add host in case image url is not set', () {
        final deviceNoImageUrl = createDeviceFixture(imageUrl: null);

        expect(deviceNoImageUrl.prependHostToImageUrl(host),
            equals(deviceNoImageUrl));
      });
    });
  });
}
