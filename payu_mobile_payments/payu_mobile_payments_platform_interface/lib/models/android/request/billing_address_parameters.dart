class BillingAddressParameters {
  static const formatMin = 'MIN';
  static const formatFull = 'FULL';

  final String format;
  final bool? phoneNumberRequired;

  const BillingAddressParameters({
    required this.format,
    this.phoneNumberRequired,
  });

  Map<String, dynamic> toJson() {
    return {
      'format': format,
      'phoneNumberRequired': phoneNumberRequired,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
