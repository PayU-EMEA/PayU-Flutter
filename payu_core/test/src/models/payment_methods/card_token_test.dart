import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/card_token.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('CardToken', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_pbl_card_token.json');
        final model = CardToken.fromJson(json);

        expect(model.brandImageUrl, equals('https://static.payu.com/images/mobile/visa_off.png'));
        expect(model.cardExpirationMonth, equals('1'));
        expect(model.cardExpirationYear, equals('2019'));
        expect(model.cardNumberMasked, equals('401200******1112'));
        expect(model.cardScheme, equals('VS'));
        expect(model.preferred, equals(false));
        expect(model.status, equals(CardTokenStatus.expired));
        expect(model.value, equals('TOKC_QPY10DEHHLWPOMJIV5LWUZHG2DG'));

        expect(model.description, equals('1/2019'));
        expect(model.enabled, equals(false));
        expect(model.hash, equals(model.value));
        expect(model.name, equals(model.cardNumberMasked));
      });
    });
  });

  group('CardTokenStatus', () {
    test('should map status correctly', () {
      expect(CardTokenStatusFromExt.fromValue('ACTIVE'), equals(CardTokenStatus.active));
      expect(CardTokenStatusFromExt.fromValue('EXPIRED'), equals(CardTokenStatus.expired));
      expect(CardTokenStatusFromExt.fromValue('HELLOWORLD'), equals(CardTokenStatus.expired));
    });

    test('should map status value correctly', () {
      expect(CardTokenStatus.active.value, equals('ACTIVE'));
      expect(CardTokenStatus.expired.value, equals('EXPIRED'));
    });
  });
}
