import 'package:example/core/ui/currencies_bottom_sheet.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';
import 'package:get/get.dart';

class SettingsCurrenciesController extends GetxController {
  final SettingsRepository _repository;

  String get current => _repository.currencyCode;

  SettingsCurrenciesController(this._repository);

  Future<void> showCurrensies() async {
    await Get.bottomSheet(
      CurrenciesBottomSheet(
        models: _repository.getCurrencies(),
        model: _repository.currencyCode,
        onChange: (e) => _repository.setCurrencyCode(e),
      ),
    );
  }
}
