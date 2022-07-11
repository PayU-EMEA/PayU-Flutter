class TokenCreateResult {
  final String token;
  final String mask;
  final String type;

  const TokenCreateResult({
    required this.token,
    required this.mask,
    required this.type,
  });

  factory TokenCreateResult.fromJson(Map<String, dynamic> json) {
    return TokenCreateResult(
      token: json['token'],
      mask: json['mask'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'mask': mask,
      'type': type,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
