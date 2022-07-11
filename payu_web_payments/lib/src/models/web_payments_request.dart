enum WebPaymentsRequestType { payByLink, threeDS }

class WebPaymentsRequest {
  final WebPaymentsRequestType type;
  final String redirectUri;
  final String continueUri;

  const WebPaymentsRequest({
    required this.type,
    required this.redirectUri,
    required this.continueUri,
  });
}
