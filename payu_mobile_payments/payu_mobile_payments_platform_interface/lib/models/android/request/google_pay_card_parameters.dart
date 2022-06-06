class GooglePayCardParameters {
  static const allowedAuthMethodPanOnly = 'PAN_ONLY';
  static const allowedAuthMethodCryptogram3DS = 'CRYPTOGRAM_3DS';

  static const allowedCardNetworkMastercard = 'MASTERCARD';
  static const allowedCardNetworkVisa = 'VISA';

  final List<String> allowedAuthMethods;
  final List<String> allowedCardNetworks;

  const GooglePayCardParameters({
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
