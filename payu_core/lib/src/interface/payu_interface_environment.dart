import 'package:payu_interface/payu_interface.dart';

import '../models/environment.dart';

extension PayuInterfaceEnvironment on PayuInterface {
  static Environment? _environment;

  Environment? get environment => _environment;

  set environment(Environment? environment) => _environment = environment;
}
