import 'package:flutter_test/flutter_test.dart';

import 'package:payu_core/src/models/payment_methods/installments.dart';
import 'package:payu_core/src/models/payment_methods/pay_by_link.dart';
import '../../../resources/resource_reader.dart';

void main() {
  group('Installments', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_pbl_installments.json');
        final pbl = PayByLink.fromJson(json);
        final model = Installments.fromPayByLink(pbl);

        expect(model.brandImageUrl, equals('https://static.payu.com/images/mobile/logos/pbl_ai.png'));
        expect(model.status, equals(PayByLinkStatus.enabled));
        expect(model.value, equals('ai'));

        expect(model.description, equals(null));
        expect(model.enabled, equals(true));
        expect(model.hash, equals(model.value));
        expect(model.name, equals('Raty PayU'));
      });
    });
  });
}
