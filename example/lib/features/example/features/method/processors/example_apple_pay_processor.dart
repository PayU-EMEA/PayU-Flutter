import 'package:collection/collection.dart';
import 'package:payu/payu.dart';

import 'package:example/core/constants.dart';
import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_method_type.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/backend/data/repositories/backend_constants.dart';

class ExampleApplePayProcessor implements ApplePayListener {
  final List<Product> _products;
  final ApplePayService _service;

  ApplePay? _applePay;
  Function(PayMethod)? _onProcessed;

  ExampleApplePayProcessor(this._products, this._service);

  void process({required ApplePay applePay, required Function(PayMethod) onProcessed}) async {
    _applePay = applePay;
    _onProcessed = onProcessed;

    final products = <ApplePaySummaryItem>[];

    products.addAll(_products.map((e) => ApplePaySummaryItem(label: e.name, amount: e.quantity * e.price)).toList());
    products.add(ApplePaySummaryItem(label: 'Order', amount: products.map((e) => e.amount).sum));

    _service.setListener(this);
    _service.authorize(
      request: ApplePayPaymentRequest(
        merchantIdentifier: Constants.merchantIdentifier,
        countryCode: 'PL',
        currencyCode: 'PLN',
        shippingContact: const ApplePayContact(
          emailAddress: BackendConstants.buyerEmail,
        ),
        paymentSummaryItems: products,
      ),
    );
  }

  @override
  void onDidAuthorize(String authorizationCode) {
    _onProcessed!(
      PayMethod(
        type: PayMethodType.pbl,
        value: _applePay!.value,
        authorizationCode: authorizationCode,
      ),
    );
  }

  @override
  void onDidCancel() {
    snackbar('onDidCancel');
  }
}
