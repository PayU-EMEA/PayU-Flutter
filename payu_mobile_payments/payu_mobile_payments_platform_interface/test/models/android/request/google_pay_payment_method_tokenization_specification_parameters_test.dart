import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification_parameters.dart';

void main() {
  group('GooglePayPaymentMethodTokenizationSpecificationParameters', () {
    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayPaymentMethodTokenizationSpecificationParameters(
          gateway: 'evlzubzmvf',
          gatewayMerchantId: 'aqmlqwczuf',
        );

        final json = sut.toJson();
        expect(json['gateway'], equals('evlzubzmvf'));
        expect(json['gatewayMerchantId'], equals('aqmlqwczuf'));
      });
    });
  });
}
