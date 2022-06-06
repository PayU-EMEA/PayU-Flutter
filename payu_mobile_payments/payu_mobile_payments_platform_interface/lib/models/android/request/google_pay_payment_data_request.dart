import 'google_pay_merchant_info.dart';
import 'google_pay_payment_method.dart';
import 'google_pay_transaction_info.dart';

class GooglePayPaymentDataRequest {
  static const defaultApiVersion = 2;
  static const defaultApiVersionMinor = 0;

  final int apiVersion;
  final int apiVersionMinor;
  final GooglePayMerchantInfo? merchantInfo;
  final List<GooglePayPaymentMethod> allowedPaymentMethods;
  final GooglePayTransactionInfo transactionInfo;

  const GooglePayPaymentDataRequest({
    required this.apiVersion,
    required this.apiVersionMinor,
    this.merchantInfo,
    required this.allowedPaymentMethods,
    required this.transactionInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'apiVersion': apiVersion,
      'apiVersionMinor': apiVersionMinor,
      'merchantInfo': merchantInfo?.toJson(),
      'allowedPaymentMethods': allowedPaymentMethods.map((e) => e.toJson()).toList(),
      'transactionInfo': transactionInfo.toJson(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
