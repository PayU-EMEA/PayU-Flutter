import 'package:payu_api/payu_api.dart';

import 'token_create_result.dart';

class TokenCreateResponse {
  final NetworkClientStatus status;
  final TokenCreateResult? data;

  const TokenCreateResponse({
    required this.status,
    this.data,
  });

  factory TokenCreateResponse.fromJson(Map<String, dynamic> json) {
    return TokenCreateResponse(
      status: NetworkClientStatus.fromJson(json['status']),
      data: json['data'] == null ? null : TokenCreateResult.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
