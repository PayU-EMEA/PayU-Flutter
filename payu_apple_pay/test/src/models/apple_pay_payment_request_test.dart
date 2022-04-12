import 'package:flutter_test/flutter_test.dart';

import 'package:payu_apple_pay/src/models/apple_pay_contact.dart';
import 'package:payu_apple_pay/src/models/apple_pay_payment_request.dart';
import 'package:payu_apple_pay/src/models/apple_pay_summary_item.dart';

void main() {
  group('ApplePayPaymentRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = ApplePayPaymentRequest(
          merchantIdentifier: 'merchantIdentifier',
          countryCode: 'PL',
          currencyCode: 'PLN',
          shippingContact: ApplePayContact(emailAddress: 'email@address.com'),
          paymentSummaryItems: [ApplePaySummaryItem(label: 'label', amount: 25)],
        );
        final json = model.toJson();

        expect(json['merchantIdentifier'], equals(model.merchantIdentifier));
        expect(json['countryCode'], equals(model.countryCode));
        expect(json['currencyCode'], equals(model.currencyCode));
        expect(json['shippingContact']['emailAddress'], equals(model.shippingContact.emailAddress));
        expect(json['paymentSummaryItems'][0]['label'], equals(model.paymentSummaryItems[0].label));
        expect(json['paymentSummaryItems'][0]['amount'], equals(model.paymentSummaryItems[0].amount));
      });
    });
  });
}
