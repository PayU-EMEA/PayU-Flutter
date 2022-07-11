import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:payu/payu.dart' as payu;

import 'package:example/core/database_type_id.dart';

part 'environment.g.dart';

@HiveType(typeId: DatabaseTypeId.backendEnvironment)
enum Environment {
  @HiveField(0)
  @JsonValue('production')
  production,

  @HiveField(1)
  @JsonValue('sandbox')
  sandbox,
}

extension EnvironmentExt on Environment {
  static Environment fromPayu(Environment environment) {
    return Environment.values.firstWhere((e) => e.name == environment.name);
  }

  payu.Environment toPayu() {
    return payu.Environment.values.firstWhere((e) => e.name == name);
  }
}
