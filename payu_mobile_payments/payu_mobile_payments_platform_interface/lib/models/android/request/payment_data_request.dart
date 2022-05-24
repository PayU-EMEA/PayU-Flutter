import '../constants/google_pay_constants.dart';
import 'merchant_info.dart';
import 'payment_method.dart';
import 'transaction_info.dart';

class PaymentDataRequest {
  final int apiVersion;
  final int apiVersionMinor;
  final MerchantInfo? merchantInfo;
  final List<PaymentMethod> allowedPaymentMethods;
  final TransactionInfo transactionInfo;

  const PaymentDataRequest({
    this.apiVersion = GooglePayConstants.defaultApiVersion,
    this.apiVersionMinor = GooglePayConstants.defaultApiVersionMinor,
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
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
