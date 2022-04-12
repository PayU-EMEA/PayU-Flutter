enum WebPaymentsUriMatchResult {
  /// Not matched. Need to continue payment process
  notMatched,

  /// Successful transaction
  success,

  /// Transaction failed (e.g. timeout)
  failure,

  /// Transaction needs to be confirmed by 3DS
  continue3DS,

  /// Transaction needs to be confirmed by CVV code
  continueCvv,

  /// Transaction will be handled in mobile bank app
  externalApplication,
}

class WebPaymentsUriMatcher {
  WebPaymentsUriMatchResult result(String uri) => throw UnimplementedError();

  bool matchAboutBlank(Uri uri) {
    return uri.toString().contains('about:blank');
  }

  bool matchExternalScheme(Uri uri) {
    return uri.isScheme('http') == false && uri.isScheme('https') == false;
  }

  bool matchStatusCode(Uri uri) {
    return uri.queryParameters.containsKey('statusCode');
  }

  bool matchContinueUri(Uri uri, Uri continueUri) {
    return uri.scheme == continueUri.scheme && uri.host == continueUri.host;
  }

  bool matchContinueUriWithError(Uri uri) {
    return uri.queryParameters.containsKey('error') || uri.queryParameters.containsKey('failure');
  }
}
