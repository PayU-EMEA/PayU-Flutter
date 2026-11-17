## Features

* [Locale](#locale)

<a id="locale"></a> 

## Locale

Allows merchants to set custom `locale` for the Payu widgets:
- `bg` (Bulgarian)
- `cs` (Czech)
- `de` (German)
- `el` (Greek)
- `en` (English)
- `es` (Spanish)
- `fr` (French)
- `hr` (Croatian)
- `hu` (Hungarian)
- `it` (Italian)
- `lt` (Lithuanian)
- `lv` (Latvian)
- `pl` (Polish)
- `ro` (Romanian)
- `ru` (Russian)
- `sl` (Slovenian)
- `sk` (Slovak)
- `uk` (Ukrainian)

> NOTE: If provided `languageCode` is not available - default system Locale should be used.

## Usage

```dart
void main() async {
  Payu.locale = const Locale('en');

  runApp(
    MaterialApp(
      ...
    ),
  );
}
```
