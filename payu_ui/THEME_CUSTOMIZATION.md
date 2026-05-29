# PayU plugin theme customization

This plugin uses a Material `ThemeData` object available as `Payu.theme`.

## How to provide custom theme

```dart
void main() {
  Payu.theme = ThemeData(
    // your custom Material theme here
  );

  runApp(const MyApp());
}
```

- `Payu.theme` is applied inside PayU wrappers:
  - `payu_state_management/lib/src/payu_widget.dart`
  - `payu_ui/lib/src/widgets/payu_provider_widget.dart`
- Setting `Payu.theme = null` restores the default PayU theme (`ThemeDataFactory.platform()`).

## Default PayU theme definition

The default theme is created in:
- `payu_ui/lib/src/theme/theme_data_factory.dart`

It defines:
- `appBarTheme`
- `cardTheme`
- `dialogTheme`
- `inputDecorationTheme`
- `textTheme`
- `colorScheme`
- `primaryColor`

## What can be overridden and where it is used

### `appBarTheme`
Used by pages with `AppBar(...)`:
- `payu_add_card/lib/src/page/add_card_page.dart`
- `payu_payment_methods/lib/src/features/payment_methods/payment_methods_page.dart`
- `payu_payment_methods/lib/src/features/pbl_payment_methods/pbl_payment_methods_page.dart`
- `payu_web_payments/lib/src/web_payments_page.dart`

### `cardTheme`
Used by `Card(...)` components:
- `payu_payment_methods/lib/src/features/payment_methods/payment_methods_page.dart`
- `payu_payment_methods/lib/src/features/pbl_payment_methods/pbl_payment_methods_page.dart`

### `dialogTheme`
Used by `AlertDialog(...)` components:
- `payu_web_payments/lib/src/cvv/cvv_authorization_alert_dialog.dart`
- `payu_three_ds/lib/src/soft_accept/soft_accept_alert_dialog.dart`
- `payu_web_payments/lib/src/web_payments_page.dart` (dialogs opened in `showBackAlertDialog` and `showWebResourceErrorAlertDialog`)

### `inputDecorationTheme`
Used by `TextField(..., decoration: InputDecoration(...))`:
- `payu_add_card/lib/src/widget/widgets/add_card_text_field.dart`
- `payu_payment_methods/lib/src/features/widget/payment_widget.dart` (`_BlikCode`)
- `payu_web_payments/lib/src/cvv/cvv_authorization_alert_dialog.dart`

### `textTheme`
Used with `Theme.of(context).textTheme...`:
- `payu_add_card/lib/src/widget/add_card_widget.dart`
- `payu_payment_methods/lib/src/features/widget/payment_widget.dart`
- `payu_terms_and_conditions/lib/src/terms_and_conditions_widget.dart`

### `colorScheme` and `primaryColor`
Used for surface/background and accent colors:
- `payu_add_card/lib/src/page/add_card_page.dart`
- `payu_payment_methods/lib/src/features/widget/payment_widget.dart`
- `payu_payment_methods/lib/src/features/payment_methods/payment_methods_page.dart`
- `payu_payment_methods/lib/src/features/pbl_payment_methods/pbl_payment_methods_page.dart`
- `payu_terms_and_conditions/lib/src/terms_and_conditions_widget.dart`
- `payu_web_payments/lib/src/web_payments_page.dart`

## Recommended customization approach

To keep PayU defaults and change only selected parts, start from current theme:

```dart
Payu.theme = Payu.theme.copyWith(
  cardTheme: Payu.theme.cardTheme.copyWith(
    color: Colors.white,
  ),
  inputDecorationTheme: Payu.theme.inputDecorationTheme.copyWith(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  ),
);
```

## Related Flutter documentation

- Material theming overview: https://docs.flutter.dev/cookbook/design/themes
- `ThemeData`: https://api.flutter.dev/flutter/material/ThemeData-class.html
- `ColorScheme`: https://api.flutter.dev/flutter/material/ColorScheme-class.html
- `CardThemeData`: https://api.flutter.dev/flutter/material/CardThemeData-class.html
- `InputDecorationTheme`: https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html
- `TextTheme`: https://api.flutter.dev/flutter/material/TextTheme-class.html
- `AppBarTheme`: https://api.flutter.dev/flutter/material/AppBarTheme-class.html
- `DialogThemeData`: https://api.flutter.dev/flutter/material/DialogThemeData-class.html

Input filtering (used by PayU text fields together with themed `InputDecoration`):
- `FilteringTextInputFormatter`: https://api.flutter.dev/flutter/services/FilteringTextInputFormatter-class.html
