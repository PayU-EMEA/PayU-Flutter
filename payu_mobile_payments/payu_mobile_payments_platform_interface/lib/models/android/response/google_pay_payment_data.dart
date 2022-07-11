import 'google_pay_payment_method_data.dart';

class GooglePayPaymentData {
  final int apiVersion;
  final int apiVersionMinor;
  final GooglePayPaymentMethodData paymentMethodData;

  const GooglePayPaymentData({
    required this.apiVersion,
    required this.apiVersionMinor,
    required this.paymentMethodData,
  });

  factory GooglePayPaymentData.fromJson(Map<String, dynamic> json) {
    return GooglePayPaymentData(
      apiVersion: json['apiVersion'],
      apiVersionMinor: json['apiVersionMinor'],
      paymentMethodData: GooglePayPaymentMethodData.fromJson(json["paymentMethodData"]),
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
