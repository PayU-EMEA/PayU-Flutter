import 'package:flutter_test/flutter_test.dart';

import 'package:payu_mastercard_installments/src/models/installment_result.dart';

void main() {
  group('InstallmentResult', () {
    group('`toJson`', () {
      test('should map model correctly', () {
        const model = InstallmentResult(optionId: 'HELLO', numberOfInstallments: 8);
        final json = model.toJson();
        expect(json['optionId'], equals('HELLO'));
        expect(json['numberOfInstallments'], equals(8));
      });
    });
  });
}
