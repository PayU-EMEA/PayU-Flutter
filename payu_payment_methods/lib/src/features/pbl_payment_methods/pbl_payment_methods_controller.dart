import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_item.dart';

class PBLPaymentMethodsController extends PayuController {
  final PaymentMethodsConfiguration _configuration;
  final List<PaymentMethodsPayByLinkItem> items = [];

  PBLPaymentMethodsController(this._configuration);

  @override
  void onInit() {
    _setupPaymentMethods();
    super.onInit();
  }

  void _setupPaymentMethods() {
    _setupPayByLinks();
  }

  void _setupPayByLinks() {
    for (final e in _configuration.payByLinks) {
      if (_isAllowedPayByLink(e)) {
        items.add(PaymentMethodsPayByLinkItem.build(e));
      }
    }
  }

  // MATCHING
  bool _isAllowedPayByLink(PayByLink value) {
    return value.value != PaymentMethodValue.applePay &&
        value.value != PaymentMethodValue.googlePay;
  }
}
