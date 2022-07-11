import 'installment_option.dart';
import 'installment_option_format.dart';

class InstallmentProposal {
  final String id;
  final String cardScheme;
  final InstallmentOptionFormat installmentOptionFormat;
  final String currencyCode;
  final List<InstallmentOption> installmentOptions;

  // only for VARYING_NUMBER_OF_INSTALLMENTS

  final int? minNumberOfInstallments;
  final int? maxNumberOfInstallments;

  const InstallmentProposal({
    required this.id,
    required this.cardScheme,
    required this.installmentOptionFormat,
    required this.currencyCode,
    required this.installmentOptions,
    this.minNumberOfInstallments,
    this.maxNumberOfInstallments,
  });

  factory InstallmentProposal.fromJson(Map<String, dynamic> json) {
    return InstallmentProposal(
      id: json['id'],
      cardScheme: json['cardScheme'],
      installmentOptionFormat: InstallmentOptionFormatFromExt.fromValue(json['installmentOptionFormat']),
      currencyCode: json['currencyCode'],
      installmentOptions: (json['installmentOptions'] as List<dynamic>)
          .map((e) => InstallmentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      minNumberOfInstallments: json['minNumberOfInstallments'],
      maxNumberOfInstallments: json['maxNumberOfInstallments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardScheme': cardScheme,
      'installmentOptionFormat': installmentOptionFormat.value,
      'currencyCode': currencyCode,
      'installmentOptions': installmentOptions,
      'minNumberOfInstallments': minNumberOfInstallments,
      'maxNumberOfInstallments': maxNumberOfInstallments,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
