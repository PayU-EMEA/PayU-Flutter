import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification_parameters.dart';

void main() {
  group('GooglePayPaymentMethodTokenizationSpecification', () {
    test('`constants` are correct', () {
      expect(GooglePayPaymentMethodTokenizationSpecification.typePaymentGateway, equals('PAYMENT_GATEWAY'));
    });

    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayPaymentMethodTokenizationSpecification(
          type: 'evlzubzmvf',
          parameters: GooglePayPaymentMethodTokenizationSpecificationParameters(
            gateway: 'aqmlqwczuf',
            gatewayMerchantId: 'zpgfnlwzwh',
          ),
        );

        final json = sut.toJson();
        expect(json['type'], equals('evlzubzmvf'));
        expect(json['parameters']['gateway'], equals('aqmlqwczuf'));
        expect(json['parameters']['gatewayMerchantId'], equals('zpgfnlwzwh'));
      });
    });
  });
}
