import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/demo_theme/demo_theme_controller.dart';

class DemoThemePage extends GetView<DemoThemeController> {
  static const _awesomeColor = Colors.amber;

  const DemoThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Payu.theme;

    return Theme(
      data: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          actionsIconTheme: theme.appBarTheme.actionsIconTheme?.copyWith(color: _awesomeColor),
          iconTheme: theme.appBarTheme.iconTheme?.copyWith(color: _awesomeColor),
          titleTextStyle: theme.appBarTheme.titleTextStyle?.copyWith(color: _awesomeColor),
        ),
        colorScheme: theme.colorScheme.copyWith(primary: _awesomeColor),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: PayuImage.logo(),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.payment),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: ListTile(
                title: const Text('ListTile'),
                subtitle: const Text('subtitle'),
                onTap: () => {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'hintText'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                decoration: InputDecoration(helperText: 'helperText'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                decoration: InputDecoration(errorText: 'errorText'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'labelText'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: () => {},
                child: const Text('Button'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text('Button'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: OutlinedButton(
                onPressed: () => {},
                child: const Text('Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
