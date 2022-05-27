import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/ios/response/apple_pay_payment.dart';
import 'payu_mobile_payments_platform_interface.dart';

class PayuMobilePaymentsPlatformInterfaceImpl implements PayuMobilePaymentsPlatformInterface {
  static const _methodChannelName = 'PayuMobilePaymentsPlatformInterface';
  static const _methodCanMakePaymentName = 'canMakePayment';
  static const _methodMakePaymentName = 'makePayment';

  final MethodChannel _channel = const MethodChannel(_methodChannelName);

  PayuMobilePaymentsPlatformInterfaceImpl();

  @override
  Future<bool> canMakePayment(PaymentConfiguration configuration) async {
    final response = await _channel.invokeMethod<bool>(
      _methodCanMakePaymentName,
      configuration.toJson(),
    );

    return response ?? false;
  }

  @override
  Future<String?> makePayment(PaymentConfiguration configuration) async {
    final response = await _channel.invokeMethod(
      _methodMakePaymentName,
      configuration.toJson(),
    );

    if (configuration.provider == PaymentProvider.googlePay) {
      final result = GooglePayPaymentData.fromJson(jsonDecode(response));
      return result.paymentMethodData.tokenizationData.token;
    }

    if (configuration.provider == PaymentProvider.applePay) {
      final result = ApplePayPayment.fromJson(jsonDecode(response));
      return result.token.paymentData;
    }
    return null;
  }
}
