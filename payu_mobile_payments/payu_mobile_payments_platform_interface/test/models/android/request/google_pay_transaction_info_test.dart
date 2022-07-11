import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_transaction_info.dart';

void main() {
  group('GooglePayTransactionInfo', () {
    test('`constants` are correct', () {
      expect(GooglePayTransactionInfo.totalPriceStatusFinal, equals('FINAL'));
    });

    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayTransactionInfo(
          currencyCode: 'evlzubzmvf',
          countryCode: 'aqmlqwczuf',
          totalPriceStatus: 'zpgfnlwzwh',
          totalPrice: 'pzxjtwfnim',
        );

        final json = sut.toJson();
        expect(json['currencyCode'], equals('evlzubzmvf'));
        expect(json['countryCode'], equals('aqmlqwczuf'));
        expect(json['totalPriceStatus'], equals('zpgfnlwzwh'));
        expect(json['totalPrice'], equals('pzxjtwfnim'));
      });
    });
  });
}
