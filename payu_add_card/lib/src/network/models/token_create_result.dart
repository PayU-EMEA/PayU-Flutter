class TokenCreateResult {
  final String token;
  final String mask;

  const TokenCreateResult({
    required this.token,
    required this.mask,
  });

  factory TokenCreateResult.fromJson(Map<String, dynamic> json) {
    return TokenCreateResult(
      token: json['value'],
      mask: json['maskedCard'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'mask': mask,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
