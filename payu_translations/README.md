## Features

* [Locale](#locale)

<a id="locale"></a> 

## Locale

Allows merchants to set custom `locale` for the Payu widgets:
* `cs` (Czech)
* `de` (German)
* `en` (English)
* `hu` (Hungarian)
*  `pl` (Polish)

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