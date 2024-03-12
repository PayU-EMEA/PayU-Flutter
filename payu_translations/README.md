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

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.