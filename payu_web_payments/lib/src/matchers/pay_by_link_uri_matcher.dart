import 'web_payments_uri_matcher.dart';

class PayByLinkUriMatcher extends WebPaymentsUriMatcher {
  final String continueUri;

  PayByLinkUriMatcher(this.continueUri);

  @override
  WebPaymentsUriMatchResult result(String uri) {
    final mappedUri = Uri.parse(uri);
    final mappedContinueUri = Uri.parse(continueUri);

    if (matchAboutBlank(mappedUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchExternalScheme(mappedUri)) return WebPaymentsUriMatchResult.externalApplication;
    if (!matchContinueUri(mappedUri, mappedContinueUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchContinueUriWithError(mappedUri)) return WebPaymentsUriMatchResult.failure;

    return WebPaymentsUriMatchResult.success;
  }
}
