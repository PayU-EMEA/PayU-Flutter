import 'package:flutter/material.dart';

import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';

import 'about_assembler.dart';
import 'about_controller.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<AboutController, AboutAssembler>(
      assembler: () => AboutAssembler(),
      builder: (context, controller) => AlertDialog(
        content: Wrap(
          children: controller.items
              .map(
                (e) => ListTile(
                  title: Text(e.title),
                  subtitle: Text(e.value),
                  onTap: () => controller.didTapItem(e),
                ),
              )
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('back'.translated()),
          ),
        ],
      ),
    );
  }
}
