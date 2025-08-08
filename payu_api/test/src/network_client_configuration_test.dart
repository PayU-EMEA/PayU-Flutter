import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_api/src/network_client_configuration.dart';

void main() {
  group('`NetworkClientConfiguration`', () {
    group('`environment`', () {
      test('when `environment` is `production` then should return correct `NetworkClientConfiguration`', () {
        final sut = NetworkClientConfiguration.environment(Environment.production);
        expect(sut.baseUrl, equals('https://mobilesdk.secure.payu.com'));
      });

      test('when `environment` is `sandbox` then should return correct `NetworkClientConfiguration`', () {
        final sut = NetworkClientConfiguration.environment(Environment.sandbox);
        expect(sut.baseUrl, equals('https://mobilesdk.snd.payu.com'));
      });
    });
  });
}
