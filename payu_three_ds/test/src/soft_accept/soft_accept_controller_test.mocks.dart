// Mocks generated by Mockito 5.2.0 from annotations
// in payu_three_ds/test/src/soft_accept/soft_accept_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_components.dart'
    as _i2;
import 'package:payu_three_ds/src/soft_accept/helpers/soft_accept_uri_modifier.dart'
    as _i7;
import 'package:payu_three_ds/src/soft_accept/models/soft_accept_message.dart'
    as _i6;
import 'package:payu_three_ds/src/soft_accept/models/soft_accept_request.dart'
    as _i3;
import 'package:payu_three_ds/src/soft_accept/soft_accept_service.dart' as _i4;
import 'package:webview_flutter/src/webview.dart' as _i8;
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUri_0 extends _i1.Fake implements Uri {}

/// A class which mocks [SoftAcceptComponents].
///
/// See the documentation for Mockito's code generation for more information.
class MockSoftAcceptComponents extends _i1.Mock
    implements _i2.SoftAcceptComponents {
  MockSoftAcceptComponents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String iframe(String? redirectUri) =>
      (super.noSuchMethod(Invocation.method(#iframe, [redirectUri]),
          returnValue: '') as String);
  @override
  String javascript(String? origin, String? channelName) =>
      (super.noSuchMethod(Invocation.method(#javascript, [origin, channelName]),
          returnValue: '') as String);
}

/// A class which mocks [SoftAcceptRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockSoftAcceptRequest extends _i1.Mock implements _i3.SoftAcceptRequest {
  MockSoftAcceptRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get redirectUri =>
      (super.noSuchMethod(Invocation.getter(#redirectUri), returnValue: '')
          as String);
}

/// A class which mocks [SoftAcceptService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSoftAcceptService extends _i1.Mock implements _i4.SoftAcceptService {
  MockSoftAcceptService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.SoftAcceptMessage?> postSoftAcceptLog(
          String? javascriptMessage, String? redirectUri) =>
      (super.noSuchMethod(
              Invocation.method(
                  #postSoftAcceptLog, [javascriptMessage, redirectUri]),
              returnValue: Future<_i6.SoftAcceptMessage?>.value())
          as _i5.Future<_i6.SoftAcceptMessage?>);
}

/// A class which mocks [SoftAcceptUriModifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockSoftAcceptUriModifier extends _i1.Mock
    implements _i7.SoftAcceptUriModifier {
  MockSoftAcceptUriModifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Uri modify(String? redirectUri) =>
      (super.noSuchMethod(Invocation.method(#modify, [redirectUri]),
          returnValue: _FakeUri_0()) as Uri);
}

/// A class which mocks [WebViewController].
///
/// See the documentation for Mockito's code generation for more information.
class MockWebViewController extends _i1.Mock implements _i8.WebViewController {
  MockWebViewController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> loadFile(String? absoluteFilePath) =>
      (super.noSuchMethod(Invocation.method(#loadFile, [absoluteFilePath]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> loadFlutterAsset(String? key) =>
      (super.noSuchMethod(Invocation.method(#loadFlutterAsset, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> loadHtmlString(String? html, {String? baseUrl}) =>
      (super.noSuchMethod(
          Invocation.method(#loadHtmlString, [html], {#baseUrl: baseUrl}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> loadUrl(String? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(
          Invocation.method(#loadUrl, [url], {#headers: headers}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> loadRequest(_i9.WebViewRequest? request) =>
      (super.noSuchMethod(Invocation.method(#loadRequest, [request]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String?> currentUrl() =>
      (super.noSuchMethod(Invocation.method(#currentUrl, []),
          returnValue: Future<String?>.value()) as _i5.Future<String?>);
  @override
  _i5.Future<bool> canGoBack() =>
      (super.noSuchMethod(Invocation.method(#canGoBack, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> canGoForward() =>
      (super.noSuchMethod(Invocation.method(#canGoForward, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<void> goBack() =>
      (super.noSuchMethod(Invocation.method(#goBack, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> goForward() =>
      (super.noSuchMethod(Invocation.method(#goForward, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> clearCache() =>
      (super.noSuchMethod(Invocation.method(#clearCache, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> evaluateJavascript(String? javascriptString) => (super
      .noSuchMethod(Invocation.method(#evaluateJavascript, [javascriptString]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> runJavascript(String? javaScriptString) =>
      (super.noSuchMethod(Invocation.method(#runJavascript, [javaScriptString]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> runJavascriptReturningResult(String? javaScriptString) =>
      (super.noSuchMethod(
          Invocation.method(#runJavascriptReturningResult, [javaScriptString]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String?> getTitle() =>
      (super.noSuchMethod(Invocation.method(#getTitle, []),
          returnValue: Future<String?>.value()) as _i5.Future<String?>);
  @override
  _i5.Future<void> scrollTo(int? x, int? y) =>
      (super.noSuchMethod(Invocation.method(#scrollTo, [x, y]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> scrollBy(int? x, int? y) =>
      (super.noSuchMethod(Invocation.method(#scrollBy, [x, y]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<int> getScrollX() =>
      (super.noSuchMethod(Invocation.method(#getScrollX, []),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> getScrollY() =>
      (super.noSuchMethod(Invocation.method(#getScrollY, []),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
}
