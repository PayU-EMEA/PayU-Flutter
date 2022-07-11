enum InstallmentOptionFormat {
  varyingNumberOfInstallments,
  varyingNumberOfOptions,
}

extension InstallmentOptionFormatFromExt on InstallmentOptionFormat {
  static InstallmentOptionFormat fromValue(String value) {
    switch (value) {
      case 'VARYING_NUMBER_OF_INSTALLMENTS':
        return InstallmentOptionFormat.varyingNumberOfInstallments;
      case 'VARYING_NUMBER_OF_OPTIONS':
        return InstallmentOptionFormat.varyingNumberOfOptions;
      default:
        throw UnimplementedError();
    }
  }
}

extension InstallmentOptionFormatToExt on InstallmentOptionFormat {
  String get value {
    switch (this) {
      case InstallmentOptionFormat.varyingNumberOfInstallments:
        return 'VARYING_NUMBER_OF_INSTALLMENTS';
      case InstallmentOptionFormat.varyingNumberOfOptions:
        return 'VARYING_NUMBER_OF_OPTIONS';
    }
  }
}
