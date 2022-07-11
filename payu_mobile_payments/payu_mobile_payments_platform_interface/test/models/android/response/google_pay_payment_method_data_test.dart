import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/response/google_pay_payment_method_data.dart';

import '../../../resources/resource_reader.dart';

void main() {
  group('GooglePayPaymentMethodData', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_google_pay_payment_method_data.json');
        final sut = GooglePayPaymentMethodData.fromJson(json);

        expect(sut.type, equals('vGrJagErhv'));
        expect(sut.description, equals('EterfGYVNs'));
        expect(sut.tokenizationData.type, equals('jXmStQhNYU'));
        expect(sut.tokenizationData.token, equals('tMlLUdUjqN'));
      });
    });
  });
}
