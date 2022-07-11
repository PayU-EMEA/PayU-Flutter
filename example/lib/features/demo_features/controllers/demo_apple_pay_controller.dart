import 'package:example/core/ui/snackbar.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoApplePayController extends GetxController {
  late final _configuration = _buildApplePayPaymentConfiguration();
  late final _service = PayuMobilePayments();

  void demo() async {
    if (await _service.canMakePayment(_configuration)) {
      final authorizationCode = await _service.makePayment(_configuration);
      snackbar('authorizationCode: $authorizationCode');
    } else {
      snackbar('cannotMakePayments');
    }
  }

  PaymentConfiguration _buildApplePayPaymentConfiguration() {
    return PaymentConfiguration.applePay(
      request: ApplePayPaymentRequestBuilder()
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withMerchantIdentifier('merchantIdentifier')
          .withShippingContact(
            const ApplePayContact(
              emailAddress: 'email@address.com',
            ),
          )
          .withPaymentSummaryItems(
        const [
          ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
          ApplePaySummaryItem(label: 'Napkin', amount: 49),
          ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
        ],
      ).build(),
    );
  }
}
