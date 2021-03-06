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
      request: ApplePayPaymentRequestBuilder()
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withMerchantIdentifier(Constants.applePayMerchantIdentifier)
          .withShippingContact(
            const ApplePayContact(
              emailAddress: BackendConstants.buyerEmail,
            ),
          )
          .withPaymentSummaryItems(products)
          .build(),
    );

    try {
      final canMakePayment = await _service.canMakePayment(configuration);
      if (!canMakePayment) {
        snackbar('Cannot make Apple Pay payments');
        return;
      }

      final authorizationCode = await _service.makePayment(configuration);
      if (authorizationCode == null) {
        snackbar('Cannot get an authorizationCode from the Apple Pay payment');
        return;
      }

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
