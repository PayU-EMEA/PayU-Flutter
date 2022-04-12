import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_add_card/payu_add_card.dart';
import 'package:payu_add_card/src/page/add_card_page_controller.dart';
import '../../resources/resource_reader.dart';
import 'add_card_page_controller_test.mocks.dart';

@GenerateMocks([
  AddCardPageControllerDelegate,
  AddCardService,
])
void main() {
  late MockAddCardPageControllerDelegate delegate;
  late MockAddCardService service;
  late AddCardPageController sut;

  setUp(() {
    delegate = MockAddCardPageControllerDelegate();
    service = MockAddCardService();
    sut = AddCardPageController(delegate);
  });

  group('AddCardPageController', () {
    setUp(() {
      sut.didUpdateService(service);
    });

    group('`tokenize`', () {
      test('when call `tokenize` then should call `service`', () async {
        final json = resource('card_token_test.json');
        final token = CardToken.fromJson(json);
        when(service.tokenize(any)).thenAnswer((e) async => token);

        await sut.tokenize(true);
        verify(service.tokenize(true));
      });

      test('when service `tokenize` is successful then should call `delegate` with token', () async {
        final json = resource('card_token_test.json');
        final token = CardToken.fromJson(json);
        when(service.tokenize(any)).thenAnswer((e) async => token);

        await sut.tokenize(true);
        verify(delegate.didComplete(token));
      });
    });
  });
}
