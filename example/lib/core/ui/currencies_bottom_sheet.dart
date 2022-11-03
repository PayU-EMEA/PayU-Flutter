import 'package:example/core/ui/search_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CurrenciesBottomSheet extends StatelessWidget {
  final List<String> models;
  final String model;
  final Function(String) onChange;

  const CurrenciesBottomSheet({
    super.key,
    required this.models,
    required this.model,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBottomSheet(
      title: 'Select Currency',
      itemCount: models.length,
      itemTitleBuilder: (index) => models[index],
      itemSelectedBuilder: (index) => models[index] == model,
      onTap: (index) => onChange(models[index]),
    );
  }
}
