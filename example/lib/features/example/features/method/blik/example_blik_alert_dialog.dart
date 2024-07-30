import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/features/example/features/method/blik/example_blik_alert_dialog_controller.dart';

class ExampleBlikAlertDialog extends StatelessWidget {
  final _controller = ExampleBlikAlertDialogController();

  ExampleBlikAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter 6 digits BLIK'),
      content: TextField(
        controller: _controller.textEditingController,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: _controller.textEditingController.text),
          child: const Text('Use'),
        ),
      ],
    );
  }
}
