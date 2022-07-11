## Features

Flutter plugin which allows make payments via Apple Pay / Google Pay

* [Apple Pay](#apple_pay)
* [Google Pay](#google_pay)

<a id="apple_pay"></a> 

## Apple Pay

### Getting started

Apple Pay™ is a digital wallet which lets you make card payments in a simple and fast manner, without having to enter your card details every time. The card data is securely stored by Apple. This payment method is available for selected browsers and Apple devices (phones and computers). A full list of [supported countries](https://www.apple.com/ios/feature-availability/#apple-pay) and [devices](https://support.apple.com/en-us/HT208531) can be found on the Apple website.

<a id="apple_pay_configuration"></a> 

### Configuration

#### Setup

1. [Enable Apple Pay](https://help.apple.com/xcode/mac/current/#/deva43983eb7?sub=dev44ce8ef13)
2. [Create a merchant identifier](https://help.apple.com/developer-account/#/devb2e62b839?sub=dev103e030bb)
3. [Create a payment processing certificate](https://help.apple.com/developer-account/#/devb2e62b839?sub=devf31990e3f)
4. Send created payment processing certificate to `tech@payu.pl`

> When creating an Apple Pay Payment Processing Certificate, you must specify the Key Pair information. Select ECC and 256 bit key pair.

#### Enable

The Apple Pay payment method is also available in a sandbox environment. In the integration process, we suggest creating an independent Merchant ID (with a name ending “.test”, for example) together with a set of certificates.

Because Apple Pay is not the default payment method, please contact the `tech@payu.pl` after registering in the sandbox environment, but before beginning integration using the Apple Pay payment method. In response you receive also `CSR` file for sandbox environment.

#### Testing

Before beginning to perform tests in the sandbox, please also read the [Apple Pay Sandbox Testing](https://developer.apple.com/apple-pay/sandbox-testing/) instructions.

We recommend using the card numbers since these are configured in the PayU sandbox to enable payments to be completed successfully:

- `5204 2477 5000 1471`
- `4761 1200 1000 0492`

<a id="apple_pay_integration"></a> 

### Integration
```dart
import 'package:example/core/ui/snackbar.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PayuMobilePayments _service;

  @override
  void initState() {
    _service = PayuMobilePayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => _didTapPay(_buildApplePayPaymentConfiguration()),
              child: const Text('ApplePay'),
            ),
          ],
        ),
      ),
    );
  }

  void _didTapPay(PaymentConfiguration paymentConfiguration) async {
    if (await _service.canMakePayment(paymentConfiguration)) {
      final authorizationCode = await _service.makePayment(paymentConfiguration);
      snackbar('authorizationCode: $authorizationCode');
    }
  }

  PaymentConfiguration _buildApplePayPaymentConfiguration() {
    return PaymentConfiguration.applePay(
      request: ApplePayPaymentRequestBuilder()
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withMerchantIdentifier('merchantIdentifier')
          .withShippingContact(
            const ApplePayContact(
              emailAddress: 'email@address.com',
            ),
          )
          .withPaymentSummaryItems(
        const [
          ApplePaySummaryItem(label: 'Futomaki', amount: 1599),
          ApplePaySummaryItem(label: 'Napkin', amount: 49),
          ApplePaySummaryItem(label: 'Order', amount: 1599 + 49),
        ],
      ).build(),
    );
  }
}

```

<a id="google_pay"></a> 

## Google Pay

### Getting started

To enable Google Pay you should have configurated POS with Google Pay enabled on PayU backend. 

* [Set up Google Pay](https://support.google.com/pay/answer/7625055?hl=en&co=GENIE.Platform%3DAndroid)
* [Test card suite](https://developers.google.com/pay/api/android/guides/resources/test-card-suite)

<a id="google_pay_configuration"></a> 

### Requirements

1. `minSdkVersion` 19
2. Google account on the device you are testing. 

<a id="google_pay_integration"></a> 

### Integration
```dart
import 'package:example/core/ui/snackbar.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PayuMobilePayments _service;

  @override
  void initState() {
    _service = PayuMobilePayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => _didTapPay(_buildGooglePayPaymentConfiguration()),
              child: const Text('GooglePay'),
            ),
          ],
        ),
      ),
    );
  }

  void _didTapPay(PaymentConfiguration paymentConfiguration) async {
    if (await _service.canMakePayment(paymentConfiguration)) {
      final authorizationCode = await _service.makePayment(paymentConfiguration);
      snackbar('authorizationCode: $authorizationCode');
    }
  }

  PaymentConfiguration _buildGooglePayPaymentConfiguration() {
    return PaymentConfiguration.googlePay(
      environment: PaymentEnvironment.test,
      request: GooglePayPaymentDataRequestBuilder()
          .withMerchantId('merchantId')
          .withMerchantName('merchantName')
          .withCountryCode('PL')
          .withCurrencyCode('PLN')
          .withTotalPrice('1.23')
          .build(),
    );
  }
}

```

### Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.