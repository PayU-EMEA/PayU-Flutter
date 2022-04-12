import 'dart:async';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/core/routes.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/repositories/environments_repository.dart';
import 'package:example/features/environments/environments_delete_alert_dialog.dart';
import 'package:example/features/environments/environments_model.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';

class EnvironmentsController extends GetxController {
  final EnvironmentsRepository _environmentsRepository;
  final SettingsRepository _settingsRepository;

  List<EnvironmentsModel> get environments => _environments();
  EnvironmentsModel? get selected => environments.firstWhereOrNull((e) => e.clientId == _settingsRepository.clientId);
  late final _environments = _environmentsRepository.getEnvironments().obs;
  late final StreamSubscription? _subscription;

  EnvironmentsController(
    this._environmentsRepository,
    this._settingsRepository,
  );

  @override
  void onInit() {
    _setupEnvironmentsObserver();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void didTapAdd() async {
    final environment = await Get.toNamed(Routes.environmentsCreate);
    if (environment is EnvironmentsModel) didTapUse(environment);
  }

  void didTapUse(EnvironmentsModel environment) {
    _settingsRepository.setEnvironment(environment.environment);
    _settingsRepository.setGrantType(environment.grantType);
    _settingsRepository.setClientId(environment.clientId);
    _settingsRepository.setClientSecret(environment.clientSecret);

    Payu.pos = POS(id: environment.clientId);
    Payu.environment = environment.environment.toPayu();

    Get.back();
  }

  void didTapDelete(EnvironmentsModel environment) async {
    final isCurrentEnvironment = environment == selected;
    final isDefaultEnvironment = environment == EnvironmentsModel.sandbox();

    Get.dialog(
      EnvironmentsDeleteAlertDialog(
        isCurrentEnvironment: isCurrentEnvironment,
        isDefaultEnvironment: isDefaultEnvironment,
        onConfirm: () => isCurrentEnvironment
            ? _didTapDeleteCurrentEnvironment(environment)
            : _didTapDeleteOtherEnvironment(environment),
      ),
    );
  }

  void _setupEnvironmentsObserver() {
    _subscription = _environmentsRepository.watchEnvironments().listen((e) => _environments(e));
  }

  void _didTapDeleteCurrentEnvironment(EnvironmentsModel environment) {
    _environmentsRepository.deleteEnvironment(environment);
    didTapUse(EnvironmentsModel.sandbox());
  }

  void _didTapDeleteOtherEnvironment(EnvironmentsModel environment) {
    _environmentsRepository.deleteEnvironment(environment);
  }
}
