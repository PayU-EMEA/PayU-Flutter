import 'package:example/features/settings/settings_controller.dart';
import 'package:example/features/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsPage'),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.models.length,
          itemBuilder: (context, index) => _SettingsListTile(
            model: controller.models[index],
            onPressed: () => controller.didTap(controller.models[index]),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  final SettingsModel model;
  final VoidCallback onPressed;

  const _SettingsListTile({
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.title),
      subtitle: model.subtitle != null ? Text(model.subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => onPressed(),
    );
  }
}
