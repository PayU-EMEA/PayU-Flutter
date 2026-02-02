import 'package:payu_mobile_payments/payu_mobile_payments.dart';

class ApplePayPaymentRequestBuilder {
  String? _countryCode;
  String? _currencyCode;
  String? _merchantIdentifier;
  ApplePayContact? _shippingContact;
  List<ApplePaySummaryItem>? _paymentSummaryItems;

  ApplePayPaymentRequestBuilder withCountryCode(String countryCode) {
    _countryCode = countryCode;
    return this;
  }

  ApplePayPaymentRequestBuilder withCurrencyCode(String currencyCode) {
    _currencyCode = currencyCode;
    return this;
  }

  ApplePayPaymentRequestBuilder withMerchantIdentifier(String merchantIdentifier) {
    _merchantIdentifier = merchantIdentifier;
    return this;
  }

  ApplePayPaymentRequestBuilder withShippingContact(ApplePayContact shippingContact) {
    _shippingContact = shippingContact;
    return this;
  }

  ApplePayPaymentRequestBuilder withPaymentSummaryItems(List<ApplePaySummaryItem> paymentSummaryItems) {
    _paymentSummaryItems = paymentSummaryItems;
    return this;
  }

  ApplePayPaymentRequest build() {
    assert(_countryCode != null, '`countryCode` cannot be null');
    assert(_currencyCode != null, '`currencyCode` cannot be null');
    assert(_merchantIdentifier != null, '`merchantIdentifier` cannot be null');
    assert(_paymentSummaryItems != null, '`paymentSummaryItems` cannot be null');

    return ApplePayPaymentRequest(
      merchantIdentifier: _merchantIdentifier!,
      countryCode: _countryCode!,
      currencyCode: _currencyCode!,
      shippingContact: _shippingContact,
      paymentSummaryItems: _paymentSummaryItems!,
    );
  }
}
