import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/matchers/three_ds_uri_matcher.dart';
import 'package:payu_web_payments/src/matchers/web_payments_uri_matcher.dart';

void main() {
  late ThreeDSUriMatcher sut;
  late String continueUri = 'https://www.payu.com';

  setUp(() {
    sut = ThreeDSUriMatcher(continueUri);
  });

  group('ThreeDSUriMatcher', () {
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

      group('when `uri` contains `statusCode` query parameter', () {
        test('and `statusCode` is WARNING_CONTINUE_3DS when result is continue3DS', () {
          const uri = 'https://www.payu.com?statusCode=WARNING_CONTINUE_3DS';
          final result = sut.result(uri);
          expect(result, WebPaymentsUriMatchResult.continue3DS);
        });

        test('and `statusCode` is WARNING_CONTINUE_CVV when result is continueCvv', () {
          const uri = 'https://www.payu.com?statusCode=WARNING_CONTINUE_CVV';
          final result = sut.result(uri);
          expect(result, WebPaymentsUriMatchResult.continueCvv);
        });

        test('and `statusCode` is UNSUPPORTED when result is notMatched', () {
          const uri = 'https://www.payu.com?statusCode=UNSUPPORTED';
          final result = sut.result(uri);
          expect(result, WebPaymentsUriMatchResult.notMatched);
        });
      });
    });
  });
}
