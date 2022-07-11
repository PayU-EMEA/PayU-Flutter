import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/response/apple_pay_payment_token.dart';

import '../../../resources/resource_reader.dart';

void main() {
  group('ApplePayPaymentToken', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_apple_pay_payment_token.json');
        final sut = ApplePayPaymentToken.fromJson(json);

        expect(sut.paymentData, equals('KWNUUKPDOJ'));
      });
    });
  });
}
