import 'package:example/data/local/environments_db.dart';
import 'package:example/features/environments/environments_model.dart';

class EnvironmentsRepository {
  final EnvironmentsDb _db;

  EnvironmentsRepository(this._db);

  Stream<List<EnvironmentsModel>> watchEnvironments() {
    return _db.watchEnvironments();
  }

  List<EnvironmentsModel> getEnvironments() {
    return _db.getEnvironments();
  }

  bool containsEnvironment(EnvironmentsModel value) {
    return getEnvironments().contains(value);
  }

  Future<void> putEnvironment(EnvironmentsModel value) async {
    await _db.putEnvironment(value);
  }

  Future<void> deleteEnvironment(EnvironmentsModel value) async {
    await _db.deleteEnvironment(value);
  }
}
