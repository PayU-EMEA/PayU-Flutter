import 'package:flutter_test/flutter_test.dart';

import 'package:payu_web_payments/src/matchers/pay_by_link_uri_matcher.dart';
import 'package:payu_web_payments/src/matchers/web_payments_uri_matcher.dart';

void main() {
  late PayByLinkUriMatcher sut;
  late String continueUri = 'https://www.payu.com';

  group('PayByLinkUriMatcher for iOS', () {
    setUp(() {
      sut = PayByLinkUriMatcher(continueUri, true);
    });

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

      test('when platform is iOS and `uri` matches a credit provider URL then result is `creditExternalApplication`', () {
        expect(sut.result("https://www.wniosek.santanderconsumer.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.pardapu.inbank.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.smartney.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.raty.aliorbank.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.form.mbank.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.ewniosek.credit-agricole.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.bank-simulator-merch-prod.snd.payu.com/simulator/spring/sandbox/utf8/installment/form?a=11111"),
            WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.smartneydevweb.z6.web.core.windows.net/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
        expect(sut.result("https://www.demo-pardapu.inbank.pl/form?a=11111"), WebPaymentsUriMatchResult.creditExternalApplication);
      });
    });
  });

  group('PayByLinkUriMatcher for non-iOS', () {
    setUp(() {
      sut = PayByLinkUriMatcher(continueUri, false);
    });

    group('when not matching credit', () {
      test('when platform is not iOS and `uri` matches a credit provider URL then result is `notMatched`', () {
        expect(sut.result("https://www.wniosek.santanderconsumer.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.pardapu.inbank.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.smartney.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.raty.aliorbank.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.form.mbank.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.ewniosek.credit-agricole.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.bank-simulator-merch-prod.snd.payu.com/simulator/spring/sandbox/utf8/installment/form?a=11111"),
            WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.smartneydevweb.z6.web.core.windows.net/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
        expect(sut.result("https://www.demo-pardapu.inbank.pl/form?a=11111"), WebPaymentsUriMatchResult.notMatched);
      });
    });
  });
}
