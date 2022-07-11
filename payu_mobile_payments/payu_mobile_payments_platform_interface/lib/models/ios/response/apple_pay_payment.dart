import 'apple_pay_payment_token.dart';

class ApplePayPayment {
  final ApplePayPaymentToken token;

  const ApplePayPayment({
    required this.token,
  });

  factory ApplePayPayment.fromJson(Map<String, dynamic> json) {
    return ApplePayPayment(
      token: ApplePayPaymentToken.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token.toJson(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
