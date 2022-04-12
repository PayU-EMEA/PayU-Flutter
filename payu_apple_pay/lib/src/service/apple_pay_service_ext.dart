import 'package:flutter/services.dart';

import 'apple_pay_service.dart';
import 'apple_pay_service_method.dart';

extension ApplePayServiceExt on ApplePayService {
  void handleOutputMethodCall(MethodCall call) async {
    switch (call.method) {
      case ApplePayServiceMethod.onDidAuthorize:
        listener?.onDidAuthorize(call.arguments);
        break;
      case ApplePayServiceMethod.onDidCancel:
        listener?.onDidCancel();
        break;
      default:
        break;
    }
  }
}
