import 'package:flutter/material.dart';

import 'theme_colors_pallete.dart';
import 'theme_font_sizes.dart';

abstract class ThemeTextStyles {
  static const headline6 = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size24,
  );

  static const subtitle1 = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size16,
  );

  static const subtitle2 = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size14,
  );

  static const bodyText1 = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size16,
  );

  static const bodyText2 = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size14,
  );

  static const caption = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size14,
  );

  static const button = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size14,
  );

  static const overline = TextStyle(
    color: ThemeColorsPallete.debugColor,
    fontSize: ThemeFontSizes.size12,
  );
}
