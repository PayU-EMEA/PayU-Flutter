import 'package:flutter_test/flutter_test.dart';

import 'package:payu_mastercard_installments/src/models/installment_option_format.dart';

void main() {
  group('PayByLinkStatus', () {
    test('should map status correctly', () {
      expect(
        InstallmentOptionFormatFromExt.fromValue('VARYING_NUMBER_OF_INSTALLMENTS'),
        equals(InstallmentOptionFormat.varyingNumberOfInstallments),
      );
      expect(
        InstallmentOptionFormatFromExt.fromValue('VARYING_NUMBER_OF_OPTIONS'),
        equals(InstallmentOptionFormat.varyingNumberOfOptions),
      );
    });

    test('should map status value correctly', () {
      expect(InstallmentOptionFormat.varyingNumberOfInstallments.value, equals('VARYING_NUMBER_OF_INSTALLMENTS'));
      expect(InstallmentOptionFormat.varyingNumberOfOptions.value, equals('VARYING_NUMBER_OF_OPTIONS'));
    });
  });
}
