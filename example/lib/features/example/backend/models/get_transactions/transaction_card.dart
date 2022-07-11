import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/models/get_transactions/transaction_card_installment_proposal.dart';

part 'transaction_card.g.dart';

@JsonSerializable()
class TransactionCard {
  final TransactionCardInstallmentProposal? cardInstallmentProposal;

  const TransactionCard(this.cardInstallmentProposal);

  factory TransactionCard.fromJson(Map<String, dynamic> json) => _$TransactionCardFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCardToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
