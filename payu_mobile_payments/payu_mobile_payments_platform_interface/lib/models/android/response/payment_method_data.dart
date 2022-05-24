import 'payment_method_tokenization_data.dart';

class PaymentMethodData {
  final String type;
  final String description;
  final PaymentMethodTokenizationData tokenizationData;

  const PaymentMethodData({
    required this.type,
    required this.description,
    required this.tokenizationData,
  });

  factory PaymentMethodData.fromJson(Map<String, dynamic> json) {
    return PaymentMethodData(
      type: json['type'],
      description: json['description'],
      tokenizationData: PaymentMethodTokenizationData.fromJson(json["tokenizationData"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'description': description,
      'tokenizationData': tokenizationData.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
