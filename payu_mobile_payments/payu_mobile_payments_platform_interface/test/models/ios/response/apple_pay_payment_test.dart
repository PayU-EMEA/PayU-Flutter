import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/response/apple_pay_payment.dart';

import '../../../resources/resource_reader.dart';

void main() {
  group('ApplePayPayment', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_apple_pay_payment.json');
        final sut = ApplePayPayment.fromJson(json);

        expect(sut.token.paymentData, equals('KWNUUKPDOJ'));
      });
    });
  });
}
