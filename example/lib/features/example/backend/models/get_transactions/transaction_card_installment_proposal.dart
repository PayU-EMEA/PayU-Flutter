import 'package:json_annotation/json_annotation.dart';

part 'transaction_card_installment_proposal.g.dart';

@JsonSerializable()
class TransactionCardInstallmentProposal {
  final String proposalId;

  const TransactionCardInstallmentProposal(this.proposalId);

  factory TransactionCardInstallmentProposal.fromJson(Map<String, dynamic> json) =>
      _$TransactionCardInstallmentProposalFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCardInstallmentProposalToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
