import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/response/google_pay_payment_data.dart';

import '../../../resources/resource_reader.dart';

void main() {
  group('GooglePayPaymentData', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_google_pay_payment_data.json');
        final sut = GooglePayPaymentData.fromJson(json);

        expect(sut.apiVersion, equals(3716316847));
        expect(sut.apiVersionMinor, equals(2166314577));

        expect(sut.paymentMethodData.type, equals('vGrJagErhv'));
        expect(sut.paymentMethodData.description, equals('EterfGYVNs'));
        expect(sut.paymentMethodData.tokenizationData.type, equals('jXmStQhNYU'));
        expect(sut.paymentMethodData.tokenizationData.token, equals('tMlLUdUjqN'));
      });
    });
  });
}
