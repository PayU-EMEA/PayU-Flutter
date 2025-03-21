import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_payment_methods/src/features/pbl_payment_methods/pbl_payment_methods_controller.dart';
import 'package:payu_payment_methods/src/payment_methods_configuration.dart';
import '../../../resources/resource_reader.dart';

void main() {
  late PaymentMethodsConfiguration configuration;
  late PBLPaymentMethodsController sut;

  setUp(() {
    final blikTokens = mockList('test_blik_tokens.json').map((e) => BlikToken.fromJson(e)).toList();
    final cardTokens = mockList('test_card_tokens.json').map((e) => CardToken.fromJson(e)).toList();
    final payByLinks = mockList('test_pay_by_links.json').map((e) => PayByLink.fromJson(e)).toList();

    configuration = PaymentMethodsConfiguration(blikTokens: blikTokens, cardTokens: cardTokens, payByLinks: payByLinks);
    sut = PBLPaymentMethodsController(configuration);
  });

  group('PBLPaymentMethodsController', () {
    group('`onInit`', () {
      test('when controller is initialized then `items` are configured properly', () {
        sut.onInit();
        expect(sut.items.length, equals(1));
      });

      test('when `configuration` contains `jp` then `items` should not contain it', () {
        sut.onInit();
        final filtered = sut.items.where((e) => e.value.value == PaymentMethodValue.applePay);
        expect(filtered.isEmpty, equals(true));
      });
    });
  });
}
