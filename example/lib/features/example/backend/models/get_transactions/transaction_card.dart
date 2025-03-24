import 'package:json_annotation/json_annotation.dart';

part 'transaction_card.g.dart';

@JsonSerializable()
class TransactionCard {
  const TransactionCard();

  factory TransactionCard.fromJson(Map<String, dynamic> json) =>
      _$TransactionCardFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCardToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
