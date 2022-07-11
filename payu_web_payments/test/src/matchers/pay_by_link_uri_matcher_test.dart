import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/matchers/pay_by_link_uri_matcher.dart';
import 'package:payu_web_payments/src/matchers/web_payments_uri_matcher.dart';

void main() {
  late PayByLinkUriMatcher sut;
  late String continueUri = 'https://www.payu.com';

  setUp(() {
    sut = PayByLinkUriMatcher(continueUri);
  });

  group('PayByLinkUriMatcher', () {
    group('when matching result', () {
      test('when `uri` is empty redirection then result is `notMatched`', () {
        const uri = 'about:blank';
        final result = sut.result(uri);
        expect(result, WebPaymentsUriMatchResult.notMatched);
      });

      test('when `uri` is external redirection then result is `externalApplication`', () {
        const uri = 'mtm:another.app/key=value';
        final result = sut.result(uri);
        expect(result, WebPaymentsUriMatchResult.externalApplication);
      });

      test('when `uri` is not the same as `continueUri` then result is `notMatched`', () {
        const uri = 'https://www.another.payu.com';
        final result = sut.result(uri);
        expect(result, WebPaymentsUriMatchResult.notMatched);
      });

      test('when `uri` contains error query parameter then result is `failure`', () {
        const uri = 'https://www.payu.com?error=ERROR_CODE';
        final result = sut.result(uri);
        expect(result, WebPaymentsUriMatchResult.failure);
      });

      test('when `uri` is the same as `continueUri`then result is `success`', () {
        final uri = continueUri;
        final result = sut.result(uri);
        expect(result, WebPaymentsUriMatchResult.success);
      });
    });
  });
}
