import 'package:example/data/models/environment_model.dart';
import 'package:example/data/repositories/environments_repository.dart';
import 'package:example/features/example/backend/data/repositories/settings_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EnvironmentsService extends GetxService {
  final EnvironmentsRepository _environmentsRepository;
  final SettingsRepository _settingsRepository;

  EnvironmentsService(
    this._environmentsRepository,
    this._settingsRepository,
  );

  Future<void> init() async {
    await _setupEnvironment();
  }

  Future<void> _setupEnvironment() async {
    if (_environmentsRepository.getEnvironments().isEmpty) {
      final sandbox = EnvironmentModel.sandbox();
      await _environmentsRepository.putEnvironment(sandbox);
      await _environmentsRepository.setEnvironment(sandbox);

      _settingsRepository.setEnvironment(sandbox.environment);
      _settingsRepository.setGrantType(sandbox.grantType);
      _settingsRepository.setClientId(sandbox.clientId);
      _settingsRepository.setClientSecret(sandbox.clientSecret);
    }
  }
}
