import 'package:payu_state_management/payu_state_management.dart';

import 'add_card_page_controller.dart';

class AddCardPageAssembler extends PayuAssembler {
  final AddCardPageControllerDelegate delegate;

  AddCardPageAssembler(this.delegate);

  @override
  void assemble() {
    register(() => AddCardPageController(delegate));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<AddCardPageController>();
    super.dispose();
  }
}
