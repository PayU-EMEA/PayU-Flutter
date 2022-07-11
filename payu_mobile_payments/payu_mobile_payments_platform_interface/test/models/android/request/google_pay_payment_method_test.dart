import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_card_parameters.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification_parameters.dart';

void main() {
  group('GooglePayPaymentMethod', () {
    test('`constants` are correct', () {
      expect(GooglePayPaymentMethod.typeCard, equals('CARD'));
    });

    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayPaymentMethod(
          type: 'uosuxhkdkx',
          parameters: GooglePayCardParameters(
            allowedAuthMethods: ['mqrajzcpkh'],
            allowedCardNetworks: ['qyezzasycd'],
          ),
          tokenizationSpecification: GooglePayPaymentMethodTokenizationSpecification(
            type: 'ehbftawkbu',
            parameters: GooglePayPaymentMethodTokenizationSpecificationParameters(
              gateway: 'stunzsdlte',
              gatewayMerchantId: 'cyxapebhbh',
            ),
          ),
        );

        final json = sut.toJson();
        expect(json['type'], equals('uosuxhkdkx'));

        expect(json['parameters']['allowedAuthMethods'], equals(['mqrajzcpkh']));
        expect(json['parameters']['allowedCardNetworks'], equals(['qyezzasycd']));

        expect(json['tokenizationSpecification']['type'], equals('ehbftawkbu'));
        expect(json['tokenizationSpecification']['parameters']['gateway'], equals('stunzsdlte'));
        expect(json['tokenizationSpecification']['parameters']['gatewayMerchantId'], equals('cyxapebhbh'));
      });
    });
  });
}
