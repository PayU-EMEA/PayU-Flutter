import 'package:payu_mobile_payments_platform_interface/models/ios/request/apple_pay_payment_request.dart';
import 'android/request/google_pay_payment_data_request.dart';
import 'payment_environment.dart';
import 'payment_provider.dart';

class PaymentConfiguration {
  final PaymentProvider provider;
  final PaymentEnvironment? environment;
  final Map<String, dynamic> data;

  const PaymentConfiguration._({
    required this.provider,
    required this.environment,
    required this.data,
  });

  factory PaymentConfiguration.applePay({
    required ApplePayPaymentRequest request,
  }) {
    return PaymentConfiguration._(
      provider: PaymentProvider.applePay,
      environment: null,
      data: request.toJson(),
    );
  }

  factory PaymentConfiguration.googlePay({
    required PaymentEnvironment environment,
    required GooglePayPaymentDataRequest request,
  }) {
    return PaymentConfiguration._(
      provider: PaymentProvider.googlePay,
      environment: environment,
      data: request.toJson(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider': provider.value,
      'environment': environment?.value,
      'data': data,
    }..removeWhere((key, value) => value == null);
  }
}
