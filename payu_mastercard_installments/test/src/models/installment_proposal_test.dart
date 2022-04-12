import 'package:flutter_test/flutter_test.dart';

import 'package:payu_mastercard_installments/src/models/installment_option_format.dart';
import 'package:payu_mastercard_installments/src/models/installment_proposal.dart';
import '../../resources/resource_reader.dart';

void main() {
  group('InstallmentProposal', () {
    group('`fromJson`', () {
      test('when `json` is correct then should map model correctly', () {
        final json = resource('test_installment_proposal.json');
        final model = InstallmentProposal.fromJson(json);

        expect(model.id, equals('95fd7066-2bd7-4476-9555-99aed5cc6a5e'));
        expect(model.cardScheme, equals('MC'));
        expect(model.installmentOptionFormat, equals(InstallmentOptionFormat.varyingNumberOfOptions));
        expect(model.currencyCode, equals('PLN'));
        expect(model.installmentOptions.length, equals(3));
      });
    });
  });
}
