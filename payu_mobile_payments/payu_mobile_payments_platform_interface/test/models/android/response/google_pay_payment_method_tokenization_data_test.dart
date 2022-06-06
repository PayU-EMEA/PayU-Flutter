import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/response/google_pay_payment_method_tokenization_data.dart';

import '../../../resources/resource_reader.dart';

void main() {
  group('GooglePayPaymentMethodTokenizationData', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_google_pay_payment_method_tokenization_data.json');
        final sut = GooglePayPaymentMethodTokenizationData.fromJson(json);

        expect(sut.type, equals('DeijEbvfSh'));
        expect(sut.token, equals('JkIqyxkIpm'));
      });
    });
  });
}
