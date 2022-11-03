enum SettingsModelType { currency, environment, language }

class SettingsModel {
  final String title;
  final String? subtitle;
  final SettingsModelType type;

  const SettingsModel._(this.title, this.subtitle, this.type);

  factory SettingsModel.currency() => const SettingsModel._('Currency', null, SettingsModelType.currency);
  factory SettingsModel.environment() => const SettingsModel._('Environment', null, SettingsModelType.environment);
  factory SettingsModel.language() => const SettingsModel._('Language', null, SettingsModelType.language);

  SettingsModel copyWith({String? subtitle}) => SettingsModel._(title, subtitle ?? this.subtitle, type);
}
