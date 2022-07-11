## Getting started

Flutter package with Payu user interface elements. Also it manages the Theme for the Payu visual elements.

## Usage

Payu automatically uses Theme prepared with the styles accoring to the [Brand Guidelines](https://corporate.payu.com/wp-content/uploads/2021/01/PayU_Brand-guidelines-Updated-January-2021.pdf), but there is an option where merhcants can change visual elements style.

```dart
void main() async {
  Payu.theme = AwesomeTheme();

  runApp(
    MaterialApp
      ...
    ),
  );
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
