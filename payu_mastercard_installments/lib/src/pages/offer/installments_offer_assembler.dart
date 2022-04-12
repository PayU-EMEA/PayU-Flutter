import 'package:payu_state_management/payu_state_management.dart';

import '../../models/installment_proposal.dart';
import 'installments_offer_controller.dart';

class InstallmentsOfferAssembler extends PayuAssembler {
  final InstallmentProposal proposal;

  InstallmentsOfferAssembler(this.proposal);

  @override
  void assemble() {
    register(() => InstallmentsOfferController(proposal));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<InstallmentsOfferController>();
    super.dispose();
  }
}
