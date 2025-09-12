import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'theme_colors_pallete.dart';
import 'theme_text_styles.dart';

class ThemeDataFactory {
  static ThemeData platform() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
        ? ThemeDataFactory.dark()
        : ThemeDataFactory.light();
  }

  static ThemeData dark() {
    return _data(ThemeColorsPallete.dark());
  }

  static ThemeData light() {
    return _data(ThemeColorsPallete.light());
  }

  static ThemeData _data(ThemeColorsPallete pallete) {
    return ThemeData(
      appBarTheme: _appBarTheme(pallete),
      buttonTheme: _buttonTheme(pallete),
      cardTheme: _cardTheme(pallete),
      dialogBackgroundColor: pallete.secondaryGray4,
      inputDecorationTheme: _inputDecorationTheme(pallete),
      primaryColor: pallete.primary2,
      textTheme: _textTheme(pallete),
      colorScheme: _colorScheme(pallete).copyWith(surface: pallete.secondaryGray4),
    );
  }

  static AppBarTheme _appBarTheme(ThemeColorsPallete pallete) {
    return AppBarTheme(
      actionsIconTheme: _iconTheme(pallete),
      backgroundColor: pallete.secondaryGray4,
      iconTheme: _iconTheme(pallete),
      titleTextStyle: ThemeTextStyles.headline6.copyWith(color: pallete.primary2),
    );
  }

  static BorderRadius _borderRadius() {
    return BorderRadius.circular(8.0);
  }

  static BorderSide _borderSide({required Color color}) {
    return BorderSide(
      color: color,
      width: 1,
    );
  }

  static ButtonThemeData _buttonTheme(ThemeColorsPallete pallete) {
    return const ButtonThemeData();
  }

  static CardTheme _cardTheme(ThemeColorsPallete pallete) {
    return CardTheme(
      color: pallete.secondaryGray4,
      elevation: 0,
      margin: const EdgeInsets.all(0.0),
      shadowColor: null,
      shape: RoundedRectangleBorder(
        side: _borderSide(color: pallete.secondaryGray3),
        borderRadius: _borderRadius(),
      ),
    );
  }

  static ColorScheme _colorScheme(ThemeColorsPallete pallete) {
    return const ColorScheme.light().copyWith(
      primary: pallete.primary2,
      secondary: Colors.red,
      surface: ThemeColorsPallete.debugColor,
      error: pallete.tertiary2,
      onPrimary: Colors.white,
      onSecondary: ThemeColorsPallete.debugColor,
      onSurface: pallete.secondaryGray2,
      onError: ThemeColorsPallete.debugColor,
    );
  }

  static IconThemeData _iconTheme(ThemeColorsPallete pallete) {
    return IconThemeData(
      color: pallete.primary2,
      opacity: 1.0,
      size: 24,
    );
  }

  static InputBorder _inputBorder(ThemeColorsPallete pallete, {required Color color}) {
    return OutlineInputBorder(
      borderSide: _borderSide(color: color),
      borderRadius: _borderRadius(),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ThemeColorsPallete pallete) {
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      // borders
      border: _inputBorder(pallete, color: pallete.secondaryGray3),
      errorBorder: _inputBorder(pallete, color: pallete.tertiary2),
      focusedBorder: _inputBorder(pallete, color: pallete.secondaryGray3),
      focusedErrorBorder: _inputBorder(pallete, color: pallete.tertiary2),
      disabledBorder: _inputBorder(pallete, color: pallete.secondaryGray4),
      enabledBorder: _inputBorder(pallete, color: pallete.secondaryGray3),
      // text
      errorStyle: ThemeTextStyles.overline.copyWith(color: pallete.tertiary2),
      helperStyle: ThemeTextStyles.overline.copyWith(color: pallete.secondaryGray2),
      hintStyle: ThemeTextStyles.bodyText2.copyWith(color: pallete.secondaryGray2),
      labelStyle: ThemeTextStyles.overline.copyWith(color: pallete.secondaryGray1),
    );
  }

  static TextTheme _textTheme(ThemeColorsPallete pallete) {
    return TextTheme(
      titleLarge: ThemeTextStyles.headline6.copyWith(color: pallete.secondaryGray1),
      titleMedium: ThemeTextStyles.subtitle1.copyWith(color: pallete.secondaryGray1),
      titleSmall: ThemeTextStyles.subtitle2.copyWith(color: pallete.secondaryGray2),
      bodyLarge: ThemeTextStyles.bodyText1.copyWith(color: pallete.secondaryGray1),
      bodyMedium: ThemeTextStyles.bodyText2.copyWith(color: pallete.secondaryGray2),
      bodySmall: ThemeTextStyles.caption.copyWith(color: pallete.secondaryGray2),
      labelLarge: ThemeTextStyles.button.copyWith(color: pallete.secondaryGray3),
      labelSmall: ThemeTextStyles.overline.copyWith(color: pallete.secondaryGray1),
    );
  }
}
