class GooglePayDisplayItem {
  static const statusFinal = 'FINAL';
  static const statusPending = 'PENDING';

  static const typeLineItem = 'LINE_ITEM';
  static const typeSubtotal = 'SUBTOTAL';

  final String label;
  final String type;
  final String price;
  final String? status;

  const GooglePayDisplayItem({
    required this.label,
    required this.type,
    required this.price,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'type': type,
      'price': price,
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
