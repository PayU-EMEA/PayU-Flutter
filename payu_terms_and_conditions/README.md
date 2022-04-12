## Features

Flutter package with Payu Terms and Conditions widget. Tapping on the `link` will open browser with .pdf file.

## Getting started

This widget must be added by the merchants in places where they interacts with the Payu, for ex: `AddCardWidget`.

## Usage

```dart
import 'package:flutter/material.dart';

import 'package:payu/payu.dart';

void main() {
  Payu.debug = true;
  Payu.locale = const Locale('en');
  Payu.environment = Environment.sandbox;
  Payu.pos = const POS(id: '300746');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const TermsAndConditionsWidget(),
      ),
    );
  }
}
```

## Screenshots

<img src="docs/screenshots/payu_terms_and_conditions.png" width="400">

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.