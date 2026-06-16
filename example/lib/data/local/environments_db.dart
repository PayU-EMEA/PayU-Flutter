import 'dart:async';
import 'dart:convert';

import 'package:example/data/models/environment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnvironmentsDb {
  static const tag = 'EnvironmentsDb';
  static const _key = 'environments';

  final SharedPreferences _prefs;
  final _controller = StreamController<List<EnvironmentModel>>.broadcast();

  EnvironmentsDb(this._prefs);

  Stream<List<EnvironmentModel>> watchEnvironments() => _controller.stream;

  List<EnvironmentModel> getEnvironments() {
    final raw = _prefs.getString(_key);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => EnvironmentModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> putEnvironment(EnvironmentModel value) async {
    final environments = getEnvironments();
    final index = environments.indexWhere((e) => e.clientId == value.clientId);
    if (index >= 0) {
      environments[index] = value;
    } else {
      environments.add(value);
    }
    await _save(environments);
  }

  Future<void> deleteEnvironment(EnvironmentModel value) async {
    final environments = getEnvironments()..removeWhere((e) => e.clientId == value.clientId);
    await _save(environments);
  }

  Future<void> _save(List<EnvironmentModel> environments) async {
    await _prefs.setString(_key, jsonEncode(environments.map((e) => e.toJson()).toList()));
    _controller.add(environments);
  }
}
