import 'package:example/data/models/environment_model.dart';
import 'package:hive/hive.dart';

class EnvironmentsDb {
  static const tag = 'EnvironmentsDb';

  final Box _box;

  EnvironmentsDb(this._box);

  Stream<List<EnvironmentModel>> watchEnvironments() {
    return _box.watch().map((e) => getEnvironments());
  }

  List<EnvironmentModel> getEnvironments() {
    return List<EnvironmentModel>.from(_box.values);
  }

  Future<void> putEnvironment(EnvironmentModel value) async {
    await _box.put(value.clientId, value);
  }

  Future<void> deleteEnvironment(EnvironmentModel value) async {
    await _box.delete(value.clientId);
  }
}
