import 'package:flutter/services.dart';

import 'package:payu_apple_pay/payu_apple_pay.dart';
import 'package:payu_apple_pay/src/service/apple_pay_platform.dart';

class ApplePayServiceAssembler {
  ApplePayService assemble() {
    return ApplePayService(
      ApplePayPlatform(),
      const MethodChannel('com.payu.flutter.apple-pay.input'),
      const MethodChannel('com.payu.flutter.apple-pay.output'),
    );
  }
}
