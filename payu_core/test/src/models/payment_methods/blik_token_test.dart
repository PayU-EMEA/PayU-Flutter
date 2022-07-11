import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/blik_token.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('BlikToken', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_pbl_blik_token.json');
        final model = BlikToken.fromJson(json);

        expect(model.brandImageUrl, equals('https://static.payu.com/images/mobile/logos/pbl_blik.png'));
        expect(model.type, equals('UID'));
        expect(model.value, equals('TOKB_nuGYkknycEp3NDWAN2hh1c7FLnXseaLX'));

        expect(model.description, equals(null));
        expect(model.enabled, equals(true));
        expect(model.hash, equals(model.value));
        expect(model.name, equals('BLIK'));
      });
    });
  });
}
