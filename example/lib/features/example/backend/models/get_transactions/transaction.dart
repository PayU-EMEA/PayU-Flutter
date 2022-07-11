import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/models/get_transactions/transaction_card.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final TransactionCard? card;

  const Transaction(this.card);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
