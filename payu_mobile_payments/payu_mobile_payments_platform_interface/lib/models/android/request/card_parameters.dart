import 'billing_address_parameters.dart';

class CardParameters {
  static const allowedAuthMethodPanOnly = 'PAN_ONLY';
  static const allowedAuthMethodCryptogram3DS = 'CRYPTOGRAM_3DS';

  static const allowedCardNetworkAmex = 'AMEX';
  static const allowedCardNetworkDiscover = 'DISCOVER';
  static const allowedCardNetworkElectron = 'ELECTRON';
  static const allowedCardNetworkElo = 'ELO';
  static const allowedCardNetworkEloDebit = 'ELO_DEBIT';
  static const allowedCardNetworkInterac = 'INTERAC';
  static const allowedCardNetworkJcb = 'JCB';
  static const allowedCardNetworkMaestro = 'MAESTRO';
  static const allowedCardNetworkMastercard = 'MASTERCARD';
  static const allowedCardNetworkMir = 'MIR';
  static const allowedCardNetworkVisa = 'VISA';

  final List<String> allowedAuthMethods;
  final List<String> allowedCardNetworks;
  final bool? allowPrepaidCards;
  final bool? allowCreditCards;
  final bool? assuranceDetailsRequired;
  final bool? billingAddressRequired;
  final BillingAddressParameters? billingAddressParameters;

  const CardParameters({
    required this.allowedAuthMethods,
    required this.allowedCardNetworks,
    this.allowPrepaidCards,
    this.allowCreditCards,
    this.assuranceDetailsRequired,
    this.billingAddressRequired,
    this.billingAddressParameters,
  });

  Map<String, dynamic> toJson() {
    return {
      'allowedAuthMethods': allowedAuthMethods,
      'allowedCardNetworks': allowedCardNetworks,
      'allowPrepaidCards': allowPrepaidCards,
      'allowCreditCards': allowCreditCards,
      'assuranceDetailsRequired': assuranceDetailsRequired,
      'billingAddressRequired': billingAddressRequired,
      'billingAddressParameters': billingAddressParameters?.toJson(),
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
