import 'google_pay_display_item.dart';

class GooglePayTransactionInfo {
  static const checkoutOptionDefault = 'DEFAULT';
  static const checkoutOptionCompleteImmediatePurchase = 'COMPLETE_IMMEDIATE_PURCHASE';

  static const totalPriceStatusNotCurrentlyKnown = 'NOT_CURRENTLY_KNOWN';
  static const totalPriceStatusEstimated = 'ESTIMATED';
  static const totalPriceStatusFinal = 'FINAL';

  final String currencyCode;
  final String countryCode;
  final String totalPriceStatus;
  final String totalPrice;
  final List<GooglePayDisplayItem>? displayItems;
  final String? totalPriceLabel;
  final String? checkoutOption;

  const GooglePayTransactionInfo({
    required this.currencyCode,
    required this.countryCode,
    required this.totalPriceStatus,
    required this.totalPrice,
    this.displayItems,
    this.totalPriceLabel,
    this.checkoutOption,
  });

  Map<String, dynamic> toJson() {
    return {
      'currencyCode': currencyCode,
      'countryCode': countryCode,
      'totalPriceStatus': totalPriceStatus,
      'totalPrice': totalPrice,
      'displayItems': displayItems?.map((e) => e.toJson()).toList(),
      'checkoutOption': checkoutOption,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
