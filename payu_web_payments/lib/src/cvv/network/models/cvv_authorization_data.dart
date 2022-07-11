class CVVAuthorizationData {
  final String refReqId;
  final String cvv;

  const CVVAuthorizationData({
    required this.refReqId,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'refReqId': refReqId,
      'cvv': cvv,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
