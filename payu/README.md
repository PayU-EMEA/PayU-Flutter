<a id="features"></a> 

## Features

* [Add Card](../payu_add_card)
  * [AddCardPage](../payu_add_card)
  * [AddCardWidget](../payu_add_card)
* [Apple Pay](../payu_mobile_payments/payu_mobile_payments_ios)
* [Google Pay](../payu_mobile_payments/payu_mobile_payments_android)
* [Mastercard Installments](../payu_mastercard_installments)
* [Payment Methods](../payu_payment_methods)
  * [ApplePay](../payu_payment_methods#payment-methods-apple-pay)
  * [BlikCode](../payu_payment_methods#payment-methods-blik-code)
  * [BlikToken](../payu_payment_methods#payment-methods-blik-token)
  * [CardToken](../payu_payment_methods#payment-methods-card-token)
  * [Mastercard Installments](../payu_payment_methods#payment-methods-installments)
  * [PayByLink](../payu_payment_methods#payment-methods-pay-by-link)
* [ThreeDS](../payu_three_ds)
* [Web Payments](../payu_web_payments)

<a id="installation"></a> 

## Installation

```yaml
dependencies:
  payu:
    git: 
      url: https://github.com/PayU-EMEA/PayU-Flutter.git
      path: payu
```

```dart
import 'package:payu/payu.dart';
```

<a id="example"></a>

## Example

There is an `example` project with predefined public `Sandbox` environment which you can run. This app  will help you to understand basic scenarios of integration.

1. Download the repository
2. Open in editor (`Visual Studio Code`, `Android Studio`, etc.)
3. Select device where you want to run (`iOS`, `Android`)
3. Run `example` configuration.

<a id="preparing_the_project"></a>

## Preparing the project

* [Set Environment](../payu_core)
* [Set Locale](../payu_core)
* [Set POS](../payu_core)

<a id="getting_started"></a> 

## Getting started

Package gives a set of components for: pay-by-link, one-time card payments, storing card options, scanning card data, and one-click payments (Google Pay, Apple Pay, BLIK). Card is processed via Payu Backend and package sends request, but each merchant will receive card tokens in retrieve method, so the card data does not go through merchant backend. User Interface in package can be adjusted to merchant branding / style guide.

### Recommended implementation flow

Merchant Server - Payu Server means that call is made from merchant server to Payu REST API. Merchant Mobile App means that action is called inside merchant mobile application. Package heavily depends on communication between merchant and Payu backends. Package won't create order for merchant so this responsibility will be ceeded to merchant server. With this approach there is no need to create and use mobile oAuth token, but merchant application will need to pass all important data to package.

### General Payment flow for mobile

* `Shopping Context` - is Merchant Exclusive Flow
* `Checkout Context` - is a part when merchant need to obtain payment methods from PayU backend. For this merchant needs to implement [OAuth](https://developers.payu.com/en/restapi.html#references_api_signature) & [Payment methods retrieve](https://developers.payu.com/en/restapi.html#Transparent_retrieve). Then Merchant Mobile App can [display payment methods](../payu_payment_methods)
* `Payment Context` - is a transaction part. When merchant on backend create an [OrderCreateRequest](https://developers.payu.com/en/restapi.html#creating_new_order). This request start transaction process.
* `Payment Context` - when order has been created, then Merchant Mobile App must handle the result of the response. Please visit [detailed documentation](../payu_web_payments) on how to handle possible `statusCode` for `OrderCreateResponse`.

![](https://developers.payu.com/images/mobile_sdk/mobile_general_pay_flow.png)

### Example Payment flow for mobile

* User select products and create cart in `Merchant Mobile App` and tap for ex. `Checkout` button
* `Merchant Mobile App` send the request to the `Merchant Backend` to get the list of available payment methods (see how to get the payment methods [here](https://developers.payu.com/en/restapi.html#Transparent_retrieve))
* `Merchant Mobile App` present the list of available payment methods, for ex. using [PaymentMethodsPage](../payu_payment_methods#core-payment-methods-page) or [PaymentMethodsWidget](../payu_payment_methods#core-payment-methods-widget)
* User select the neccessary payment method from the list of presented
* `Merchant Mobile App` send the selected payment method with cart details to the `Merchant Backend` (see how to send selected method [here](../payu_payment_methods#payment-methods))
* `Merchant Backend` send `OrderCreateRequest` with user details, products details and payment method details and return the result of `OrderCreateResponse` to `Merchant Mobile App` (see how to make `OrderCreateRequest` [here](https://developers.payu.com/en/restapi.html#creating_new_order)
* `Merchant Mobile App` handle the result of `OrderCreateResponse` (see how to handle the result of `OrderCreateResponse` [here](../payu_web_payments/)

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.