import 'web_payments_uri_matcher.dart';

class PayByLinkUriMatcher extends WebPaymentsUriMatcher {
  final List<String> _creditProviderUrls = const <String>[
    // production
    "wniosek.santanderconsumer.pl",
    "pardapu.inbank.pl",
    "smartney.pl",
    "raty.aliorbank.pl",
    "form.mbank.pl",
    "ewniosek.credit-agricole.pl",
    // sandbox
    "bank-simulator-merch-prod.snd.payu.com/simulator/spring/sandbox/utf8/installment",
    // sandbox-beta
    "smartneydevweb.z6.web.core.windows.net",
    "demo-pardapu.inbank.pl"
  ];

  final String _continueUri;
  final bool _isIOS;

  PayByLinkUriMatcher(this._continueUri, this._isIOS);

  @override
  WebPaymentsUriMatchResult result(String uri) {
    final mappedUri = Uri.parse(uri);
    final mappedContinueUri = Uri.parse(_continueUri);

    if (_isIOS && _matchCreditProviderUrl(uri)) return WebPaymentsUriMatchResult.creditExternalApplication;
    if (matchAboutURIScheme(mappedUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchExternalScheme(mappedUri)) return WebPaymentsUriMatchResult.externalApplication;
    if (!matchContinueUri(mappedUri, mappedContinueUri)) return WebPaymentsUriMatchResult.notMatched;
    if (matchContinueUriWithError(mappedUri)) return WebPaymentsUriMatchResult.failure;

    return WebPaymentsUriMatchResult.success;
  }

  bool _matchCreditProviderUrl(String uri) {
    for (final providerUrl in _creditProviderUrls) {
      if (uri.contains(providerUrl)) {
        return true;
      }
    }
    return false;
  }
}
