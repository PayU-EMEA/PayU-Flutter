import 'package:hive/hive.dart';

import 'package:example/features/environments/environments_model.dart';

class EnvironmentsDb {
  static const tag = 'EnvironmentsDb';

  final Box _box;

  EnvironmentsDb(this._box);

  Stream<List<EnvironmentsModel>> watchEnvironments() {
    return _box.watch().map((e) => getEnvironments());
  }

  List<EnvironmentsModel> getEnvironments() {
    return List<EnvironmentsModel>.from(_box.values);
  }

  Future<void> putEnvironment(EnvironmentsModel value) async {
    await _box.put(value.clientId, value);
  }

  Future<void> deleteEnvironment(EnvironmentsModel value) async {
    await _box.delete(value.clientId);
  }
}
