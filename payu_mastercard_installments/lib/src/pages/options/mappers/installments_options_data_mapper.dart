import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:payu_translations/payu_translations.dart';

import '../../../../payu_mastercard_installments.dart';
import '../installments_options_list_tile_data.dart';

class InstallmentsOptionsDataMapper {
  final NumberFormat _percentageFormatter;
  final NumberFormat _priceFormatter;

  InstallmentsOptionsDataMapper(this._percentageFormatter, this._priceFormatter);

  List<InstallmentsOptionsListTileData> map(InstallmentProposal proposal) {
    switch (proposal.installmentOptionFormat) {
      case InstallmentOptionFormat.varyingNumberOfInstallments:
        return _mapVaryingNumberOfInstallments(proposal);
      case InstallmentOptionFormat.varyingNumberOfOptions:
        return _mapVaryingNumberOfOptions(proposal);
    }
  }

  List<InstallmentsOptionsListTileData> _mapVaryingNumberOfInstallments(InstallmentProposal proposal) {
    final min = proposal.minNumberOfInstallments;
    final max = proposal.maxNumberOfInstallments;
    final option = proposal.installmentOptions.firstOrNull;

    if (min == null) throw const FormatException('`minNumberOfInstallments` cannot be null');
    if (max == null) throw const FormatException('`maxNumberOfInstallments` cannot be null');
    if (option == null) throw const FormatException('`installmentOptions` must contain one item');

    final installmentOptions = List.generate(max - min + 1, (index) => min + index)
        .map((numberOfInstallments) => option.copyWith(numberOfInstallments: numberOfInstallments))
        .toList();

    return installmentOptions
        .map(
          (e) => InstallmentsOptionsListTileData(
            option: e,
            title: _formattedNumberOfInstallments(e.numberOfInstallments!),
            prefix: null,
            subtitle: _formattedInterestRate(option),
            total: _formattedTotal(option),
          ),
        )
        .toList();
  }

  List<InstallmentsOptionsListTileData> _mapVaryingNumberOfOptions(InstallmentProposal proposal) {
    return proposal.installmentOptions
        .map(
          (e) => InstallmentsOptionsListTileData(
            option: e,
            title: _formattedNumberOfInstallments(e.numberOfInstallments!),
            prefix: '1_st_installment'.translated(),
            subtitle: _formattedFirstInstallmentAmount(e),
            total: _formattedTotal(e),
          ),
        )
        .toList();
  }

  String _formattedNumberOfInstallments(int numberOfInstallments) {
    return Plurals.plural(
      value: numberOfInstallments,
      zero: 'installments_count_zero',
      one: 'installments_count_one',
      two: 'installments_count_two',
      few: 'installments_count_few',
      many: 'installments_count_many',
    ).translated(args: [numberOfInstallments.toString()]);
  }

  String _formattedInterestRate(InstallmentOption e) {
    return _percentageFormatter.format(e.interestRate / 100);
  }

  String _formattedFirstInstallmentAmount(InstallmentOption e) {
    return _priceFormatter.format(e.firstInstallmentAmount!.toDouble() / 100);
  }

  String _formattedTotal(InstallmentOption e) {
    return '${'total'.translated()} ${_priceFormatter.format(e.totalAmountDue / 100)}';
  }
}
