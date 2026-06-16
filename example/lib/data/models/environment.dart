import 'package:json_annotation/json_annotation.dart';
import 'package:payu/payu.dart' as payu;

enum Environment {
  @JsonValue('production')
  production,

  @JsonValue('sandbox')
  sandbox,

  @JsonValue('sandboxBeta')
  sandboxBeta,
}

extension EnvironmentExt on Environment {
  static Environment fromPayu(Environment environment) {
    return Environment.values.firstWhere((e) => e.name == environment.name);
  }

  payu.Environment toPayu() {
    return payu.Environment.values.firstWhere((e) => e.name == name);
  }
}
