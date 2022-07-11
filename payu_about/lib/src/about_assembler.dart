import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'about_controller.dart';

class AboutAssembler extends PayuAssembler {
  @override
  void assemble() {
    register(() => PayuLauncher());
    register(() => AboutController(find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<PayuLauncher>();
    unregister<AboutController>();
    super.dispose();
  }
}
