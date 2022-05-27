import 'package:collection/collection.dart';
import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/backend/data/repositories/backend_constants.dart';
import 'package:payu/payu.dart';

class ExampleApplePayProcessor {
  final List<Product> _products;
  final PayuMobilePayments _service;

  ExampleApplePayProcessor(this._products, this._service);

  void process({required ApplePay applePay, required Function(PayMethod) onProcessed}) async {
    final products = <ApplePaySummaryItem>[];
    products.addAll(_products.map((e) => ApplePaySummaryItem(label: e.name, amount: e.quantity * e.price)).toList());
    products.add(ApplePaySummaryItem(label: 'Order', amount: products.map((e) => e.amount).sum));

    final configuration = PaymentConfiguration.applePay(
      request: ApplePayPaymentRequest(
        merchantIdentifier: Constants.applePayMerchantIdentifier,
        countryCode: 'PL',
        currencyCode: 'PLN',
        shippingContact: const ApplePayContact(
          emailAddress: BackendConstants.buyerEmail,
        ),
        paymentSummaryItems: products,
      ),
    );

    try {
      final canMakePayment = await _service.canMakePayment(configuration);
      if (!canMakePayment) snackbar('!canMakePayment');

      final authorizationCode = await _service.makePayment(configuration);
      if (authorizationCode == null) snackbar('authorizationCode == null');

      onProcessed(
        PayMethod(
          type: PayMethodType.pbl,
          value: applePay.value,
          authorizationCode: authorizationCode,
        ),
      );
    } catch (e) {
      snackbar(e.toString());
    }
  }
}
