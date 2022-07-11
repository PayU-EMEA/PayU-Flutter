class GooglePayPaymentMethodTokenizationSpecificationParameters {
  final String gateway;
  final String gatewayMerchantId;

  const GooglePayPaymentMethodTokenizationSpecificationParameters({
    required this.gateway,
    required this.gatewayMerchantId,
  });

  Map<String, dynamic> toJson() {
    return {
      'gateway': gateway,
      'gatewayMerchantId': gatewayMerchantId,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
