import 'dart:async';

import 'package:flutter/services.dart';

import '../models/apple_pay_payment_request.dart';
import 'apple_pay_listener.dart';
import 'apple_pay_platform.dart';
import 'apple_pay_service_assembler.dart';
import 'apple_pay_service_ext.dart';
import 'apple_pay_service_method.dart';

class ApplePayService {
  final ApplePayPlatform _platform;
  final MethodChannel _inputChannel;
  final MethodChannel _outputChannel;

  ApplePayListener? _listener;

  ApplePayListener? get listener => _listener;

  void setListener(ApplePayListener? listener) => _listener = listener;

  ApplePayService(this._platform, this._inputChannel, this._outputChannel) {
    _outputChannel.setMethodCallHandler((call) async => handleOutputMethodCall(call));
  }

  factory ApplePayService.instance() => ApplePayServiceAssembler().assemble();

  /// Determine whether this device can process payments using the specified networks and capabilities bitmask.
  /// Your application should confirm that the user can make payments before attempting to authorize a payment.
  /// For more info please visit [developer.apple.com](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationviewcontroller/1616181-canmakepayments)
  ///
  /// List of supported [PKPaymentNetwork]:
  ///   - maestro
  ///   - mastercard
  ///   - visa
  ///
  /// List of supported [PKMerchantCapability]:
  ///   - capabilityCredit
  ///   - capabilityDebit
  ///   - capability3DS
  Future<bool> canMakePayments() async {
    return await _inputChannel.invokeMethod(ApplePayServiceMethod.canMakePayments) && _platform.isiOS();
  }

  /// Creates application's request to produce a payment instrument for the purchase.
  Future<void> authorize({required ApplePayPaymentRequest request}) async {
    return await _inputChannel.invokeMethod(ApplePayServiceMethod.authorize, request.toJson());
  }
}
