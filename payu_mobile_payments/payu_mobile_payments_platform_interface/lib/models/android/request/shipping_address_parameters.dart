class ShippingAddressParameters {
  final List<String>? allowedCountryCodes;
  final bool? phoneNumberRequired;

  const ShippingAddressParameters({
    this.allowedCountryCodes,
    this.phoneNumberRequired,
  });

  Map<String, dynamic> toJson() {
    return {
      'allowedCountryCodes': allowedCountryCodes,
      'phoneNumberRequired': phoneNumberRequired,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
