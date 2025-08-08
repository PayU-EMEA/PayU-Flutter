import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:payu_web_payments/payu_web_payments.dart';
import 'package:payu_web_payments/src/matchers/web_payments_uri_matcher.dart';
import 'package:payu_web_payments/src/web_payments_controller.dart';
import 'web_payments_controller_test.mocks.dart';

@GenerateMocks([
  PayuLauncher,
  WebPaymentsControllerDelegate,
  WebPaymentsUriMatcher,
  WebPaymentsResult,
  WebPaymentsRequest,
  WebViewController,
])
void main() {
  late MockPayuLauncher launcher;
  late MockWebPaymentsControllerDelegate delegate;
  late MockWebPaymentsUriMatcher matcher;
  late MockWebPaymentsRequest request;
  late MockWebViewController webViewController;

  late WebPaymentsController sut;

  setUp(() {
    launcher = MockPayuLauncher();
    delegate = MockWebPaymentsControllerDelegate();
    matcher = MockWebPaymentsUriMatcher();
    request = MockWebPaymentsRequest();
    webViewController = MockWebViewController();
    sut = WebPaymentsController(delegate, request, matcher, launcher);

    sut.didUpdateWebViewController(webViewController);
  });

  group('WebPaymentsController', () {
    group('when created', () {
      test('then `initialUri` is the same as in `request`', () {
        when(request.redirectUri).thenReturn('https://www.payu.com');
        expect(sut.initialUri, request.redirectUri);
      });
    });

    group('when `didUpdateWebResourceError`', () {
      test('when the error code is `-1200` then delegate method is called', () {
        final e = WebResourceError(errorCode: -1200, description: 'description');
        sut.didUpdateWebResourceError(e);
        verify(delegate.showWebResourceErrorAlertDialog());
      });
    });

    group('when `didStartNavigation`', () {
      test('then passed `uri` should be saved', () {
        const uri = 'https://merch-prod.snd.payu.com/np/newpayment.resume.action';
        sut.didStartNavigation(uri);
        expect(sut.uri.toString(), uri);
      });
    });

    group('when `didFinishNavigation`', () {
      test('then passed `uri` should be saved', () {
        const uri = 'https://merch-prod.snd.payu.com/np/newpayment.resume.action';
        sut.didFinishNavigation(uri);
        expect(sut.uri.toString(), uri);
      });
    });

    group('when `didTapBackButton`', () {
      test('when webViewController `canGoBack` is true then webViewController `goBack` is called', () async {
        when(webViewController.canGoBack()).thenAnswer((e) async => true);
        await sut.didTapBackButton();
        verify(webViewController.goBack());
      });

      test('when webViewController `canGoBack` is false then delegate should show alert dialog', () async {
        when(webViewController.canGoBack()).thenAnswer((e) async => false);
        await sut.didTapBackButton();
        verifyNever(webViewController.goBack());
        verify(delegate.showBackAlertDialog());
      });
    });

    group('when `didConfirmCancelPayment`', () {
      test('then flow should complete with `cancelled` status', () async {
        when(request.redirectUri).thenReturn('https://www.payu.com');

        const status = WebPaymentsStatus.cancelled;
        final result = WebPaymentsResult(status: status, uri: request.redirectUri);
        sut.didConfirmCancelPayment();
        verify(delegate.didComplete(result));
      });
    });

    group('when `didConfirmWebResourceError`', () {
      test('then flow should complete with `failure` status', () async {
        when(request.redirectUri).thenReturn('https://www.payu.com');

        const status = WebPaymentsStatus.failure;
        final result = WebPaymentsResult(status: status, uri: request.redirectUri);
        sut.didConfirmWebResourceError();
        verify(delegate.didComplete(result));
      });
    });

    group('when `didProceedWithCreditExternalApplication`', () {
      test('then flow should complete with `externalBrowser` status', () async {
        when(launcher.launchInBrowser(any)).thenAnswer((e) async => true);

        var redirectUri = 'https://www.payu.com';
        when(request.redirectUri).thenReturn(redirectUri);

        const status = WebPaymentsStatus.externalBrowser;
        final result = WebPaymentsResult(status: status, uri: request.redirectUri);
        sut.didProceedWithCreditExternalApplication(redirectUri);
        verify(launcher.launchInBrowser(redirectUri));
        verify(delegate.didComplete(result));
      });
    });

    group('when `didAbortCreditExternalApplication`', () {
      test('then flow should complete with `cancelled` status', () async {
        when(request.redirectUri).thenReturn('https://www.payu.com');

        const status = WebPaymentsStatus.cancelled;
        final result = WebPaymentsResult(status: status, uri: request.redirectUri);
        sut.didAbortCreditExternalApplication();
        verify(delegate.didComplete(result));
      });
    });

    group('when `navigationDecision`', () {
      test('when matcher result is `notMatched` then should not complete', () async {
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.notMatched);

        const uri = 'https://www.payu.com';

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.navigate);
        verifyNever(delegate.didComplete(any));
      });

      test('when matcher result is `success` then should complete with `success` status', () async {
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.success);

        const uri = 'https://www.payu.com';
        const status = WebPaymentsStatus.success;
        const result = WebPaymentsResult(status: status, uri: uri);

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.prevent);
        verify(delegate.didComplete(result));
      });

      test('when matcher result is `failure` then should complete with `failure` status', () async {
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.failure);

        const uri = 'https://www.payu.com';
        const status = WebPaymentsStatus.failure;
        const result = WebPaymentsResult(status: status, uri: uri);

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.prevent);
        verify(delegate.didComplete(result));
      });

      test('when matcher result is `continue3DS` then should complete with `continue3DS` status', () async {
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.continue3DS);

        const uri = 'https://www.payu.com';
        const status = WebPaymentsStatus.continue3DS;
        const result = WebPaymentsResult(status: status, uri: uri);

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.navigate);
        verify(delegate.didComplete(result));
      });

      test('when matcher result is `continueCvv` then should complete with `continueCvv` status', () async {
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.continueCvv);

        const uri = 'https://www.payu.com';
        const status = WebPaymentsStatus.continueCvv;
        const result = WebPaymentsResult(status: status, uri: uri);

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.navigate);
        verify(delegate.didComplete(result));
      });

      test('when matcher result is `external` then should complete with `external` status', () async {
        when(launcher.launch(any)).thenAnswer((e) async => true);
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.externalApplication);

        const uri = 'https://www.payu.com';
        const status = WebPaymentsStatus.externalApplication;
        const result = WebPaymentsResult(status: status, uri: uri);

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.prevent);
        verify(launcher.launch(uri));
        verify(delegate.didComplete(result));
      });

      test('when matcher result is `creditExternalApplication` then should show the provider redirect dialog', () async {
        when(launcher.launchInBrowser(any)).thenAnswer((e) async => true);
        when(matcher.result(any)).thenReturn(WebPaymentsUriMatchResult.creditExternalApplication);

        const uri = 'https://www.payu.com';

        final decision = sut.navigationDecision(uri);
        expect(decision, NavigationDecision.prevent);
        verify(delegate.showProviderRedirectDialog(uri));
      });
    });
  });
}
