import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'matchers/web_payments_uri_matcher.dart';
import 'models/web_payments_request.dart';
import 'models/web_payments_result.dart';
import 'models/web_payments_status.dart';

mixin WebPaymentsControllerDelegate {
  void showBackAlertDialog();
  void showWebResourceErrorAlertDialog();
  void showProviderRedirectDialog(String uri);

  void didComplete(WebPaymentsResult result);
}

class WebPaymentsController extends PayuController {
  static const _sslErrorsCodes = [-1200];

  final WebPaymentsControllerDelegate _delegate;
  final WebPaymentsRequest _request;
  final WebPaymentsUriMatcher _matcher;
  final PayuLauncher _launcher;

  Uri get uri => Uri.parse(_uri);
  bool get isSecureUri => _webResourceError == null;
  String get initialUri => _request.redirectUri;

  late String _uri = _request.redirectUri;
  late WebViewController _webViewController;
  WebResourceError? _webResourceError;

  WebPaymentsController(this._delegate, this._request, this._matcher, this._launcher);

  Future<bool> canGoBack() {
    return _webViewController.canGoBack();
  }

  void didUpdateWebViewController(WebViewController webViewController) {
    _webViewController = webViewController;
  }

  void didUpdateWebResourceError(WebResourceError webResourceError) {
    // TODO: - ADD SSL ERROR CODE FOR ANDROID
    if (_sslErrorsCodes.contains(webResourceError.errorCode)) _delegate.showWebResourceErrorAlertDialog();

    _webResourceError = webResourceError;
    notifyListeners();
    Logger.logInfo('didUpdateWebResourceError webResourceError: $webResourceError');
    Logger.logInfo('didUpdateWebResourceError isSecureUri: $isSecureUri');
  }

  void didStartNavigation(String uri) {
    Logger.logInfo('didStartNavigation uri: $uri');
    _uri = uri;
    _webResourceError = null;
    notifyListeners();
  }

  void didFinishNavigation(String uri) {
    Logger.logInfo('didFinishNavigation uri: $uri');
    _uri = uri;
    notifyListeners();
  }

  Future didTapBackButton() async {
    if (await canGoBack()) {
      await _webViewController.goBack();
    } else {
      _delegate.showBackAlertDialog();
    }
  }

  void didConfirmCancelPayment() {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.cancelled, uri: _uri));
  }

  void didConfirmWebResourceError() {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.failure, uri: _uri));
  }

  void didProceedWithCreditExternalApplication(String uri) {
    _launcher.launchInBrowser(uri);
    _completeCreditExternalApplication(uri);
  }

  void didAbortCreditExternalApplication() {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.cancelled, uri: _uri));
  }

  NavigationDecision navigationDecision(String uri) {
    final result = _matcher.result(uri);
    Logger.logInfo('navigationDecision uri: $uri');
    Logger.logInfo('navigationDecision result: $result');

    switch (result) {
      case WebPaymentsUriMatchResult.notMatched:
        return NavigationDecision.navigate;
      case WebPaymentsUriMatchResult.success:
        _completeSuccess(uri);
        return NavigationDecision.prevent;
      case WebPaymentsUriMatchResult.failure:
        _completeFailure(uri);
        return NavigationDecision.prevent;
      case WebPaymentsUriMatchResult.continue3DS:
        _completeContinue3DS(uri);
        return NavigationDecision.navigate;
      case WebPaymentsUriMatchResult.continueCvv:
        _completeContinueCVV(uri);
        return NavigationDecision.navigate;
      case WebPaymentsUriMatchResult.externalApplication:
        _launcher.launch(uri);
        _completeExternalApplication(uri);
        return NavigationDecision.prevent;
      case WebPaymentsUriMatchResult.creditExternalApplication:
        _delegate.showProviderRedirectDialog(uri);
        return NavigationDecision.prevent;
    }
  }

  void _completeSuccess(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.success, uri: uri));
  }

  void _completeFailure(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.failure, uri: uri));
  }

  void _completeContinue3DS(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.continue3DS, uri: uri));
  }

  void _completeContinueCVV(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.continueCvv, uri: uri));
  }

  void _completeExternalApplication(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.externalApplication, uri: uri));
  }

  void _completeCreditExternalApplication(String uri) {
    _complete(WebPaymentsResult(status: WebPaymentsStatus.externalBrowser, uri: uri));
  }

  void _complete(WebPaymentsResult result) {
    _delegate.didComplete(result);
  }
}
