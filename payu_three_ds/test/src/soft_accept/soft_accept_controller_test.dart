import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:payu_three_ds/payu_three_ds.dart';
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_components.dart';
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_uri_modifier.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_controller.dart';
import 'package:payu_three_ds/src/soft_accept/soft_accept_service.dart';
import 'soft_accept_controller_test.mocks.dart';

@GenerateMocks([
  SoftAcceptComponents,
  SoftAcceptRequest,
  SoftAcceptService,
  SoftAcceptUriModifier,
  WebViewController,
])
void main() {
  const redirectUri = 'https://www.example.com?authenticationId=276c1934-fd80-43d9';
  const modifiedUri = 'https://www.example.com?authenticationId=276c1934-fd80-43d9&hello=world';

  late MockSoftAcceptComponents components;
  late MockSoftAcceptRequest request;
  late MockSoftAcceptService service;
  late MockSoftAcceptUriModifier modifier;
  late WebViewController webViewController;

  late SoftAcceptController sut;

  setUp(() {
    components = MockSoftAcceptComponents();
    request = MockSoftAcceptRequest();
    service = MockSoftAcceptService();
    modifier = MockSoftAcceptUriModifier();
    webViewController = MockWebViewController();

    sut = SoftAcceptController(request, components, service, modifier);

    Payu.environment = Environment.sandbox;

    when(request.redirectUri).thenReturn(redirectUri);
    when(modifier.modify(any)).thenReturn(Uri.parse(modifiedUri));
  });

  group('`SoftAcceptController`', () {
    group('`onInit`', () {
      test('when initialized then `redirectUri` should be correct', () {
        expect(sut.redirectUri, equals(modifiedUri));
      });
    });

    group('`didCreateWebViewController`', () {
      test('when called then passed `controller` should be saved', () {
        sut.didCreateWebViewController(webViewController);
        expect(sut.webViewController, equals(webViewController));
      });
    });

    group('`didCompleteProcessingPage`', () {
      test('when called then should run javascript', () {
        const javascript = 'javascript';
        when(components.javascript(any, any)).thenReturn(javascript);
        sut.didCreateWebViewController(webViewController);
        sut.didCompleteProcessingPage();
        verify(webViewController.runJavascript(javascript));
      });
    });

    group('`handleJavascriptMessage`', () {
      test('when called then should run javascript', () async {
        const javascriptMessage = 'javascriptMessage';
        const message = SoftAcceptMessage.authenticationSuccessful;

        when(service.postSoftAcceptLog(any, any)).thenAnswer((e) async => message);
        expect(await sut.handleJavascriptMessage(javascriptMessage), equals(message));
        verify(service.postSoftAcceptLog(javascriptMessage, sut.redirectUri));
      });
    });
  });
}
