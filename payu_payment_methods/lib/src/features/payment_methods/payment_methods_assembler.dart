import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_platform_provider.dart';
import '../core/payment_methods_storage.dart';
import 'payment_methods_controller.dart';
import 'payment_methods_listener.dart';

class PaymentMethodsAssembler extends PayuAssembler {
  final PaymentMethodsControllerDelegate delegate;
  final PaymentMethodsConfiguration configuration;
  final PaymentMethodsListener listener;
  final PaymentMethodsStorage storage;

  PaymentMethodsAssembler(this.delegate, this.configuration, this.listener, this.storage);

  @override
  void assemble() {
    register(() => PaymentMethodPlatformProvider());
    register(() => PaymentMethodsController(delegate, configuration, find(), listener, storage));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PaymentMethodPlatformProvider>();
    unregister<PaymentMethodsController>();
    super.dispose();
  }
}
