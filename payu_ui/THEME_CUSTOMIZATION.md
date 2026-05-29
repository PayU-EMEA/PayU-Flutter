# PayU plugin theme customization

This plugin uses a Material `ThemeData` object available as `Payu.theme`.
Every PayU screen and widget is wrapped by an internal `Theme` widget that injects `Payu.theme`, so all visual customization flows through a single place.

## How to provide a custom theme

```dart
void main() {
  Payu.theme = ThemeData(
    // your custom Material theme here
  );

  runApp(const MyApp());
}
```

- Setting `Payu.theme = null` restores the default PayU theme (`ThemeDataFactory.platform()`).
- The default theme is selected automatically based on the device brightness — light or dark.

## Recommended customization approach

To keep the PayU defaults and change only selected parts, start from the current theme:

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

## PayU brand color palette

The default theme uses the following PayU brand colors (light mode):

| Token | Hex | Usage |
|---|---|---|
| `primary2` | `#438F29` (PayU green) | App bar icons and title, card border accent, `colorScheme.primary` |
| `secondaryGray1` | `#3F3F3F` (dark gray) | Body text, titles |
| `secondaryGray2` | `#777777` (medium gray) | Subtitles, hints, secondary text |
| `secondaryGray3` | `#E3E4E2` (light gray) | Borders, dividers |
| `secondaryGray4` | `#F7F7F7` (very light gray) | Page backgrounds, card fill, dialog fill |
| `tertiary2` | `Colors.red` | Error borders, error text |

> In **dark mode** the gray scale is inverted — `secondaryGray1` becomes the lightest color and
> `secondaryGray4` the darkest — while `primary2` and `tertiary2` remain the same.

## Theme areas and what can be overridden

### `appBarTheme`

Controls the appearance of the top navigation bar shown on full-page screens.

**Default values:**

| Property | Default | Description |
|---|---|---|
| `backgroundColor` | `#F7F7F7` | Background of the app bar |
| `iconTheme.color` | `#438F29` (PayU green) | Color of the leading (back / close) icon |
| `iconTheme.size` | `24` | Size of the leading icon |
| `actionsIconTheme.color` | `#438F29` (PayU green) | Color of action icons on the right side |
| `actionsIconTheme.size` | `24` | Size of action icons |
| `titleTextStyle` | 18sp, `#438F29` | Style of the app bar title text |

**Features using `appBarTheme`:**
- Add Card — full-page card form with a back button
- Payment Methods — list of available payment methods
- Bank Transfer (PBL) — grid of bank logos
- Web Payments — browser page for redirect payments

---

### `cardTheme`

Controls the appearance of `Card` containers used to display individual payment method rows and bank logo tiles.

**Default values:**

| Property | Default | Description |
|---|---|---|
| `color` | `#F7F7F7` | Card fill color |
| `elevation` | `0` | No drop shadow |
| `shadowColor` | `null` | Shadow is disabled |
| `margin` | `EdgeInsets.all(0)` | No outer spacing (spacing is handled by the parent list) |
| `shape` border color | `#E3E4E2` | 1 px outline border |
| `shape` border radius | `8 px` | Rounded corners |

**Features using `cardTheme`:**
- Payment Methods — each payment method row is a `Card`
- Bank Transfer (PBL) — each bank logo tile is a `Card`

---

### `dialogTheme`

Controls the appearance of overlay dialogs (`AlertDialog`).

**Default values:**

| Property | Default | Description |
|---|---|---|
| `backgroundColor` | `#F7F7F7` | Dialog background |

**Features using `dialogTheme`:**
- Web Payments — "Go back?" confirmation dialog and "Connection not secure" error dialog
- CVV Authorization — dialog asking the user to enter a CVV code
- 3D Secure — dialog showing the 3DS soft-accept flow

---

### `inputDecorationTheme`

Controls the appearance of all text input fields (card number, expiry date, CVV, BLIK code).
All borders use `OutlineInputBorder` with an 8 px corner radius.

