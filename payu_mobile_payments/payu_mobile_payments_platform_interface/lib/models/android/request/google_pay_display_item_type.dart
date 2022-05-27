class GooglePayDisplayItemType {
  static const lineItem = GooglePayDisplayItemType._('LINE_ITEM');
  static const subtotal = GooglePayDisplayItemType._('SUBTOTAL');

  final String value;

  const GooglePayDisplayItemType._(this.value);

  @override
  String toString() => '[$runtimeType]: $value';
}
