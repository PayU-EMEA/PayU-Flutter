import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/src/models/payment_methods/payment_method_value.dart';

void main() {
  group('PaymentMethodValue', () {
    test('`applePay` contains correct value', () {
      expect(PaymentMethodValue.applePay, equals('jp'));
    });
    test('`blikCode` contains correct value', () {
      expect(PaymentMethodValue.blikCode, equals('blik_code'));
    });
    test('`googlePay` contains correct value', () {
      expect(PaymentMethodValue.googlePay, equals('ap'));
    });
    test('`mastercardInstallments` contains correct value', () {
      expect(PaymentMethodValue.mastercardInstallments, equals('ai'));
    });
  });
}
