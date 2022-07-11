import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:example/core/ui/snackbar.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:example/data/repositories/environments_repository.dart';
import 'package:example/features/environments/environments_model.dart';

class EnvironmentsCreateController extends GetxController {
  final EnvironmentsRepository _repository;

  late final environments = Environment.values;
  late final environment = Environment.sandbox.obs;

  late final grantTypes = GrantType.values;
  late final grantType = GrantType.trustedMerchant.obs;

  late final clientIdController = TextEditingController();
  late final clientSecretController = TextEditingController();
  late final nameController = TextEditingController();

  bool _isValid(TextEditingController controller) => controller.text.isNotEmpty;

  EnvironmentsCreateController(this._repository);

  void didTapBackButton() {
    Get.back();
  }

  void didTapSaveButton() async {
    _saveAndBack();
  }

  void didSelectEnvironment(Environment? value) {
    if (value != null) environment(value);
  }

  void didSelectGrantType(GrantType? value) {
    if (value != null) grantType(value);
  }

  void _saveAndBack() async {
    if (_isValid(clientIdController) && _isValid(clientSecretController) && _isValid(nameController)) {
      final model = EnvironmentsModel(
        grantType: grantType(),
        environment: environment(),
        clientId: clientIdController.text,
        clientSecret: clientSecretController.text,
        name: nameController.text,
      );

      if (_repository.containsEnvironment(model)) {
        snackbar('Same environment already exists');
      } else {
        await _repository.putEnvironment(model);
        Get.back(result: model);
      }
    }
  }
}
