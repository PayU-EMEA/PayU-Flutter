import 'card_parameters.dart';
import 'merchant_info.dart';
import 'offer_info.dart';
import 'payment_method.dart';
import 'payment_method_tokenization_specification.dart';
import 'payment_method_tokenization_specification_parameters.dart';
import 'shipping_address_parameters.dart';
import 'shipping_option_parameters.dart';
import 'transaction_info.dart';

class PaymentDataRequest {
  static const defaultApiVersion = 2;
  static const defaultApiVersionMinor = 0;

  static const callbackIntentsOffer = 'OFFER';
  static const callbackIntentsOaymentAuthorization = 'PAYMENT_AUTHORIZATION';
  static const callbackIntentsShippingAddress = 'SHIPPING_ADDRESS';
  static const callbackIntentsShippingOption = 'SHIPPING_OPTION';

  final int apiVersion;
  final int apiVersionMinor;
  final MerchantInfo? merchantInfo;
  final List<PaymentMethod> allowedPaymentMethods;
  final TransactionInfo transactionInfo;
  final List<String>? callbackIntents;
  final OfferInfo? offerInfo;
  final bool? emailRequired;
  final bool? shippingAddressRequired;
  final ShippingAddressParameters? shippingAddressParameters;
  final bool? shippingOptionRequired;
  final List<ShippingOptionParameters>? shippingOptionParameters;

  const PaymentDataRequest({
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

  factory PaymentDataRequest.payu({
    required String merchantId,
    required String merchantName,
    required String currencyCode,
    required String countryCode,
    required String totalPrice,
  }) {
    return PaymentDataRequest(
      apiVersion: defaultApiVersion,
      apiVersionMinor: defaultApiVersionMinor,
      merchantInfo: MerchantInfo(
        merchantId: merchantId,
        merchantName: merchantName,
      ),
      allowedPaymentMethods: [
        PaymentMethod(
          type: PaymentMethod.typeCard,
          parameters: const CardParameters(
            allowedAuthMethods: [
              CardParameters.allowedAuthMethodPanOnly,
              CardParameters.allowedAuthMethodCryptogram3DS,
            ],
            allowedCardNetworks: [
              CardParameters.allowedCardNetworkMastercard,
              CardParameters.allowedCardNetworkVisa,
            ],
          ),
          tokenizationSpecification: PaymentMethodTokenizationSpecification(
            type: PaymentMethodTokenizationSpecification.typePaymentGateway,
            parameters: PaymentMethodTokenizationSpecificationParameters(
              gateway: 'payu',
              gatewayMerchantId: merchantId,
            ),
          ),
        )
      ],
      transactionInfo: TransactionInfo(
        currencyCode: currencyCode,
        countryCode: countryCode,
        totalPriceStatus: TransactionInfo.totalPriceStatusFinal,
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
