class MerchantInfo {
  final String merchantId;
  final String? merchantName;

  const MerchantInfo({
    required this.merchantId,
    this.merchantName,
  });

  Map<String, dynamic> toJson() {
    return {
      'merchantId': merchantId,
      'merchantName': merchantName,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
