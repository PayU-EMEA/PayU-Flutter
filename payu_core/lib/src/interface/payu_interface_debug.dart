import 'package:payu_interface/payu_interface.dart';

extension PayuInterfaceDebug on PayuInterface {
  static var _debug = false;

  bool get debug => _debug;

  set debug(bool debug) => _debug = debug;
}
