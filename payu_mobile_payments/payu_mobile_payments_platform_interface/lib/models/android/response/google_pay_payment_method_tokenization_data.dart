class GooglePayPaymentMethodTokenizationData {
  final String type;
  final String? token;

  const GooglePayPaymentMethodTokenizationData({
    required this.type,
    required this.token,
  });

  factory GooglePayPaymentMethodTokenizationData.fromJson(Map<String, dynamic> json) {
    return GooglePayPaymentMethodTokenizationData(
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
