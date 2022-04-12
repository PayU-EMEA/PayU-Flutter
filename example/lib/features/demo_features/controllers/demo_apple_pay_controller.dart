import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/features/example/backend/data/repositories/backend_constants.dart';

class DemoApplePayController extends GetxController implements ApplePayListener {
  late final ApplePayService _service;

  @override
  void onInit() {
    _service = ApplePayService.instance();
    _service.setListener(this);
    super.onInit();
  }

  void demo() async {
    if (await _service.canMakePayments()) {
      await _service.authorize(
        request: const ApplePayPaymentRequest(
          merchantIdentifier: Constants.merchantIdentifier,
          countryCode: 'PL',
          currencyCode: 'PLN',
          shippingContact: ApplePayContact(
            emailAddress: BackendConstants.buyerEmail,
          ),
          paymentSummaryItems: [
            ApplePaySummaryItem(label: 'Futomaki', amount: 1999),
            ApplePaySummaryItem(label: 'Napkin', amount: 49),
            ApplePaySummaryItem(label: 'Order', amount: 1999 + 49),
          ],
        ),
      );
    } else {
      snackbar('cannotMakePayments');
    }
  }

  @override
  void onDidAuthorize(String authorizationCode) {
    snackbar('onDidAuthorize');
  }

  @override
  void onDidCancel() {
    snackbar('onDidCancel');
  }
}
