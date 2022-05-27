class GooglePayOfferDetail {
  final String redemptionCode;
  final String description;

  const GooglePayOfferDetail({
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
