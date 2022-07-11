import 'package:json_annotation/json_annotation.dart';
import 'package:payu/payu.dart';

part 'payment_methods_response.g.dart';

@JsonSerializable()
class PaymentMethodsResponse {
  final List<BlikToken>? blikTokens;
  final List<CardToken> cardTokens;
  final List<PayByLink> payByLinks;

  const PaymentMethodsResponse({
    required this.blikTokens,
    required this.cardTokens,
    required this.payByLinks,
  });

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) => _$PaymentMethodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodsResponseToJson(this);
}
