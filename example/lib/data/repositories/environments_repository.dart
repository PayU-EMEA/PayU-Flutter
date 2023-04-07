import 'package:collection/collection.dart';
import 'package:example/data/local/environments_db.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/models/environment_model.dart';
import 'package:example/features/example/backend/data/local/setting_db.dart';
import 'package:payu/payu.dart';

class EnvironmentsRepository {
  final EnvironmentsDb _environmentDb;
  final SettingsDb _settingsDb;

  EnvironmentsRepository(this._environmentDb, this._settingsDb);

  Stream<List<EnvironmentModel>> watchEnvironments() {
    return _environmentDb.watchEnvironments();
  }

  List<EnvironmentModel> getEnvironments() {
    return _environmentDb.getEnvironments();
  }

  EnvironmentModel? currentEnvironment() {
    return getEnvironments().firstWhereOrNull((e) => e.clientId == _settingsDb.clientId);
  }

  bool containsEnvironment(EnvironmentModel value) {
    return getEnvironments().contains(value);
  }

  Future<void> putEnvironment(EnvironmentModel value) async {
    await _environmentDb.putEnvironment(value);
  }

  Future<void> setEnvironment(EnvironmentModel value) async {
    await _environmentDb.putEnvironment(value);

    _settingsDb.setEnvironment(value.environment);
    _settingsDb.setGrantType(value.grantType);
    _settingsDb.setClientId(value.clientId);
    _settingsDb.setClientSecret(value.clientSecret);

    Payu.pos = POS(id: value.clientId);
    Payu.environment = value.environment.toPayu();
  }

  Future<void> deleteEnvironment(EnvironmentModel value) async {
    await _environmentDb.deleteEnvironment(value);
  }
}
