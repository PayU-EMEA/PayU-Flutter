import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_terms_and_conditions/src/terms_and_conditions_assembler.dart';
import 'package:payu_terms_and_conditions/src/terms_and_conditions_controller.dart';

void main() {
  late TermsAndConditionsAssembler sut;

  setUp(() {
    sut = TermsAndConditionsAssembler();
  });

  group('TermsAndConditionsAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<PayuLauncher>(), isA<PayuLauncher>());
        expect(sut.find<TermsAndConditionsController>(), isA<TermsAndConditionsController>());
      });
    });
  });
}
