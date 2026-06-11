import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/network/models/card_installments_request.dart';

void main() {
  group('CardInstallmentsRequest', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = CardInstallmentsRequest(
          cardBin: '1234567890',
          internalPosId: 'pos-id',
        );

        expect(model.toJson(), {
          'cardBin': model.cardBin,
          'internalPosId': model.internalPosId,
        });
      });
    });

    group('`toString`', () {
      test('should include runtime type and json data', () {
        const model = CardInstallmentsRequest(
          cardBin: '1234567890',
          internalPosId: 'pos-id',
        );

        expect(model.toString(), contains('CardInstallmentsRequest'));
        expect(model.toString(), contains('1234567890'));
        expect(model.toString(), contains('pos-id'));
      });
    });
  });
}

