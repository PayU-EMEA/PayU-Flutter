import 'dart:developer';

import 'package:payu_interface/payu_interface.dart';

import '../interface/payu_interface_debug.dart';

class Logger {
  /// Logs `message` to the console with success prefix
  static void logInfo(String message) {
    if (Payu.debug) log('✅ [PAYU] / I): $message');
  }

  /// Logs `message` to the console with failure prefix
  static void logError(String message) {
    if (Payu.debug) log('⛔️ [PAYU] / E]: $message');
  }
}
