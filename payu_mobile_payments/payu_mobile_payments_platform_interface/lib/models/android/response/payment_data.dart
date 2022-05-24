import 'payment_method_data.dart';

class PaymentData {
  final int apiVersion;
  final int apiVersionMinor;
  final PaymentMethodData paymentMethodData;

  const PaymentData({
    required this.apiVersion,
    required this.apiVersionMinor,
    required this.paymentMethodData,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      apiVersion: json['apiVersion'],
      apiVersionMinor: json['apiVersionMinor'],
      paymentMethodData: PaymentMethodData.fromJson(json["paymentMethodData"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiVersion': apiVersion,
      'apiVersionMinor': apiVersionMinor,
      'paymentMethodData': paymentMethodData.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
