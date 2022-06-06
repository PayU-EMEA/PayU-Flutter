import 'package:flutter_test/flutter_test.dart';
import 'package:payu_mobile_payments_platform_interface/models/android/request/google_pay_merchant_info.dart';

void main() {
  group('GooglePayMerchantInfo', () {
    group('`toJson`', () {
      test('when called then should map model correctly', () {
        const sut = GooglePayMerchantInfo(
          merchantId: '33920',
          merchantName: 'aqmlqwczuf',
        );

        final json = sut.toJson();
        expect(json['merchantId'], equals('33920'));
        expect(json['merchantName'], equals('aqmlqwczuf'));
      });
    });
  });
}
