class GooglePayPaymentMethodTokenizationSpecificationParameters {
  final String? gateway;
  final String? gatewayMerchantId;

  const GooglePayPaymentMethodTokenizationSpecificationParameters({
    this.gateway,
    this.gatewayMerchantId,
  });

  Map<String, dynamic> toJson() {
    return {
      'gateway': gateway,
      'gatewayMerchantId': gatewayMerchantId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
