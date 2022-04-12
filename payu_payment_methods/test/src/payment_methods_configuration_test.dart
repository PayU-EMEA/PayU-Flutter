import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_payment_methods/payu_payment_methods.dart';
import '../resources/resource_reader.dart';

void main() {
  late List<BlikToken> blikTokens;
  late List<CardToken> cardTokens;
  late List<PayByLink> payByLinks;

  group('PaymentMethodsConfiguration', () {
    setUp(() {
      blikTokens = mockList('test_blik_tokens.json').map((e) => BlikToken.fromJson(e)).toList();
      cardTokens = mockList('test_card_tokens.json').map((e) => CardToken.fromJson(e)).toList();
      payByLinks = mockList('test_pay_by_links.json').map((e) => PayByLink.fromJson(e)).toList();
    });

    test('when created then `enableAddCard` is `true` by default', () {
      final sut = PaymentMethodsConfiguration(blikTokens: [], cardTokens: [], payByLinks: []);
      expect(sut.enableAddCard, equals(true));
    });

    test('when created then `enablePayByLinks` is `true` by default', () {
      final sut = PaymentMethodsConfiguration(blikTokens: [], cardTokens: [], payByLinks: []);
      expect(sut.enablePayByLinks, equals(true));
    });

    group('when created with `showExpiredCards == true`', () {
      late PaymentMethodsConfiguration sut;

      setUp(() {
        sut = PaymentMethodsConfiguration(
          blikTokens: blikTokens,
          cardTokens: cardTokens,
          payByLinks: payByLinks,
          showExpiredCards: true,
        );
      });

      test('then should not filter `blikTokens`', () {
        expect(sut.blikTokens!.length, equals(blikTokens.length));
      });

      test('then should not filter `cardTokens`', () {
        expect(sut.cardTokens.length, cardTokens.length);
      });

      test('then should filter `payByLinks`', () {
        expect(sut.payByLinks.length, payByLinks.where((e) => e.enabled).length);
      });
    });

    group('when created with `showDisabledPayByLinks == true`', () {
      late PaymentMethodsConfiguration sut;

      setUp(() {
        sut = PaymentMethodsConfiguration(
          blikTokens: blikTokens,
          cardTokens: cardTokens,
          payByLinks: payByLinks,
          showDisabledPayByLinks: true,
        );
      });

      test('then should not filter `blikTokens`', () {
        expect(sut.blikTokens!.length, equals(blikTokens.length));
      });

      test('then should filter `cardTokens`', () {
        expect(sut.cardTokens.length, cardTokens.where((e) => e.enabled).length);
      });

      test('then should not filter `payByLinks`', () {
        expect(sut.payByLinks.length, payByLinks.length);
      });
    });
  });
}
