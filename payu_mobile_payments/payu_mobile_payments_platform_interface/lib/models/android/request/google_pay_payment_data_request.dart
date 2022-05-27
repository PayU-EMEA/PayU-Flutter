import 'google_pay_card_parameters.dart';
import 'google_pay_merchant_info.dart';
import 'google_pay_offer_info.dart';
import 'google_pay_payment_method.dart';
import 'google_pay_payment_method_tokenization_specification.dart';
import 'google_pay_payment_method_tokenization_specification_parameters.dart';
import 'google_pay_shipping_address_parameters.dart';
import 'google_pay_shipping_option_parameters.dart';
import 'google_pay_transaction_info.dart';

class GooglePayPaymentDataRequest {
  static const defaultApiVersion = 2;
  static const defaultApiVersionMinor = 0;

  static const callbackIntentsOffer = 'OFFER';
  static const callbackIntentsOaymentAuthorization = 'PAYMENT_AUTHORIZATION';
  static const callbackIntentsShippingAddress = 'SHIPPING_ADDRESS';
  static const callbackIntentsShippingOption = 'SHIPPING_OPTION';

  final int apiVersion;
  final int apiVersionMinor;
  final GooglePayMerchantInfo? merchantInfo;
  final List<GooglePayPaymentMethod> allowedPaymentMethods;
  final GooglePayTransactionInfo transactionInfo;
  final List<String>? callbackIntents;
  final GooglePayOfferInfo? offerInfo;
  final bool? emailRequired;
  final bool? shippingAddressRequired;
  final GooglePayShippingAddressParameters? shippingAddressParameters;
  final bool? shippingOptionRequired;
  final List<GooglePayShippingOptionParameters>? shippingOptionParameters;

  const GooglePayPaymentDataRequest({
    required this.apiVersion,
    required this.apiVersionMinor,
    this.merchantInfo,
    required this.allowedPaymentMethods,
    required this.transactionInfo,
    this.callbackIntents,
    this.offerInfo,
    this.emailRequired,
    this.shippingAddressRequired,
    this.shippingAddressParameters,
    this.shippingOptionRequired,
    this.shippingOptionParameters,
  });

  factory GooglePayPaymentDataRequest.payu({
    required String merchantId,
    required String merchantName,
    required String currencyCode,
    required String countryCode,
    required String totalPrice,
  }) {
    return GooglePayPaymentDataRequest(
      apiVersion: defaultApiVersion,
      apiVersionMinor: defaultApiVersionMinor,
      merchantInfo: GooglePayMerchantInfo(
        merchantId: merchantId,
        merchantName: merchantName,
      ),
      allowedPaymentMethods: [
        GooglePayPaymentMethod(
          type: GooglePayPaymentMethod.typeCard,
          parameters: const GooglePayCardParameters(
            allowedAuthMethods: [
              GooglePayCardParameters.allowedAuthMethodPanOnly,
              GooglePayCardParameters.allowedAuthMethodCryptogram3DS,
            ],
            allowedCardNetworks: [
              GooglePayCardParameters.allowedCardNetworkMastercard,
              GooglePayCardParameters.allowedCardNetworkVisa,
            ],
          ),
          tokenizationSpecification: GooglePayPaymentMethodTokenizationSpecification(
            type: GooglePayPaymentMethodTokenizationSpecification.typePaymentGateway,
            parameters: GooglePayPaymentMethodTokenizationSpecificationParameters(
              gateway: 'payu',
              gatewayMerchantId: merchantId,
            ),
          ),
        )
      ],
      transactionInfo: GooglePayTransactionInfo(
        currencyCode: currencyCode,
        countryCode: countryCode,
        totalPriceStatus: GooglePayTransactionInfo.totalPriceStatusFinal,
        totalPrice: totalPrice,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiVersion': apiVersion,
      'apiVersionMinor': apiVersionMinor,
      'merchantInfo': merchantInfo?.toJson(),
      'allowedPaymentMethods': allowedPaymentMethods.map((e) => e.toJson()).toList(),
      'transactionInfo': transactionInfo.toJson(),
      'callbackIntents': callbackIntents,
      'offerInfo': offerInfo?.toJson(),
      'emailRequired': emailRequired,
      'shippingAddressRequired': shippingAddressRequired,
      'shippingAddressParameters': shippingAddressParameters?.toJson(),
      'shippingOptionRequired': shippingOptionRequired,
      'shippingOptionParameters': shippingOptionParameters?.map((e) => e.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
