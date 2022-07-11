class InstallmentOption {
  final String id;
  final double interestRate;
  final int installmentFeeAmount;
  final double annualPercentageRate;
  final int totalAmountDue;

  // only for VARYING_NUMBER_OF_OPTIONS

  final int? firstInstallmentAmount;
  final int? installmentAmount;
  final int? numberOfInstallments;

  const InstallmentOption({
    required this.id,
    required this.interestRate,
    required this.installmentFeeAmount,
    required this.annualPercentageRate,
    required this.totalAmountDue,
    this.firstInstallmentAmount,
    this.installmentAmount,
    this.numberOfInstallments,
  });

  factory InstallmentOption.fromJson(Map<String, dynamic> json) {
    return InstallmentOption(
      id: json['id'],
      interestRate: double.parse(json['interestRate'].toString()),
      installmentFeeAmount: json['installmentFeeAmount'],
      annualPercentageRate: double.parse(json['annualPercentageRate'].toString()),
      totalAmountDue: json['totalAmountDue'],
      firstInstallmentAmount: json['firstInstallmentAmount'],
      installmentAmount: json['installmentAmount'],
      numberOfInstallments: json['numberOfInstallments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'interestRate': interestRate,
      'installmentFeeAmount': installmentFeeAmount,
      'annualPercentageRate': annualPercentageRate,
      'totalAmountDue': totalAmountDue,
      'firstInstallmentAmount': firstInstallmentAmount,
      'installmentAmount': installmentAmount,
      'numberOfInstallments': numberOfInstallments,
    };
  }

  InstallmentOption copyWith({required int numberOfInstallments}) {
    return InstallmentOption(
      id: id,
      interestRate: interestRate,
      installmentFeeAmount: installmentFeeAmount,
      annualPercentageRate: annualPercentageRate,
      totalAmountDue: totalAmountDue,
      firstInstallmentAmount: firstInstallmentAmount,
      installmentAmount: installmentAmount,
      numberOfInstallments: numberOfInstallments,
    );
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
