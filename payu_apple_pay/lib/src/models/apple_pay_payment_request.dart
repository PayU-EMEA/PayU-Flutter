import 'apple_pay_contact.dart';
import 'apple_pay_summary_item.dart';

class ApplePayPaymentRequest {
  /// Identifies the merchant, as previously agreed with Apple. Must match
  /// one of the merchant identifiers in the application's entitlement.
  final String merchantIdentifier;

  /// The merchant’s two-letter ISO 3166 country code.
  final String countryCode;

  /// The three-letter ISO 4217 currency code.
  final String currencyCode;

  /// A prepopulated shipping address.
  final ApplePayContact shippingContact;

  /// List of [ApplePaySummaryItem] objects which should be presented to the user.
  /// The last item should be the total you wish to charge
  final List<ApplePaySummaryItem> paymentSummaryItems;

  const ApplePayPaymentRequest({
    required this.merchantIdentifier,
    required this.countryCode,
    required this.currencyCode,
    required this.shippingContact,
    required this.paymentSummaryItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'merchantIdentifier': merchantIdentifier,
      'countryCode': countryCode,
      'currencyCode': currencyCode,
      'shippingContact': shippingContact.toJson(),
      'paymentSummaryItems': paymentSummaryItems.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
