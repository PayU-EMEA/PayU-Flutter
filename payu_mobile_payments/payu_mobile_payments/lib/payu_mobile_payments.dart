library payu_mobile_payments;

import 'dart:async';

import 'package:payu_mobile_payments_platform_interface/payu_mobile_payments_platform_interface.dart';

export 'package:payu_mobile_payments_platform_interface/payu_mobile_payments_platform_interface.dart';

export 'builders/apple_pay_payment_request_builder.dart';
export 'builders/google_pay_payment_data_request_builder.dart';

class PayuMobilePayments implements PayuMobilePaymentsPlatformInterface {
  final PayuMobilePaymentsPlatformInterface _interface;

  PayuMobilePayments() : _interface = PayuMobilePaymentsPlatformInterfaceImpl();

  @override
  Future<bool> canMakePayment(PaymentConfiguration configuration) async {
    return _interface.canMakePayment(configuration);
  }

  @override
  Future<String?> makePayment(PaymentConfiguration configuration) {
    return _interface.makePayment(configuration);
  }
}
