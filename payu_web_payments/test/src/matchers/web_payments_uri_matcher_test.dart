import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/matchers/web_payments_uri_matcher.dart';

void main() {
  late WebPaymentsUriMatcher sut;

  setUp(() {
    sut = WebPaymentsUriMatcher();
  });

  group('WebPaymentsUriMatcher', () {
    test('should match about URI scheme correctly', () {
      expect(sut.matchAboutURIScheme(Uri.parse('about:blank')), true);
      expect(sut.matchAboutURIScheme(Uri.parse('about:srcdoc')), true);
      expect(sut.matchAboutURIScheme(Uri.parse('about:cache?device=memory')), true);
      expect(sut.matchAboutURIScheme(Uri.parse('about:startpage')), true);
      expect(sut.matchAboutURIScheme(Uri.parse('https://www.pay.com')), false);
      expect(sut.matchAboutURIScheme(Uri.parse('tel:123123123')), false);
      expect(sut.matchAboutURIScheme(Uri.parse('app://testapp')), false);
      expect(sut.matchAboutURIScheme(Uri.parse('https://about.pl/test?:blank')), false);
    });

    test('should match external scheme correctly', () {
      expect(sut.matchExternalScheme(Uri.parse('http://www.pay.com')), false);
      expect(sut.matchExternalScheme(Uri.parse('mtm://hello.world')), true);
    });

    test('should match statusCode query parameter correctly', () {
      expect(sut.matchStatusCode(Uri.parse('https://www.pay.com?statusCode=STATUS_CODE')), true);
      expect(sut.matchStatusCode(Uri.parse('https://www.pay.com?invalidStatusCode=STATUS_CODE')), false);
      expect(sut.matchStatusCode(Uri.parse('https://www.pay.com')), false);
    });

    test('should match continueUri correctly', () {
      expect(sut.matchContinueUri(Uri.parse('https://www.mock_payu.com'), Uri.parse('https://www.payu.com')), false);
      expect(sut.matchContinueUri(Uri.parse('https://www.payu.com'), Uri.parse('https://www.payu.com')), true);
      expect(sut.matchContinueUri(Uri.parse('https://www.payu.com/'), Uri.parse('https://www.payu.com')), true);
      expect(sut.matchContinueUri(Uri.parse('https://www.payu.com'), Uri.parse('https://www.payu.com/')), true);
    });

    test('should match uri with error correctly', () {
      expect(sut.matchContinueUriWithError(Uri.parse('https://www.payu.com')), false);
      expect(sut.matchContinueUriWithError(Uri.parse('https://www.pay.com?invalidStatusCode=STATUS_CODE')), false);
      expect(sut.matchContinueUriWithError(Uri.parse('https://www.pay.com?error=ERROR_CODE')), true);
      expect(sut.matchContinueUriWithError(Uri.parse('https://www.pay.com?failure=FAILURE_CODE')), true);
    });
  });
}
