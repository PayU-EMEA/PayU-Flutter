import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/models/get_transactions/transaction.dart';

part 'transactions_response.g.dart';

@JsonSerializable()
class TransactionsResponse {
  final List<Transaction> transactions;

  const TransactionsResponse(this.transactions);

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) => _$TransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
