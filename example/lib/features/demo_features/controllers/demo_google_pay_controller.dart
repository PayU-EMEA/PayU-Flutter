import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

class DemoGooglePayController extends GetxController {
  late final _configuration = _buildGooglePayPaymentConfiguration();
  late final _service = PayuMobilePayments();

  void demo() async {
    if (await _service.canMakePayment(_configuration)) {
      final authorizationCode = await _service.makePayment(_configuration);
      snackbar('authorizationCode: $authorizationCode');
    } else {
      snackbar('cannotMakePayments');
    }
  }

  PaymentConfiguration _buildGooglePayPaymentConfiguration() {
    return PaymentConfiguration.googlePay(
      environment: PaymentEnvironment.test,
      request: GooglePayPaymentDataRequest.payu(
        merchantId: Constants.googlePayMerchantId,
        merchantName: 'merchantName',
        currencyCode: 'PLN',
        countryCode: 'PL',
        totalPrice: '1.23',
      ),
    );
  }
}
