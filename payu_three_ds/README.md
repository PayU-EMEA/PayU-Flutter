## Features

Flutter package which allows to handle Payu 3DS.

3DS 2 is an enhanced version of the original "Three Domain Secure" (3-D Secure or 3DS) authentication implemented by card issuers and acquirers under the umbrella of specific card schemes like MasterCard (MasterCard SecureCode) and Visa (Verified by Visa).

## Getting started

Response with `WARNING_CONTINUE_3DS` status has been enhanced with `threeDsProtocolVersion` (possible values: `3DS1` and `3DS2`) and `iframeAllowed` field. It will indicate that the `redirectUri` may be displayed in an `iframe` using `SoftAcceptAlertDialog`. For more detailed information about 3DS please visit [developers.payu.com](https://developers.payu.com/en/3ds_2.html#impact).

* [Order Create Response](#order_create_response)
* [Process overview](#process_overview)
* [Options](#options)
* [Listen to messages](#listen_to_messages)

<a id="order_create_response"></a> 

## Order Create Response

Below changes in response apply only to requests with card data (tokenized by PayU, tokenized by Google Pay or in plain text) passed in `payMethod` object. Response with `WARNING_CONTINUE_3DS` status has been enhanced with `threeDsProtocolVersion` (possible values: `3DS1` and `3DS2`) and `iframeAllowed` field. It will indicate that the `redirectUri` may be displayed in an `iframe`. 

```json
{
    "status": {
        "statusCode": "WARNING_CONTINUE_3DS",
        "severity": "WARNING"
    },
    "redirectUri": "{redirectUri}",
    "iframeAllowed": true,
    "threeDsProtocolVersion": "3DS2",
    "orderId": "QK52JR2VCR201023GUEST000P01"
}
```

<a id="process_overview"></a> 

## Process overview

Presenting the `SoftAcceptAlertDialog` should automatically start 3DS flow. Under the hood, depending on the applied rules, PayU system will either:
* Directly perform authorization using one of the possible SCA exemptions.
* Proceed with 3DS Method (`device fingerprinting`) in case the card issuer requested it. This process includes posting a HTML form from a hidden iframe and may take maximum 10 seconds.
* Display challenge window in an iframe to fully authenticate the user by means of whatever two-factor authentication the issuer has implemented.

> NOTE: if the authorization without authentication (option 1 above) fails due to a soft decline, PayU will start the challenge and re-submit the authorization if the authentication is successful.

```dart
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
          title: const Text('HomePage'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => _didTapHandleWarningContinue3DS(context),
            child: const Text('WARNING_CONTINUE_3DS'),
          ),
        ),
      ),
    );
  }

  void _didTapHandleWarningContinue3DS(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const SoftAcceptAlertDialog<SoftAcceptMessage>(
        request: SoftAcceptRequest(
          redirectUri: '...?authenticationId=...&refReqId=...',
        ),
      ),
    );

    if (result != null) debugPrint(result);
  }
}

```

<a id="options"></a> 

## Options

You may use the below options by adding them to the query string of authentication page URL address:
* `&cvv=false` - disables the CVV form
* `&lang=pl` - disables language auto-discovery and sets the language directly
* `&header=false` - authentication page is displayed without the header.

> NOTE: If you have provided `language` property in the `buyer` object of `Order Create Request`, it will be automatically appended to the URL query by PayU.

<a id="listen_to_messages"></a> 

## Listen to messages

The `result` of presenting the `SoftAcceptAlertDialog`:
* `displayFrame` - reveal the iframe if it was hidden
* `authenticationSuccessful` - challenge was successful. Wait for authorization result before showing any information about payment status
* `authenticationCanceled` - challenge was canceled and the payment declined. Wait for authorization result before showing any information about payment status
* `authenticationNotRequired` - no authentication was required