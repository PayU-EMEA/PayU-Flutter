import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_storage.dart';
import '../payment_methods/payment_methods_listener.dart';
import 'payment_widget_controller.dart';
import 'payment_widget_service.dart';

class PaymentWidgetAssembler extends PayuAssembler {
  final PaymentMethodsConfiguration configuration;
  final PaymentWidgetService service;
  final PaymentMethodsStorage storage;
  final PaymentMethodsListener listener;

  PaymentWidgetAssembler(this.configuration, this.service, this.storage, this.listener);

  @override
  void assemble() {
    register(() => PaymentWidgetController(configuration, service, storage, listener));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PaymentWidgetController>();
    super.dispose();
  }
}
