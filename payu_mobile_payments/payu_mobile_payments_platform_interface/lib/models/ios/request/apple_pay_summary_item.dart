class ApplePaySummaryItem {
  /// A short localized description of the item, e.g. "Tax" or "Gift Card".
  final String label;

  /// Value in cents. Same currency as the enclosing [ApplePayPaymentRequest].
  /// Negative values are permitted, for example when redeeming a coupon.
  /// An amount is always required unless the summary item's type is set to pending
  final int amount;

  const ApplePaySummaryItem({
    required this.label,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'amount': amount,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
