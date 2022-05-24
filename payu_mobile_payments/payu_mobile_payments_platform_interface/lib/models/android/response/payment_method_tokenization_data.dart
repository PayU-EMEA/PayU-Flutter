class PaymentMethodTokenizationData {
  final String type;
  final String? token;

  const PaymentMethodTokenizationData({
    required this.type,
    required this.token,
  });

  factory PaymentMethodTokenizationData.fromJson(Map<String, dynamic> json) {
    return PaymentMethodTokenizationData(
      type: json['type'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'token': token,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
