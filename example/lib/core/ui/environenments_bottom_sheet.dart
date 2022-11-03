import 'package:example/core/extensions/string_ext.dart';
import 'package:example/core/ui/search_bottom_sheet.dart';
import 'package:example/data/models/environment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnvironmentsBottomSheet extends StatelessWidget {
  final RxList<EnvironmentModel> models;
  final EnvironmentModel? model;
  final VoidCallback onAdd;
  final Function(EnvironmentModel) onChange;
  final Function(EnvironmentModel) onDelete;

  const EnvironmentsBottomSheet({
    super.key,
    required this.models,
    required this.model,
    required this.onAdd,
    required this.onChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SearchBottomSheet(
        title: 'Select Environment',
        itemCount: models.length,
        itemTitleBuilder: (index) => models[index].name,
        itemSelectedBuilder: (index) => models[index] == model,
        itemSubtitleBuilder: (index) => '${models[index].clientId} - ${models[index].clientSecret.truncated(10)}',
        itemTrailingBuilder: (index) => Visibility(
          visible: models[index] != model,
          child: IconButton(
            onPressed: () => onDelete(models[index]),
            icon: const Icon(Icons.delete_outline),
          ),
        ),
        onTap: (index) => onChange(models[index]),
        actions: [
          IconButton(
            onPressed: () => onAdd(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
