import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/ui/snackbar.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';

class ExampleCheckoutInstallmentsController extends GetxController {
  final BackendRepository _repository;

  ExampleCheckoutInstallmentsController(this._repository);

  Future<void> process(String orderId) async {
    final proposalId = await _getProposalId(orderId);
    final proposal = await _getInstallmentProposal(proposalId);
    final result = await _getInstallmentOption(proposal);
    if (result == null) return;

    snackbar(result.toString());
    await _postDecision(proposalId, result);
  }

  Future<String> _getProposalId(String orderId) async {
    final response = await _repository.getTransactions(orderId);
    final transaction = response.transactions.firstOrNull;
    final proposalId = transaction?.card?.cardInstallmentProposal?.proposalId;
    if (proposalId == null) throw Exception('Payment cannot be split into installments');
    return proposalId;
  }

  Future<InstallmentProposal> _getInstallmentProposal(String proposalId) async {
    return _repository.getCardInstallmentProposals(proposalId);
  }

  Future<InstallmentResult?> _getInstallmentOption(InstallmentProposal proposal) async {
    return await Get.to<InstallmentResult>(() => InstallmentsOfferPage(proposal: proposal));
  }

  Future<void> _postDecision(String proposalId, InstallmentResult result) async {
    try {
      await _repository.postCardInstallmentProposals(proposalId, result);
      snackbar('✅ Request for payment in installments has been forwarded to card issuing bank. '
          'In case of further questions payer should directly contact card issuing bank in next working day.');
    } catch (e) {
      snackbar('⛔️ Request for payment in installments has not been forwarded to card issuing'
          ' bank but payment is successful and card will be charged with full order amount.');
    }
  }
}
