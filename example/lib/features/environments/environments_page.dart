import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/core/extensions/string_ext.dart';
import 'package:example/features/environments/environments_controller.dart';
import 'package:example/features/environments/environments_model.dart';

class EnvironmentsPage extends GetView<EnvironmentsController> {
  const EnvironmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnvironmentsPage'),
        actions: [
          IconButton(
            onPressed: () => controller.didTapAdd(),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.environments.length,
          itemBuilder: (context, index) => _EnvironmenstListTile(
              environment: controller.environments[index],
              selected: controller.selected,
              onUse: () => controller.didTapUse(controller.environments[index]),
              onDelete: () => controller.didTapDelete(controller.environments[index])),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class _EnvironmenstListTile extends StatelessWidget {
  final EnvironmentsModel environment;
  final EnvironmentsModel? selected;
  final VoidCallback onUse;
  final VoidCallback onDelete;

  const _EnvironmenstListTile({
    Key? key,
    required this.environment,
    required this.selected,
    required this.onUse,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(environment.name),
      subtitle: Text('${environment.clientId}\n${environment.clientSecret.truncated(10)}'),
      isThreeLine: true,
      leading: Visibility(
        visible: environment == selected,
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      ),
      trailing: Wrap(
        children: [
          TextButton(
            onPressed: onDelete,
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: onUse,
            child: const Text('Use'),
          ),
        ],
      ),
    );
  }
}
