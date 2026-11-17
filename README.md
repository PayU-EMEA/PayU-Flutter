# PayU Mobile SDK for Flutter

Flutter packages that let buyers pay in your app with pay-by-link, cards, BLIK, Google Pay (Android) and Apple Pay (iOS). The packages display the payment methods, tokenize cards and handle redirects, 3DS and the CVV code. Card data goes directly to PayU and never passes through your server. You can adjust the user interface to your brand's style guide.

The packages do not create orders. Your server authenticates with PayU, retrieves payment methods and creates orders, and your app passes the results to the packages. The server side is the same for Flutter, Android and iOS and is described in the PayU Developer Guide:

* [Mobile SDK](https://developers.payu.com/europe/docs/mobile-sdk/) – overview and supported features.
* [Payment Flow](https://developers.payu.com/europe/docs/mobile-sdk/payment-flow/) – how your app, your server, the SDK and PayU work together.
* [Server Integration](https://developers.payu.com/europe/docs/mobile-sdk/server-integration/) – the requests your server sends to PayU.
* [Testing](https://developers.payu.com/europe/docs/mobile-sdk/testing/) – testing in the Sandbox environment.

## Features

* [Add Card](payu_add_card)
  * [AddCardPage](payu_add_card)
  * [AddCardWidget](payu_add_card)
* [Apple Pay](payu_mobile_payments/payu_mobile_payments_ios)
* [Google Pay](payu_mobile_payments/payu_mobile_payments_android)
* [Payment Methods](payu_payment_methods)
  * [ApplePay](payu_payment_methods#payment-methods-apple-pay)
  * [BlikCode](payu_payment_methods#payment-methods-blik-code)
  * [BlikToken](payu_payment_methods#payment-methods-blik-token)
  * [CardToken](payu_payment_methods#payment-methods-card-token)
  * [PayByLink](payu_payment_methods#payment-methods-pay-by-link)
* [ThreeDS](payu_three_ds)
* [Web Payments](payu_web_payments)

## Installation

```yaml
dependencies:
  payu:
    git: 
      url: https://github.com/PayU-EMEA/PayU-Flutter.git
      path: payu
      ref: VERSION
```
You can get VERSION from https://github.com/PayU-EMEA/PayU-Flutter/releases.
**Always** use `ref`. If you don't specify a `ref`, you'll always fetch the latest version from the repository, which may contain untested changes.

```dart
import 'package:payu/payu.dart';
```

## Example

There is an `example` project with predefined public `Sandbox` environment which you can run. This app will help you to understand basic scenarios of integration.

1. Download the repository
2. Open in editor (`Visual Studio Code`, `Android Studio`, etc.)
3. Select device where you want to run (`iOS`, `Android`)
4. Run `example` configuration.

<a id="preparing_the_project"></a> 

## Preparing the project

* [Set Environment](payu_core)
* [Set Locale](payu_core)
* [Set POS](payu_core)

<a id="ui_customization"></a>

## UI Customization

Customize PayU UI with `Payu.theme` (`ThemeData`) to control colors, typography, inputs, cards, and buttons across all PayU screens.

For full details and examples, see the [Theme Customization guide](payu_ui/THEME_CUSTOMIZATION.md).
