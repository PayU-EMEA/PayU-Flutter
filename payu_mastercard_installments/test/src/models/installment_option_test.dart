import 'package:flutter_test/flutter_test.dart';

import 'package:payu_mastercard_installments/src/models/installment_option.dart';
import '../../resources/resource_reader.dart';

void main() {
  group('InstallmentOption', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_installment_option.json');
        final model = InstallmentOption.fromJson(json);

        expect(model.id, equals('1'));
        expect(model.interestRate, equals(5.4));
        expect(model.installmentFeeAmount, equals(1000));
        expect(model.annualPercentageRate, equals(17.93));
        expect(model.totalAmountDue, equals(49440));

        expect(model.firstInstallmentAmount, equals(16480));
        expect(model.installmentAmount, equals(16480));
        expect(model.numberOfInstallments, equals(3));
      });
    });
  });
}
