import 'package:example/features/settings/controllers/settings_currencies_controller.dart';
import 'package:example/features/settings/controllers/settings_environments_controller.dart';
import 'package:example/features/settings/controllers/settings_languages_controller.dart';
import 'package:example/features/settings/settings_model.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final SettingsCurrenciesController _currenciesController;
  final SettingsEnvironmentsController _environmentsController;
  final SettingsLanguagesController _languagesController;

  List<SettingsModel> get models => _models();
  final _models = <SettingsModel>[].obs;

  SettingsController(
    this._currenciesController,
    this._environmentsController,
    this._languagesController,
  );

  @override
  void onInit() {
    _setupSettingsModels();
    super.onInit();
  }

  void didTap(SettingsModel model) {
    switch (model.type) {
      case SettingsModelType.currency:
        _showCurrensies();
        break;
      case SettingsModelType.environment:
        _showEnvironments();
        break;
      case SettingsModelType.language:
        _showLanguages();
        break;
    }
  }

  void _setupSettingsModels() {
    _models.clear();

    final currencyDescription = _currenciesController.current;
    final environmentDescription = [
      _environmentsController.current?.name,
      _environmentsController.current?.clientId,
    ].nonNulls.join('\n');
    final languageDescription = _languagesController.current;

    _models.add(SettingsModel.currency().copyWith(subtitle: currencyDescription));
    _models.add(SettingsModel.environment().copyWith(subtitle: environmentDescription));
    _models.add(SettingsModel.language().copyWith(subtitle: languageDescription));
  }

  void _showCurrensies() => _currenciesController.showCurrensies().then((value) => _setupSettingsModels());
  void _showEnvironments() => _environmentsController.showEnvironments().then((value) => _setupSettingsModels());
  void _showLanguages() => _languagesController.showLanguages().then((value) => _setupSettingsModels());
}
