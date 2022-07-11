import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:payu_payment_methods/src/features/core/payment_methods_storage.dart';
import 'package:payu_payment_methods/src/features/payment_methods/payment_methods_assembler.dart';
import 'package:payu_payment_methods/src/features/payment_methods/payment_methods_controller.dart';
import 'package:payu_payment_methods/src/features/payment_methods/payment_methods_listener.dart';
import 'package:payu_payment_methods/src/payment_methods_configuration.dart';

import 'payment_methods_assembler_test.mocks.dart';

@GenerateMocks([
  PaymentMethodsControllerDelegate,
  PaymentMethodsConfiguration,
  PaymentMethodsListener,
  PaymentMethodsStorage,
])
void main() {
  late MockPaymentMethodsControllerDelegate delegate;
  late MockPaymentMethodsConfiguration configuration;
  late MockPaymentMethodsListener listener;
  late MockPaymentMethodsStorage storage;
  late PaymentMethodsAssembler sut;

  setUp(() {
    delegate = MockPaymentMethodsControllerDelegate();
    configuration = MockPaymentMethodsConfiguration();
    listener = MockPaymentMethodsListener();
    storage = MockPaymentMethodsStorage();
    sut = PaymentMethodsAssembler(delegate, configuration, listener, storage);
  });

  group('PaymentMethodsAssembler', () {
    group('`assemble`', () {
      test('when called then expected dependencies are registered', () {
        sut.assemble();
        expect(sut.find<PaymentMethodsController>(), isA<PaymentMethodsController>());
      });
    });
  });
}
