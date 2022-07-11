## Features

* [Debug](#debug)
* [Environment](#environment)
* [Locale](#locale)
* [POS](#pos)

<a id="debug"></a> 

## Debug

> NOTE: Please disable debug for the production version of the app.

Allows merchants to enable / disable logs to the console during the app execution. This might be helpful during the implementation / debugging process. 

```dart
  Payu.debug = true;
```

<a id="environment"></a>

## Environment

```dart
enum Environment {
  production,
  sandbox,
}
```

Sandbox is an almost identical copy of PayU production system. It can be used for integration and testing purposes. To use the sandbox you need a register separately in one quick step. After you are registered, you can set up own companies / shops / point of sale. For more details please visit [overview](https://developers.payu.com/en/overview.html#sandbox)

<a id="locale"></a>

## Locale

An identifier used to select a user's language and formatting preferences.

```dart
Payu.locale = const Locale('en');
```

<a id="pos"></a>

## POS

Point of sale that accepts payments. Most service parameters are defined at POS level. A single Shop may operate a few POSs.

```dart
Payu.pos = const POS(id: '300746');
```

## Usage

```dart
void main() async {
  Payu.debug = true;
  Payu.locale = const Locale('en');
  Payu.environment = Environment.sandbox;
  Payu.pos = const POS(id: '300746');

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