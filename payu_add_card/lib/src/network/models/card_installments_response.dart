class CardInstallmentsResponse {
  final String provider;
  final List<int> numbers;
  final CardInstallmentsSettings? settings;

  const CardInstallmentsResponse({
    required this.provider,
    required this.numbers,
    this.settings,
  });

  factory CardInstallmentsResponse.fromJson(Map<String, dynamic> json) {
    return CardInstallmentsResponse(
      provider: json['provider'] as String,
      numbers: (json['numbers'] as List<dynamic>).map((e) => e as int).toList(),
      settings: json['settings'] != null
          ? CardInstallmentsSettings.fromJson(json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'numbers': numbers,
      'settings': settings,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}

class CardInstallmentsSettings {
  final num? minAmount;

  const CardInstallmentsSettings({
    this.minAmount,
  });

  factory CardInstallmentsSettings.fromJson(Map<String, dynamic> json) {
    return CardInstallmentsSettings(
      minAmount: json['minAmount'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minAmount': minAmount,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}

