class InstallmentResult {
  /// required for VARYING_NUMBER_OF_OPTIONS format
  final String? optionId;

  /// required for VARYING_NUMBER_OF_INSTALLMENTS format
  final int? numberOfInstallments;

  const InstallmentResult({
    this.optionId,
    this.numberOfInstallments,
  });

  Map<String, dynamic> toJson() {
    return {
      'optionId': optionId,
      'numberOfInstallments': numberOfInstallments,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
