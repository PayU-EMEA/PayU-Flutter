import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EnvironmentsDeleteAlertDialog extends StatelessWidget {
  final bool isCurrentEnvironment;
  final bool isDefaultEnvironment;

  final VoidCallback onConfirm;

  const EnvironmentsDeleteAlertDialog({
    Key? key,
    required this.isCurrentEnvironment,
    required this.isDefaultEnvironment,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: isDefaultEnvironment
          ? const Text('This environment cannot be deleted')
          : const Text('Do you want to delete environment?'),
      content: isCurrentEnvironment && !isDefaultEnvironment
          ? const Text('After confirmation app will use default `sandbox` environment')
          : null,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        if (!isDefaultEnvironment)
          TextButton(
            onPressed: () {
              Get.back();
              onConfirm();
            },
            child: const Text('Confirm'),
          ),
      ],
    );
  }
}
