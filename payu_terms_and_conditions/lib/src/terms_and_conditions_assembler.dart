import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'terms_and_conditions_controller.dart';

class TermsAndConditionsAssembler extends PayuAssembler {
  @override
  void assemble() {
    register(() => PayuLauncher());
    register(() => TermsAndConditionsController(find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PayuLauncher>();
    unregister<TermsAndConditionsController>();
    super.dispose();
  }
}
