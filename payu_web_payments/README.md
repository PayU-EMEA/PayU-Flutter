## Features

Flutter package which allows to make Web payments via Pay. 

Below is a list of status codes sent by the PayU system. Some status codes may be sent with a more detailed message.

* [SUCCESS](#success)
* [WARNING_CONTINUE_REDIRECT](#warning_continue_redirect)
* [WARNING_CONTINUE_3DS](#warning_continue_3ds)
* [WARNING_CONTINUE_CVV](#warning_continue_cvv)

## Getting started

After sending a request for a new order, a response will be returned by the API. The payment link is based on regular Payu integration involving REST API described [here](https://developers.payu.com/en/restapi.html#creating_new_order_api). Those requests should be handled by the merchant's backend. 

Sample response to a new order request:
```json
{ 
  "status":{ 
    "statusCode":"SUCCESS",
  },
  "redirectUri":"{payment_summary_page_url}",
  "orderId":"WZHF5FFDRJ140731GUEST000P01",
  "extOrderId":"{your_order_identifier}",
}
```

The `redirectUri` field includes payment link, so later it would be passed to the `WebPaymentsRequest`.

[Here](https://developers.payu.com/en/overview.html#paymethods) is a full list of payment methods available from Payu.

<a id="success"></a> 

## Status Codes

#### SUCCESS

Request has been processed correctly. `redirectUri` is provided in the response.

```dart
final result = await Navigator.of(context).push<WebPaymentsResult>(
  MaterialPageRoute(
    builder: (context) => const WebPaymentsPage(
      request: WebPaymentsRequest(
        type: WebPaymentsRequestType.payByLink,
        redirectUri: ...,
        continueUri: ...,
      ),
    ),
  ),
);
```

<a id="warning_continue_redirect"></a> 

#### WARNING_CONTINUE_REDIRECT

Request has been processed correctly. `redirectUri` is provided in the response. Applies to transparent integration, if order request contains `payMethods` with following payment type values: `orx`, `bnx`, `gbx`, `nlx`.

```dart
final result = await Navigator.of(context).push<WebPaymentsResult>(
  MaterialPageRoute(
    builder: (context) => const WebPaymentsPage(
      request: WebPaymentsRequest(
        type: WebPaymentsRequestType.payByLink,
        redirectUri: ...,
        continueUri: ...,
      ),
    ),
  ),
);
```

<a id="warning_continue_3ds"></a> 

#### WARNING_CONTINUE_3DS

`3DS` authorization is required. Redirect the buyer to perform 3DS authentication process.

```dart
final result = await Navigator.of(context).push<WebPaymentsResult>(
  MaterialPageRoute(
    builder: (context) => const WebPaymentsPage(
      request: WebPaymentsRequest(
        type: WebPaymentsRequestType.threeDS,
        redirectUri: ...,
        continueUri: ...,
      ),
    ),
  ),
);
```

<a id="warning_continue_cvv"></a> 

#### WARNING_CONTINUE_CVV

`CVV/CVC` authorization required. In this case `redirectUri` from `OrderCreateResponse` must contain query parameter for `refReqId` key. 

1. Create `CVVAuthorizationExtractor` instance:

```dart
final extractor = CVVAuthorizationExtractor();
```

2. Extract `refReqId` query parameter from it:

```dart
final refReqId = extractor.extractRefReqId(redirectUri);
```

3. If `refReqId` is not `null` present the `CVVAuthorizationAlertDialog` instance. This dialog has the `TextField` for `cvv`.

```dart
final result = await showDialog<CVVAuthorizationResult>(
  context: context,
  builder: (context) => const CVVAuthorizationAlertDialog(refReqId: refReqId),
);
```

4. If the `result` is `CVVAuthorizationResult.success` then the order has been paid.