import 'package:flutter/material.dart';

import 'package:payu_interface/payu_interface.dart';

import '../theme/theme_data_factory.dart';

extension PayuInterfaceTheme on PayuInterface {
  static var _theme = ThemeDataFactory.platform();

  ThemeData get theme => _theme;

  set theme(ThemeData? theme) => _theme = theme ?? ThemeDataFactory.platform();
}
