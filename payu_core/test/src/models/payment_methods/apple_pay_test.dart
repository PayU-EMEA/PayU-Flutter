import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/apple_pay.dart';
import 'package:payu_core/src/models/payment_methods/pay_by_link.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('ApplePay', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_pbl_apple_pay.json');
        final pbl = PayByLink.fromJson(json);
        final model = ApplePay.fromPayByLink(pbl);

        expect(model.brandImageUrl, equals('https://static.payu.com/images/mobile/logos/pbl_jp.png'));
        expect(model.status, equals(PayByLinkStatus.enabled));
        expect(model.value, equals('jp'));

        expect(model.description, equals(null));
        expect(model.enabled, equals(true));
        expect(model.hash, equals(model.value));
        expect(model.name, equals('Apple Pay'));
      });
    });
  });
}
