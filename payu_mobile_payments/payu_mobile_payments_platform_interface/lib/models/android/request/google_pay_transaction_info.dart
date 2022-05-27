class GooglePayTransactionInfo {
  static const totalPriceStatusFinal = 'FINAL';

  final String currencyCode;
  final String countryCode;
  final String totalPriceStatus;
  final String totalPrice;

  const GooglePayTransactionInfo({
    required this.currencyCode,
    required this.countryCode,
    required this.totalPriceStatus,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'currencyCode': currencyCode,
      'countryCode': countryCode,
      'totalPriceStatus': totalPriceStatus,
      'totalPrice': totalPrice,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
