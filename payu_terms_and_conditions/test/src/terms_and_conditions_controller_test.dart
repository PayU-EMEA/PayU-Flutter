import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_terms_and_conditions/src/terms_and_conditions_controller.dart';
import 'terms_and_conditions_controller_test.mocks.dart';

@GenerateMocks([
  PayuLauncher,
])
void main() {
  late MockPayuLauncher launcher;
  late TermsAndConditionsController sut;

  setUp(() {
    launcher = MockPayuLauncher();
    sut = TermsAndConditionsController(launcher);
  });

  group('TermsAndConditionsController', () {
    group('`didTap`', () {
      test('when user tap `link` then should open `link` via `launcher`', () {
        const uri = 'https://www.payu.com';
        when(launcher.launch(uri)).thenAnswer((e) async => true);
        sut.didTap(uri);
        verify(launcher.launch(uri));
      });
    });
  });
}