**Default values:**

| Property | Default | Description |
|---|---|---|
| `floatingLabelBehavior` | `FloatingLabelBehavior.always` | Label always floats above the field |
| `border` | 1 px `#E3E4E2` outline | Default border state |
| `enabledBorder` | 1 px `#E3E4E2` outline | Border when the field is enabled and not focused |
| `focusedBorder` | 1 px `#E3E4E2` outline | Border when the field has focus |
| `errorBorder` | 1 px red outline | Border when validation fails |
| `focusedErrorBorder` | 1 px red outline | Border when focused and invalid |
| `disabledBorder` | 1 px `#F7F7F7` outline | Border when the field is disabled (nearly invisible) |
| `labelStyle` | 12sp, `#3F3F3F` | Floating label text style |
| `hintStyle` | 14sp, `#777777` | Placeholder text style |
| `helperStyle` | 12sp, `#777777` | Helper text below the field |
| `errorStyle` | 12sp, red | Error message text style |

**Features using `inputDecorationTheme`:**
- Add Card Widget — card number, expiry date, and CVV fields
- Payment Methods Widget — BLIK code entry field
- CVV Authorization — CVV re-entry dialog field

---

### `textTheme`

Controls all text styles. PayU components use only the slots listed below.

**Default values:**

| Slot | Font size | Color | Used in feature |
|---|---|---|---|
| `titleSmall` | 14sp | `#777777` | Payment method name and "select payment method" placeholder in Payment Methods Widget |
| `bodyMedium` | 14sp | `#777777` | Payment method description in Payment Methods Widget |
| `bodySmall` | 14sp | `#777777` | "New card" label in Add Card Widget; Terms & Conditions text |

The remaining slots (`titleLarge`, `titleMedium`, `bodyLarge`, `labelLarge`, `labelSmall`) are defined in the default theme but are not currently consumed by any PayU widget.

**Features using `textTheme`:**
- Add Card Widget — "New card" section header
- Payment Methods Widget — payment method name and description
- Terms & Conditions Widget — legal disclaimer text

---

### `colorScheme` and `primaryColor`

**Default values:**

| Property | Default | Description |
|---|---|---|
| `colorScheme.primary` | `#438F29` (PayU green) | Arrow icon color in Payment Methods Widget |
| `colorScheme.surface` | `#F7F7F7` | Page and container background color |
| `colorScheme.onSurface` | `#777777` | Default text color on surfaces |
| `colorScheme.error` | red | Error indicator color |
| `colorScheme.onPrimary` | white | Text/icon color on primary-colored backgrounds |
| `primaryColor` | `#438F29` (PayU green) | Link text color in Terms & Conditions Widget |

**Features using `colorScheme` / `primaryColor`:**
- Add Card Page — page background (`colorScheme.surface`)
- Payment Methods Page — page background
- Bank Transfer (PBL) Page — page background
- Payment Methods Widget — container background and arrow icon color
- Terms & Conditions Widget — background and link text color
- Web Payments Page — page background

---

## Related Flutter documentation

- Material theming overview: https://docs.flutter.dev/cookbook/design/themes
- `ThemeData`: https://api.flutter.dev/flutter/material/ThemeData-class.html
- `ColorScheme`: https://api.flutter.dev/flutter/material/ColorScheme-class.html
- `AppBarTheme`: https://api.flutter.dev/flutter/material/AppBarTheme-class.html
- `CardThemeData`: https://api.flutter.dev/flutter/material/CardThemeData-class.html
- `DialogThemeData`: https://api.flutter.dev/flutter/material/DialogThemeData-class.html
- `InputDecorationTheme`: https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html
- `TextTheme`: https://api.flutter.dev/flutter/material/TextTheme-class.html

Input filtering (used by PayU text fields together with themed `InputDecoration`):
- `FilteringTextInputFormatter`: https://api.flutter.dev/flutter/services/FilteringTextInputFormatter-class.html
