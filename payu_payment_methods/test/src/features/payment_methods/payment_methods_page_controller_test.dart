import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:payu_core/payu_core.dart';
import 'package:payu_payment_methods/payu_payment_methods.dart';
import 'package:payu_payment_methods/src/features/core/payment_methods_item.dart';
import 'package:payu_payment_methods/src/features/core/payment_methods_platform_provider.dart';
import 'package:payu_payment_methods/src/features/payment_methods/payment_methods_controller.dart';

import '../../../resources/resource_reader.dart';
import 'payment_methods_page_controller_test.mocks.dart';

@GenerateMocks([
  PaymentMethodsConfiguration,
  PaymentMethodsControllerDelegate,
  PaymentMethodPlatformProvider,
  PaymentMethodsListener,
  PaymentMethodsStorage,
  PaymentMethodsItem,
])
void main() {
  late List<BlikToken> blikTokens;
  late List<CardToken> cardTokens;
  late List<PayByLink> payByLinks;

  late MockPaymentMethodsItem item;

  late MockPaymentMethodsConfiguration configuration;
  late MockPaymentMethodsControllerDelegate delegate;
  late MockPaymentMethodPlatformProvider provider;
  late MockPaymentMethodsListener listener;
  late MockPaymentMethodsStorage storage;
  late PaymentMethodsController sut;

  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());

  setUp(() {
    blikTokens = mockList('test_blik_tokens.json').map((e) => BlikToken.fromJson(e)).toList();
    cardTokens = mockList('test_card_tokens.json').map((e) => CardToken.fromJson(e)).toList();
    payByLinks = mockList('test_pay_by_links.json').map((e) => PayByLink.fromJson(e)).toList();

    item = MockPaymentMethodsItem();

    configuration = MockPaymentMethodsConfiguration();
    delegate = MockPaymentMethodsControllerDelegate();
    provider = MockPaymentMethodPlatformProvider();
    listener = MockPaymentMethodsListener();
    storage = MockPaymentMethodsStorage();
    sut = PaymentMethodsController(delegate, configuration, provider, listener, storage);

    when(storage.getSelectedPaymentMethodHash()).thenAnswer((e) async => null);
  });

  group('PaymentMethodsController', () {
    setUp(() {
      when(configuration.blikTokens).thenReturn(blikTokens);
      when(configuration.cardTokens).thenReturn(cardTokens);
      when(configuration.payByLinks).thenReturn(payByLinks);
      when(configuration.enableAddCard).thenReturn(true);
      when(configuration.enablePayByLinks).thenReturn(true);

      when(provider.isiOS()).thenReturn(true);
      when(provider.isAndroid()).thenReturn(false);
    });

    group('`onInit`', () {
      setUp(() {});
    });

    group('`canDismissPaymentMethod`', () {
      test('when `item` hash is `jp` then should return false', () {
        when(item.hash).thenReturn('jp');
        expect(sut.canDismissPaymentMethod(item), equals(false));
      });

      test('when `item` hash is `blik_code` then should return false', () {
        when(item.hash).thenReturn('blik_code');
        expect(sut.canDismissPaymentMethod(item), equals(false));
      });

      test('when `item` hash is `ap` then should return false', () {
        when(item.hash).thenReturn('ap');
        expect(sut.canDismissPaymentMethod(item), equals(false));
      });

      test('when `item` hash is `ai` then should return false', () {
        when(item.hash).thenReturn('ai');
        expect(sut.canDismissPaymentMethod(item), equals(false));
      });

      test('when `item` hash is `null` then should return false', () {
        when(item.hash).thenReturn(null);
        expect(sut.canDismissPaymentMethod(item), equals(false));
      });

      test('when `item` hash is `other` then should return true', () {
        when(item.hash).thenReturn('other');
        expect(sut.canDismissPaymentMethod(item), equals(true));
      });
    });

    group('`dismissPaymentMethod`', () {
      setUp(() {});

      test('when dismiss item and item can be dismissed then should dissapear from the visible items', () async {
        final blik = blikTokens.first;
        final hash = blik.hash;

        when(item.hash).thenReturn(hash);
        when(item.paymentMethod).thenReturn(blik);
        when(listener.didDeletePaymentMethod(blik)).thenAnswer((e) async => {});
        await sut.onInit();

        expect(sut.items.where((e) => e.hash == hash).isEmpty, equals(false));
        sut.dismissPaymentMethod(item);
        expect(sut.items.where((e) => e.hash == hash).isEmpty, equals(true));
      });

      test('when dismiss item and item can be dismissed then should inform `listener`', () async {
        final blik = blikTokens.first;
        final hash = blik.hash;

        when(item.hash).thenReturn(hash);
        when(item.paymentMethod).thenReturn(blik);
        when(listener.didDeletePaymentMethod(blik)).thenAnswer((e) async => {});
        await sut.onInit();

        sut.dismissPaymentMethod(item);
        verify(listener.didDeletePaymentMethod(blik));
      });

      test('when dismiss item and item cannot be dismissed then should not dissapear from the visible items', () async {
        const hash = 'ai';
        when(item.hash).thenReturn(hash);
        await sut.onInit();

        expect(sut.items.where((e) => e.hash == hash).isNotEmpty, equals(true));
        sut.dismissPaymentMethod(item);
        expect(sut.items.where((e) => e.hash == hash).isNotEmpty, equals(true));
      });

      test('when dismiss item and item hash is `null` then should not dissapear from the visible items', () async {
        const hash = null;
        when(item.hash).thenReturn(hash);
        await sut.onInit();

        expect(sut.items.where((e) => e.hash == hash).isNotEmpty, equals(true));
        sut.dismissPaymentMethod(item);
        expect(sut.items.where((e) => e.hash == hash).isNotEmpty, equals(true));
      });
    });

    test('when `payByLinks` contains `jp` and Platform is iOS then should display ApplePay', () async {
      when(configuration.payByLinks).thenReturn(payByLinks);
      when(provider.isiOS()).thenReturn(true);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsApplePayItem>().length, equals(1));
      verify(provider.isiOS()).called(1);
    });

    test('when `payByLinks` contains `jp` and Platform is not iOS then should not display ApplePay', () async {
      when(configuration.payByLinks).thenReturn(payByLinks);
      when(provider.isiOS()).thenReturn(false);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsApplePayItem>().length, equals(0));
      verify(provider.isiOS()).called(1);
    });

    test('when `payByLinks` contains `ap` and Platform is Android then should display GooglePay', () async {
      when(configuration.payByLinks).thenReturn(payByLinks);
      when(provider.isAndroid()).thenReturn(true);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsGooglePayItem>().length, equals(1));
      verify(provider.isAndroid()).called(1);
    });

    test('when `payByLinks` contains `ap` and Platform is not Android then should not display GooglePay', () async {
      when(configuration.payByLinks).thenReturn(payByLinks);
      when(provider.isAndroid()).thenReturn(false);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsGooglePayItem>().length, equals(0));
      verify(provider.isAndroid()).called(1);
    });

    test('when `blikTokens` are not available then should not display BlikCode', () async {
      when(configuration.blikTokens).thenReturn(null);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikCodeItem>().length, equals(0));
    });

    test('when `blikTokens` are not available then should not display BlikToken', () async {
      when(configuration.blikTokens).thenReturn(null);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikTokenItem>().length, equals(0));
    });

    test('when `blikTokens` are empty then should display BlikCode', () async {
      when(configuration.blikTokens).thenReturn([]);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikCodeItem>().length, equals(1));
    });

    test('when `blikTokens` are empty then should not display BlikToken', () async {
      when(configuration.blikTokens).thenReturn([]);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikTokenItem>().length, equals(0));
    });

    test('when `blikTokens` are not empty then should not display BlikCode', () async {
      when(configuration.blikTokens).thenReturn(blikTokens);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikCodeItem>().length, equals(0));
    });

    test('when `blikTokens` are not empty then should display BlikToken', () async {
      when(configuration.blikTokens).thenReturn(blikTokens);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBlikTokenItem>().length, equals(1));
    });

    test('when `storage` has saved `hash` for payByLink then should display PayByLink', () async {
      final pbl = payByLinks[3];
      when(storage.getSelectedPaymentMethodHash()).thenAnswer((e) async => pbl.hash);
      await sut.onInit();

      expect(configuration.payByLinks.where((e) => e.hash == pbl.hash).length, equals(1));
      expect(sut.items.whereType<PaymentMethodsPayByLinkItem>().length, equals(1));
    });

    test('when `storage` has saved `hash` then should display it first', () async {
      final pbl = payByLinks[2];
      when(storage.getSelectedPaymentMethodHash()).thenAnswer((e) async => pbl.hash);
      await sut.onInit();

      expect(sut.items.first.hash, equals(pbl.hash));
    });

    test('when `storage` has not saved `hash` for payByLink then should not display PayByLink', () async {
      when(storage.getSelectedPaymentMethodHash()).thenAnswer((e) async => null);
      await sut.onInit();

      expect(configuration.payByLinks.isNotEmpty, equals(true));
      expect(sut.items.whereType<PaymentMethodsPayByLinkItem>().length, equals(0));
    });

    test('when `enableAddCard` is `true` then should display Card', () async {
      when(configuration.enableAddCard).thenReturn(true);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsCardItem>().length, equals(1));
    });

    test('when `enableAddCard` is `false` then should not display Card', () async {
      when(configuration.enableAddCard).thenReturn(false);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsCardItem>().length, equals(0));
    });

    test('when `enablePayByLinks` is `true` then should display BankTransfer', () async {
      when(configuration.enablePayByLinks).thenReturn(true);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBankTransferItem>().length, equals(1));
    });

    test('when `enablePayByLinks` is `false` then should not display BankTransfer', () async {
      when(configuration.enablePayByLinks).thenReturn(false);
      await sut.onInit();

      expect(sut.items.whereType<PaymentMethodsBankTransferItem>().length, equals(0));
    });
  });
}
