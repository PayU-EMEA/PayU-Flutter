class TransactionInfo {
  static const totalPriceStatusNotCurrentlyKnown = 'NOT_CURRENTLY_KNOWN';
  static const totalPriceStatusEstimated = 'ESTIMATED';
  static const totalPriceStatusFinal = 'FINAL';

  final String currencyCode;
  final String countryCode;
  final String totalPriceStatus;
  final String totalPrice;

  const TransactionInfo({
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
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
