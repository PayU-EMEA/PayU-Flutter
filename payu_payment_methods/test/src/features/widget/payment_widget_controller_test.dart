import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_payment_methods/src/features/core/payment_methods_storage.dart';
import 'package:payu_payment_methods/src/features/payment_methods/payment_methods_listener.dart';
import 'package:payu_payment_methods/src/features/widget/payment_widget_controller.dart';
import 'package:payu_payment_methods/src/features/widget/payment_widget_service.dart';
import 'package:payu_payment_methods/src/features/widget/payment_widget_state.dart';
import 'package:payu_payment_methods/src/payment_methods_configuration.dart';
import '../../../resources/resource_reader.dart';
import 'payment_widget_controller_test.mocks.dart';

@GenerateMocks([
  PaymentMethodsConfiguration,
  PaymentWidgetService,
  PaymentMethodsStorage,
  PaymentMethodsListener,
])
void main() {
  group('`PaymentWidgetController`', () {
    late MockPaymentMethodsConfiguration configuration;
    late MockPaymentWidgetService service;
    late MockPaymentMethodsStorage storage;
    late MockPaymentMethodsListener listener;
    late PaymentWidgetController sut;

    setUp(() {
      configuration = MockPaymentMethodsConfiguration();
      service = MockPaymentWidgetService();
      storage = MockPaymentMethodsStorage();
      listener = MockPaymentMethodsListener();

      sut = PaymentWidgetController(configuration, service, storage, listener)..onInit();

      final blikTokens = mockList('test_blik_tokens.json').map((e) => BlikToken.fromJson(e)).toList();
      final cardTokens = mockList('test_card_tokens.json').map((e) => CardToken.fromJson(e)).toList();
      final payByLinks = mockList('test_pay_by_links.json').map((e) => PayByLink.fromJson(e)).toList();

      when(configuration.blikTokens).thenReturn(blikTokens);
      when(configuration.cardTokens).thenReturn(cardTokens);
      when(configuration.payByLinks).thenReturn(payByLinks);
    });

    group('`onInit`', () {
      test('when called then `maxLength` equals to 6', () {
        expect(PaymentWidgetController.maxLength, equals(6));
      });

      test('when called then `textEditingController.text` is empty', () {
        expect(sut.textEditingController.text, equals(''));
      });

      test('when called then `state` equals `PaymentWidgetState.initial`', () {
        expect(sut.state, equals(PaymentWidgetState.initial));
      });

      test('when called then `selected` equals `null`', () {
        expect(sut.selected, equals(null));
      });
    });

    group('`didSelect`', () {
      test('when called then `selected` should be saved', () {
        sut.didSelect(configuration.cardTokens.first);
        expect(sut.selected, equals(configuration.cardTokens.first));

        sut.didSelect(configuration.payByLinks.first);
        expect(sut.selected, equals(configuration.payByLinks.first));
      });

      test('when selected `BlikCode` then should update state to `PaymentWidgetState.blikCode`', () {
        sut.didSelect(const BlikCode());
        expect(sut.state, equals(PaymentWidgetState.blikCode));
      });

      test('when selected `BlikToken` then should update state to `PaymentWidgetState.blikToken`', () {
        sut.didSelect(configuration.blikTokens!.first);
        expect(sut.state, equals(PaymentWidgetState.blikToken));
      });

      test('when selected other then should update state to `PaymentWidgetState.initial`', () {
        sut.didSelect(configuration.cardTokens.first);
        expect(sut.state, equals(PaymentWidgetState.initial));
      });
    });

    group('`didTapEnterNewBlikCode`', () {
      test('when called then should update state to `PaymentWidgetState.blikCode`', () {
        sut.didTapEnterNewBlikCode();
        expect(sut.state, equals(PaymentWidgetState.blikCode));
      });
    });

    group('`blikAuthorizationCode`', () {
      test('when `textEditingController.text.length` is not expected then should return `null`', () {
        sut.textEditingController.text = '123';
        expect(sut.blikAuthorizationCode(), equals(null));
      });

      test('when `textEditingController.text.length` is expected then should return its value', () {
        const code = '123456';
        sut.textEditingController.text = code;
        expect(sut.blikAuthorizationCode(), equals(code));
      });
    });

    group('`isBlikAuthorizationCodeRequired`', () {
      test('when `selected` is `BlikCode` then should return `true`', () {
        sut.didSelect(const BlikCode());
        expect(sut.isBlikAuthorizationCodeRequired(), equals(true));
      });

      test('when `selected` is not `BlikCode` then should return `false`', () {
        sut.didSelect(configuration.blikTokens!.first);
        expect(sut.isBlikAuthorizationCodeRequired(), equals(false));

        sut.didSelect(configuration.cardTokens.first);
        expect(sut.isBlikAuthorizationCodeRequired(), equals(false));

        sut.didSelect(configuration.payByLinks.first);
        expect(sut.isBlikAuthorizationCodeRequired(), equals(false));
      });
    });
  });
}
