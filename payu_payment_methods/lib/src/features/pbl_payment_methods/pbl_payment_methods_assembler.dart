import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import 'pbl_payment_methods_controller.dart';

class PBLPaymentMethodsAssembler extends PayuAssembler {
  final PaymentMethodsConfiguration configuration;

  PBLPaymentMethodsAssembler(this.configuration);

  @override
  void assemble() {
    register(() => PBLPaymentMethodsController(configuration));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PBLPaymentMethodsController>();
    super.dispose();
  }
}
