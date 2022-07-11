import 'dart:io';

class PaymentMethodPlatformProvider {
  bool isAndroid() => Platform.isAndroid;
  bool isiOS() => Platform.isIOS;
}
