import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:payu_mobile_payments_platform_interface/models/ios/response/apple_pay_payment.dart';

import 'payu_mobile_payments_platform_interface.dart';

class PayuMobilePaymentsPlatformInterfaceImpl implements PayuMobilePaymentsPlatformInterface {
  static const _methodChannelName = 'PayuMobilePaymentsPlatformInterface';
  static const _methodCanMakePaymentName = 'canMakePayment';
  static const _methodMakePaymentName = 'makePayment';

  final MethodChannel _channel = const MethodChannel(_methodChannelName);

  PayuMobilePaymentsPlatformInterfaceImpl();

  @override
  Future<bool?> canMakePayment(PaymentConfiguration configuration) {
    return _channel.invokeMethod(
      _methodCanMakePaymentName,
      configuration.toJson(),
    );
  }

  @override
  Future<String?> makePayment(PaymentConfiguration configuration) async {
    final response = await _channel.invokeMethod(
      _methodMakePaymentName,
      configuration.toJson(),
    );

    if (configuration.provider == PaymentProvider.googlePay) {
      final result = PaymentData.fromJson(jsonDecode(response));
      return result.paymentMethodData.tokenizationData.token;
    }

    if (configuration.provider == PaymentProvider.applePay) {
      final result = ApplePayPayment.fromJson(jsonDecode(response));
      return result.token.paymentData;
    }
    return null;
  }
}
