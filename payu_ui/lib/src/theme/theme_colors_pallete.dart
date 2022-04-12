import 'package:flutter/material.dart';

import '../widgets/payu_colors.dart';

abstract class ThemeColorsPallete {
  /// `debugColor` is used for development purposes.
  /// It helps to debug not implemented text styles.
  static const Color debugColor = Colors.orange;

  factory ThemeColorsPallete.dark() => _ThemeColorsPalleteDark();
  factory ThemeColorsPallete.light() => _ThemeColorsPalleteLight();

  Color get primary2;

  Color get secondaryGray1;
  Color get secondaryGray2;
  Color get secondaryGray3;
  Color get secondaryGray4;

  Color get tertiary2;
}

class _ThemeColorsPalleteLight implements ThemeColorsPallete {
  @override
  Color get primary2 => PayuColors.primary2;

  @override
  Color get secondaryGray1 => PayuColors.secondaryGray1;

  @override
  Color get secondaryGray2 => PayuColors.secondaryGray2;

  @override
  Color get secondaryGray3 => PayuColors.secondaryGray3;

  @override
  Color get secondaryGray4 => PayuColors.secondaryGray4;

  @override
  Color get tertiary2 => PayuColors.tertiary2;
}

class _ThemeColorsPalleteDark implements ThemeColorsPallete {
  @override
  Color get primary2 => PayuColors.primary2;

  @override
  Color get secondaryGray1 => PayuColors.secondaryGray4;

  @override
  Color get secondaryGray2 => PayuColors.secondaryGray3;

  @override
  Color get secondaryGray3 => PayuColors.secondaryGray2;

  @override
  Color get secondaryGray4 => PayuColors.secondaryGray1;

  @override
  Color get tertiary2 => PayuColors.tertiary2;
}
