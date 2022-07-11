import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';

import '../../../payu_mastercard_installments.dart';
import 'installments_options_list_item.dart';
import 'mappers/installments_options_data_mapper.dart';
import 'mappers/installments_options_result_mapper.dart';

class InstallmentsOptionsController extends PayuController {
  final InstallmentProposal _proposal;
  final InstallmentsOptionsDataMapper _dataMapper;
  final InstallmentsOptionsResultMapper _resultMapper;

  List<InstallmenstOptionsListItem> get items => _items;
  final List<InstallmenstOptionsListItem> _items = [];

  InstallmentsOptionsController(this._proposal, this._dataMapper, this._resultMapper) {
    _items.add(InstallmenstOptionsListHeaderItem());
    _items.addAll(_dataMapper.map(_proposal).map((e) => InstallmenstOptionsListOptionItem(e)));
  }

  void didSelectOption(BuildContext context, InstallmentOption option) {
    final result = _resultMapper.map(_proposal, option);
    Navigator.of(context).pop(result);
  }
}
