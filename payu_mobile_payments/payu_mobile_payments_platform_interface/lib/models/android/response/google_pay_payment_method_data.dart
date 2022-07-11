import 'google_pay_payment_method_tokenization_data.dart';

class GooglePayPaymentMethodData {
  final String type;
  final String description;
  final GooglePayPaymentMethodTokenizationData tokenizationData;

  const GooglePayPaymentMethodData({
    required this.type,
    required this.description,
    required this.tokenizationData,
  });

  factory GooglePayPaymentMethodData.fromJson(Map<String, dynamic> json) {
    return GooglePayPaymentMethodData(
      type: json['type'],
      description: json['description'],
      tokenizationData: GooglePayPaymentMethodTokenizationData.fromJson(json["tokenizationData"]),
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
