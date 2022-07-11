import 'package:payu_mobile_payments_platform_interface/payu_mobile_payments_platform_interface.dart';

class GooglePayPaymentDataRequestBuilder {
  String? _countryCode;
  String? _currencyCode;
  String? _merchantId;
  String? _merchantName;
  String? _totalPrice;

  GooglePayPaymentDataRequestBuilder withCountryCode(String countryCode) {
    _countryCode = countryCode;
    return this;
  }

  GooglePayPaymentDataRequestBuilder withCurrencyCode(String currencyCode) {
    _currencyCode = currencyCode;
    return this;
  }

  GooglePayPaymentDataRequestBuilder withMerchantId(String merchantId) {
    _merchantId = merchantId;
    return this;
  }

  GooglePayPaymentDataRequestBuilder withMerchantName(String merchantName) {
    _merchantName = merchantName;
    return this;
  }

  GooglePayPaymentDataRequestBuilder withTotalPrice(String totalPrice) {
    _totalPrice = totalPrice;
    return this;
  }

  GooglePayPaymentDataRequest build() {
    assert(_countryCode != null, '`countryCode` cannot be null');
    assert(_currencyCode != null, '`currencyCode` cannot be null');
    assert(_merchantId != null, '`merchantId` cannot be null');
    assert(_merchantName != null, '`merchantName` cannot be null');
    assert(_totalPrice != null, '`totalPrice` cannot be null');

    return GooglePayPaymentDataRequest(
      apiVersion: GooglePayPaymentDataRequest.defaultApiVersion,
      apiVersionMinor: GooglePayPaymentDataRequest.defaultApiVersionMinor,
      merchantInfo: GooglePayMerchantInfo(
        merchantId: _merchantId!,
        merchantName: _merchantName!,
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
              gatewayMerchantId: _merchantId!,
            ),
          ),
        )
      ],
      transactionInfo: GooglePayTransactionInfo(
        currencyCode: _currencyCode!,
        countryCode: _countryCode!,
        totalPriceStatus: GooglePayTransactionInfo.totalPriceStatusFinal,
        totalPrice: _totalPrice!,
      ),
    );
  }
}
