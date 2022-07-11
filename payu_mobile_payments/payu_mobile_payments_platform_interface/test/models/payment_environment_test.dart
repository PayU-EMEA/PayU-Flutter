import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/payment_environment.dart';

void main() {
  group('PaymentEnvironment', () {
    test('`production` should have correct value', () {
      expect(PaymentEnvironment.production.value, equals('production'));
    });

    test('`test` should have correct value', () {
      expect(PaymentEnvironment.test.value, equals('test'));
    });
  });
}


// class PaymentEnvironment {
//   static const production = PaymentEnvironment._('production');
//   static const test = PaymentEnvironment._('test');

//   final String value;

//   const PaymentEnvironment._(this.value);
// }
