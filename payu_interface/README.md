## Features

Flutter package with Payu interface which allows to access the main properties directly.


## Getting started

This package should not be used directly by the merchants.

## Usage

```dart
extension PayuInterfaceDebug on PayuInterface {
  static var _debug = false;

  bool get debug => _debug;

  set debug(bool debug) => _debug = debug;
}
```

After such setup, it is possible to reach the code in the way:

```dart
Payu.debug = true;
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.