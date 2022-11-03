import 'package:example/core/routes.dart';
import 'package:example/core/ui/environenments_bottom_sheet.dart';
import 'package:example/data/models/environment_model.dart';
import 'package:example/data/repositories/environments_repository.dart';
import 'package:get/get.dart';

class SettingsEnvironmentsController extends GetxController {
  final EnvironmentsRepository _repository;

  EnvironmentModel? get current => _repository.currentEnvironment();

  SettingsEnvironmentsController(this._repository);

  Future<void> showEnvironments() async {
    await Get.bottomSheet(
      EnvironmentsBottomSheet(
        models: _repository.getEnvironments().obs..bindStream(_repository.watchEnvironments()),
        model: _repository.currentEnvironment(),
        onAdd: () => Get.toNamed(Routes.environmentsCreate)?.then((value) => Get.back()),
        onChange: (e) async => await _repository.setEnvironment(e),
        onDelete: (e) async => await _repository.deleteEnvironment(e),
      ),
    );
  }
}
