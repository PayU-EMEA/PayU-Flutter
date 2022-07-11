import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:payu_mastercard_installments/payu_mastercard_installments.dart';
import 'package:payu_mastercard_installments/src/pages/options/mappers/installments_options_data_mapper.dart';
import '../../../../resources/resource_reader.dart';
import 'installments_options_data_mapper_test.mocks.dart';

@GenerateMocks([NumberFormat])
void main() {
  late MockNumberFormat percentageFormatter;
  late MockNumberFormat priceFormatter;
  late InstallmentsOptionsDataMapper sut;

  setUp(() {
    percentageFormatter = MockNumberFormat();
    priceFormatter = MockNumberFormat();
    sut = InstallmentsOptionsDataMapper(percentageFormatter, priceFormatter);
  });

  group('InstallmentsOptionsDataMapper', () {
    group('`map`', () {
      test('when mapping `VARYING_NUMBER_OF_INSTALLMENTS` then should map correctly', () {
        when(percentageFormatter.format(any)).thenReturn('0.0%');
        when(priceFormatter.format(any)).thenReturn('zł 1.25');

        final json = resource('test_mastercard_installments_vnoi.json');
        final model = InstallmentProposal.fromJson(json);

        final result = sut.map(model);
        expect(result.length, equals(7));
      });

      test('when mapping `VARYING_NUMBER_OF_OPTIONS` then should map correctly', () {
        when(percentageFormatter.format(any)).thenReturn('0.0%');
        when(priceFormatter.format(any)).thenReturn('zł 1.25');

        final json = resource('test_mastercard_installments_vnoo.json');
        final model = InstallmentProposal.fromJson(json);

        final result = sut.map(model);
        expect(result.length, equals(3));
      });
    });
  });
}
