import 'package:intl/intl.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../../models/installment_proposal.dart';
import 'installments_options_controller.dart';
import 'mappers/installments_options_data_mapper.dart';
import 'mappers/installments_options_result_mapper.dart';

class InstallmentsOptionsAssembler extends PayuAssembler {
  final InstallmentProposal proposal;

  InstallmentsOptionsAssembler(this.proposal);

  @override
  void assemble() {
    register(() => NumberFormat.decimalPercentPattern(decimalDigits: 1), name: 'percentage');
    register(() => NumberFormat.simpleCurrency(name: 'PLN'), name: 'price');
    register(() => InstallmentsOptionsDataMapper(find(name: 'percentage'), find(name: 'price')));
    register(() => InstallmentsOptionsResultMapper());
    register(() => InstallmentsOptionsController(proposal, find(), find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<NumberFormat>(name: 'percentage');
    unregister<NumberFormat>(name: 'price');
    unregister<InstallmentsOptionsDataMapper>();
    unregister<InstallmentsOptionsResultMapper>();
    unregister<InstallmentsOptionsController>();
    super.dispose();
  }
}
