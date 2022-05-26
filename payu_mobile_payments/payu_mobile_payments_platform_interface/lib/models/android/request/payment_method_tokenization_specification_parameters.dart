class PaymentMethodTokenizationSpecificationParameters {
  final String? gateway;
  final String? gatewayMerchantId;
  final String? protocolVersion;
  final String? publicKey;

  const PaymentMethodTokenizationSpecificationParameters({
    this.gateway,
    this.gatewayMerchantId,
    this.protocolVersion,
    this.publicKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'gateway': gateway,
      'gatewayMerchantId': gatewayMerchantId,
      'protocolVersion': protocolVersion,
      'publicKey': publicKey,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
