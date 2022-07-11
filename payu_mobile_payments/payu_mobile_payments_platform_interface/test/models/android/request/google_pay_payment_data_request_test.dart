import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_card_parameters.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_merchant_info.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_data_request.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_payment_method_tokenization_specification_parameters.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_transaction_info.dart';

void main() {
  group('GooglePayPaymentDataRequest', () {
    test('`constants` are correct', () {
      expect(GooglePayPaymentDataRequest.defaultApiVersion, equals(2));
      expect(GooglePayPaymentDataRequest.defaultApiVersionMinor, equals(0));
    });

    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayPaymentDataRequest(
          apiVersion: 9238881845,
          apiVersionMinor: 5803616013,
          merchantInfo: GooglePayMerchantInfo(
            merchantId: '7842654658',
            merchantName: 'aqmlqwczuf',
          ),
          allowedPaymentMethods: [
            GooglePayPaymentMethod(
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
            ),
          ],
          transactionInfo: GooglePayTransactionInfo(
            currencyCode: 'evlzubzmvf',
            countryCode: 'aqmlqwczuf',
            totalPriceStatus: 'zpgfnlwzwh',
            totalPrice: 'pzxjtwfnim',
          ),
        );

        final json = sut.toJson();
        expect(json['apiVersion'], equals(9238881845));
        expect(json['apiVersionMinor'], equals(5803616013));

        final merchantInfoJson = json['merchantInfo'];
        expect(merchantInfoJson['merchantId'], equals('7842654658'));
        expect(merchantInfoJson['merchantName'], equals('aqmlqwczuf'));

        final allowedPaymentMethodsJson = json['allowedPaymentMethods'][0];
        expect(allowedPaymentMethodsJson['type'], equals('uosuxhkdkx'));

        expect(allowedPaymentMethodsJson['parameters']['allowedAuthMethods'], equals(['mqrajzcpkh']));
        expect(allowedPaymentMethodsJson['parameters']['allowedCardNetworks'], equals(['qyezzasycd']));

        final tokenizationSpecificationJson = allowedPaymentMethodsJson['tokenizationSpecification'];
        expect(tokenizationSpecificationJson['type'], equals('ehbftawkbu'));
        expect(tokenizationSpecificationJson['parameters']['gateway'], equals('stunzsdlte'));
        expect(tokenizationSpecificationJson['parameters']['gatewayMerchantId'], equals('cyxapebhbh'));

        expect(json['transactionInfo']['currencyCode'], equals('evlzubzmvf'));
        expect(json['transactionInfo']['countryCode'], equals('aqmlqwczuf'));
        expect(json['transactionInfo']['totalPriceStatus'], equals('zpgfnlwzwh'));
        expect(json['transactionInfo']['totalPrice'], equals('pzxjtwfnim'));
      });
    });
  });
}
