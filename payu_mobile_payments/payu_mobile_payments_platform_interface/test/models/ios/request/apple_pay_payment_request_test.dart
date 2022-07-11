import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_contact.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_payment_request.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_summary_item.dart';

void main() {
  group('ApplePayPaymentRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePayPaymentRequest(
          merchantIdentifier: 'YOEHZBRKDW',
          countryCode: 'ZFCJYNAOCA',
          currencyCode: 'ESZJLHSBJP',
          shippingContact: ApplePayContact(
            emailAddress: 'YOEHZBRKDW@address.com',
          ),
          paymentSummaryItems: [
            ApplePaySummaryItem(
              label: 'MLVCUVKEPH',
              amount: 4711528250,
            ),
          ],
        );

        final json = model.toJson();

        expect(json['merchantIdentifier'], equals('YOEHZBRKDW'));
        expect(json['countryCode'], equals('ZFCJYNAOCA'));
        expect(json['currencyCode'], equals('ESZJLHSBJP'));
        expect(json['shippingContact']['emailAddress'], equals('YOEHZBRKDW@address.com'));
        expect(json['paymentSummaryItems'][0]['label'], equals('MLVCUVKEPH'));
        expect(json['paymentSummaryItems'][0]['amount'], equals(4711528250));
      });
    });
  });
}
