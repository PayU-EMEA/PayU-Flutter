enum SettingsModelType { currency, environment }

class SettingsModel {
  final String title;
  final String? subtitle;
  final SettingsModelType type;

  const SettingsModel._(this.title, this.subtitle, this.type);

  factory SettingsModel.currency() => const SettingsModel._('Currency', null, SettingsModelType.currency);
  factory SettingsModel.environment() => const SettingsModel._('Environment', null, SettingsModelType.environment);

  SettingsModel copyWith({String? subtitle}) => SettingsModel._(title, subtitle ?? this.subtitle, type);
}
