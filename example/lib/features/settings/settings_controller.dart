import 'package:collection/collection.dart';
import 'package:example/features/settings/controllers/settings_currencies_controller.dart';
import 'package:example/features/settings/controllers/settings_environments_controller.dart';
import 'package:example/features/settings/settings_model.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final SettingsCurrenciesController _currenciesController;
  final SettingsEnvironmentsController _environmentsController;

  List<SettingsModel> get models => _models();
  final _models = <SettingsModel>[].obs;

  SettingsController(
    this._currenciesController,
    this._environmentsController,
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
    }
  }

  void _setupSettingsModels() {
    _models.clear();

    final currencyDescription = _currenciesController.current;
    final environmentDescription = [
      _environmentsController.current?.name,
      _environmentsController.current?.clientId,
    ].whereNotNull().join('\n');

    _models.add(SettingsModel.currency().copyWith(subtitle: currencyDescription));
    _models.add(SettingsModel.environment().copyWith(subtitle: environmentDescription));
  }

  void _showCurrensies() => _currenciesController.showCurrensies().then((value) => _setupSettingsModels());
  void _showEnvironments() => _environmentsController.showEnvironments().then((value) => _setupSettingsModels());
}
