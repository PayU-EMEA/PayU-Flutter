import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:example/features/environments_create/environments_create_controller.dart';

class EnvironmentsCreatePage extends GetView<EnvironmentsCreateController> {
  const EnvironmentsCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => controller.didTapBackButton(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.didTapSaveButton(),
            icon: const Icon(Icons.save),
          ),
        ],
        title: const Text('EnvironmentsCreatePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => DropdownButton(
                value: controller.environment(),
                items: controller.environments.map((e) => DropdownMenuItem(child: Text(e.name), value: e)).toList(),
                onChanged: (Environment? environment) => controller.didSelectEnvironment(environment),
              ),
            ),
            Obx(
              () => DropdownButton(
                value: controller.grantType(),
                items: controller.grantTypes.map((e) => DropdownMenuItem(child: Text(e.key), value: e)).toList(),
                onChanged: (GrantType? grantType) => controller.didSelectGrantType(grantType),
              ),
            ),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'name'),
            ),
            TextField(
              controller: controller.clientIdController,
              decoration: const InputDecoration(labelText: 'clientId'),
            ),
            TextField(
              controller: controller.clientSecretController,
              decoration: const InputDecoration(labelText: 'clientSecret'),
            ),
          ],
        ),
      ),
    );
  }
}
