import 'package:payu_interface/payu_interface.dart';

import '../models/pos.dart';

extension PayuInterfacePos on PayuInterface {
  static POS? _pos;

  POS? get pos => _pos;

  set pos(POS? pos) => _pos = pos;
}
