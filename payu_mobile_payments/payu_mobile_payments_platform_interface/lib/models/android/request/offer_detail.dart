class OfferDetail {
  final String redemptionCode;
  final String description;

  const OfferDetail({
    required this.redemptionCode,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'redemptionCode': redemptionCode,
      'description': description,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
