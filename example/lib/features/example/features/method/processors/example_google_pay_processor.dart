import 'package:collection/collection.dart';
import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/data/models/product.dart';
import 'package:payu/payu.dart';

class ExampleGooglePayProcessor {
  final List<Product> _products;
  final PayuMobilePayments _service;

  ExampleGooglePayProcessor(this._products, this._service);

  void process({required GooglePay googlePay, required Function(PayMethod) onProcessed}) async {
    final totalPrice = _products.map((e) => (e.quantity * e.price)).sum / 100;

    final configuration = PaymentConfiguration.googlePay(
      environment: PaymentEnvironment.test,
      request: GooglePayPaymentDataRequestBuilder()
          .withMerchantId(Constants.googlePayMerchantId)
          .withMerchantName(Constants.googlePayMerchantName)
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withTotalPrice(totalPrice.toString())
          .build(),
    );

    try {
      final canMakePayment = await _service.canMakePayment(configuration);
      if (!canMakePayment) {
        snackbar('Cannot make Google Pay payments');
        return;
      }

      final authorizationCode = await _service.makePayment(configuration);
      if (authorizationCode == null) {
        snackbar('Cannot get an authorizationCode from the Google Pay payment');
        return;
      }

      onProcessed(
        PayMethod(
          type: PayMethodType.pbl,
          value: googlePay.value,
          authorizationCode: authorizationCode,
        ),
      );
    } catch (e) {
      snackbar(e.toString());
    }
  }
}
