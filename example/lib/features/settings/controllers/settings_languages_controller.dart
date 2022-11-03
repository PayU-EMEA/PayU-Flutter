import 'package:example/core/ui/languages_bottom_sheet.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';
import 'package:get/get.dart';

class SettingsLanguagesController extends GetxController {
  final SettingsRepository _repository;

  String get current => _repository.languageCode;

  SettingsLanguagesController(this._repository);

  Future<void> showLanguages() async {
    await Get.bottomSheet(
      LanguagesBottomSheet(
        models: _repository.getLanguages(),
        model: _repository.languageCode,
        onChange: (e) => _repository.setLanguageCode(e),
      ),
    );
  }
}
