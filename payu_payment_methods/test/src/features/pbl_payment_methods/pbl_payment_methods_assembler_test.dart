import 'package:flutter_test/flutter_test.dart';
import 'package:payu_core/payu_core.dart';

import 'package:payu_payment_methods/payu_payment_methods.dart';
import 'package:payu_payment_methods/src/features/pbl_payment_methods/pbl_payment_methods_assembler.dart';
import 'package:payu_payment_methods/src/features/pbl_payment_methods/pbl_payment_methods_controller.dart';
import '../../../resources/resource_reader.dart';

void main() {
  late PaymentMethodsConfiguration configuration;
  late PBLPaymentMethodsAssembler sut;

  setUp(() {
    final blikTokens = mockList('test_blik_tokens.json').map((e) => BlikToken.fromJson(e)).toList();
    final cardTokens = mockList('test_card_tokens.json').map((e) => CardToken.fromJson(e)).toList();
    final payByLinks = mockList('test_pay_by_links.json').map((e) => PayByLink.fromJson(e)).toList();

    configuration = PaymentMethodsConfiguration(blikTokens: blikTokens, cardTokens: cardTokens, payByLinks: payByLinks);
    sut = PBLPaymentMethodsAssembler(configuration);
  });

  group('PBLPaymentMethodsAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<PBLPaymentMethodsController>(), isA<PBLPaymentMethodsController>());
      });
    });
  });
}
