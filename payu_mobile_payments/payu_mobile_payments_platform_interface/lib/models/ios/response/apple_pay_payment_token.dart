class ApplePayPaymentToken {
  final String paymentData;

  const ApplePayPaymentToken({
    required this.paymentData,
  });

  factory ApplePayPaymentToken.fromJson(Map<String, dynamic> json) {
    return ApplePayPaymentToken(
      paymentData: json['paymentData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentData': paymentData,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
