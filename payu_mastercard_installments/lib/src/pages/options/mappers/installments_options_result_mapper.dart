import '../../../../payu_mastercard_installments.dart';

class InstallmentsOptionsResultMapper {
  InstallmentResult map(InstallmentProposal proposal, InstallmentOption option) {
    switch (proposal.installmentOptionFormat) {
      case InstallmentOptionFormat.varyingNumberOfInstallments:
        return InstallmentResult(numberOfInstallments: option.numberOfInstallments);
      case InstallmentOptionFormat.varyingNumberOfOptions:
        return InstallmentResult(optionId: option.id);
    }
  }
}
