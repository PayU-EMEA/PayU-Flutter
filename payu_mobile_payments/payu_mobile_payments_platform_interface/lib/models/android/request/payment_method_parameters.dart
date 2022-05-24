class PaymentMethodParameters {
  static const allowedAuthMethodPanOnly = 'PAN_ONLY';
  static const allowedAuthMethodCryptogram3DS = 'CRYPTOGRAM_3DS';
  static const defaultAllowedAuthMethods = [
    allowedAuthMethodPanOnly,
    allowedAuthMethodCryptogram3DS,
  ];

  static const allowedCardNetworkMastercard = 'MASTERCARD';
  static const allowedCardNetworkVisa = 'VISA';
  static const defaultAllowedCardNetworks = [
    allowedCardNetworkMastercard,
    allowedCardNetworkVisa,
  ];

  final List<String> allowedAuthMethods;
  final List<String> allowedCardNetworks;

  const PaymentMethodParameters({
    required this.allowedAuthMethods,
    required this.allowedCardNetworks,
  });

  Map<String, dynamic> toJson() {
    return {
      'allowedAuthMethods': allowedAuthMethods,
      'allowedCardNetworks': allowedCardNetworks,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
