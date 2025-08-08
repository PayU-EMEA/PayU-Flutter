import 'web_payments_uri_matcher.dart';

class ThreeDSUriMatcher extends WebPaymentsUriMatcher {
  final String continueUri;

  ThreeDSUriMatcher(this.continueUri);

  @override
  WebPaymentsUriMatchResult result(String uri) {
    const statusCodes = {
      'SUCCESS': WebPaymentsUriMatchResult.success,
      'WARNING_CONTINUE_3DS': WebPaymentsUriMatchResult.continue3DS,
      'WARNING_CONTINUE_CVV': WebPaymentsUriMatchResult.continueCvv,
      'ERROR_SYNTAX': WebPaymentsUriMatchResult.failure,
      'ERROR_VALUE_INVALID': WebPaymentsUriMatchResult.failure,
      'ERROR_VALUE_MISSING': WebPaymentsUriMatchResult.failure,
      'UNAUTHORIZED': WebPaymentsUriMatchResult.failure,
      'UNAUTHORIZED_REQUEST': WebPaymentsUriMatchResult.failure,
      'DATA_NOT_FOUND': WebPaymentsUriMatchResult.failure,
      'TIMEOUT': WebPaymentsUriMatchResult.failure,
      'BUSINESS_ERROR': WebPaymentsUriMatchResult.failure,
      'ERROR_INTERNAL': WebPaymentsUriMatchResult.failure,
      'GENERAL_ERROR': WebPaymentsUriMatchResult.failure,
      'WARNING': WebPaymentsUriMatchResult.failure,
      'SERVICE_NOT_AVAILABLE': WebPaymentsUriMatchResult.failure,
    };

    final mappedUri = Uri.parse(uri);
    final mappedContinueUri = Uri.parse(continueUri);

    if (matchAboutURIScheme(mappedUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchExternalScheme(mappedUri)) return WebPaymentsUriMatchResult.externalApplication;
    if (!matchContinueUri(mappedUri, mappedContinueUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchContinueUriWithError(mappedUri)) return WebPaymentsUriMatchResult.failure;
    if (!matchStatusCode(mappedUri)) return WebPaymentsUriMatchResult.notMatched;

    final statusCode = mappedUri.queryParameters['statusCode'];
    return statusCodes[statusCode] ?? WebPaymentsUriMatchResult.notMatched;
  }
}
