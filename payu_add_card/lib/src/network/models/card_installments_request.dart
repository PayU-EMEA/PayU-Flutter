class CardInstallmentsRequest {
  final String cardBin;
  final String internalPosId;

  const CardInstallmentsRequest({
    required this.cardBin,
    required this.internalPosId,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardBin': cardBin,
      'internalPosId': internalPosId,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}

