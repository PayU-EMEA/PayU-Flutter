import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/order_create_response.dart';
import 'package:example/data/models/order_create_status_code.dart';

class ExampleCheckoutRedirectController extends GetxController {
  Future process(OrderCreateResponse orderCreateResponse) async {
    orderCreateResponse.redirectUri == null
        ? _processForPaymentWithoutRedirectUri()
        : _processForPaymentWithRedirectUri(orderCreateResponse);
  }

  void _processForPaymentWithRedirectUri(OrderCreateResponse orderCreateResponse) async {
    switch (orderCreateResponse.status.statusCode) {
      case OrderCreateStatusCode.success:
        _processSuccessWebPayment(orderCreateResponse.redirectUri!);
        break;
      case OrderCreateStatusCode.warningContinueRedirect:
        _processWarningContinueRedirectWebPayment(orderCreateResponse.redirectUri!);
        break;
      case OrderCreateStatusCode.warningContinue3DS:
        _processWarningContinue3DSWebPayment(orderCreateResponse.redirectUri!);
        break;
      case OrderCreateStatusCode.warningContinueCVV:
        _processWarningContinueCVVWebPayment(orderCreateResponse.redirectUri!);
        break;
    }
  }

  void _processForPaymentWithoutRedirectUri() async {
    snackbar('Order has been paid');
  }

  void _processSuccessWebPayment(String redirectUri) async {
    _processWebPayment(WebPaymentsRequestType.payByLink, redirectUri);
  }

  void _processWarningContinueRedirectWebPayment(String redirectUri) async {
    _processWebPayment(WebPaymentsRequestType.payByLink, redirectUri);
  }

  void _processWarningContinue3DSWebPayment(String redirectUri) async {
    _processWebPayment(WebPaymentsRequestType.threeDS, redirectUri);
  }

  void _processWarningContinueCVVWebPayment(String redirectUri) async {
    _processCVVPayment(redirectUri);
  }

  void _processWebPayment(WebPaymentsRequestType type, String redirectUri) async {
    final result = await Get.to<WebPaymentsResult>(
      () => WebPaymentsPage(
        request: WebPaymentsRequest(
          type: type,
          redirectUri: redirectUri,
          continueUri: Constants.continueUrl,
        ),
      ),
    );
    if (result != null) snackbar(result.toString());
  }

  void _processCVVPayment(String redirectUri) async {
    final extractor = CVVAuthorizationExtractor();
    final refReqId = extractor.extractRefReqId(redirectUri);

    if (refReqId == null) {
      snackbar('`redirectUri` must contain query parameter with `refReqId` key');
      return;
    }

    final result = await Get.dialog<CVVAuthorizationResult>(
      CVVAuthorizationAlertDialog(
        refReqId: refReqId,
      ),
    );

    if (result != null) snackbar(result.toString());
  }
}
