import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:payu_add_card/src/page/add_card_page_assembler.dart';
import 'package:payu_add_card/src/page/add_card_page_controller.dart';
import 'add_card_page_assembler_test.mocks.dart';

@GenerateMocks([
  AddCardPageControllerDelegate,
])
void main() {
  late MockAddCardPageControllerDelegate delegate;
  late AddCardPageAssembler sut;

  setUp(() {
    delegate = MockAddCardPageControllerDelegate();
    sut = AddCardPageAssembler(delegate);
  });

  group('AddCardPageAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<AddCardPageController>(), isA<AddCardPageController>());
      });
    });
  });
}
