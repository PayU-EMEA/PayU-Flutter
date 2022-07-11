import 'network_client_status_code.dart';

class NetworkClientStatus {
  final NetworkClientStatusCode statusCode;
  final String codeLiteral;
  final String code;

  const NetworkClientStatus({
    required this.statusCode,
    required this.codeLiteral,
    required this.code,
  });

  factory NetworkClientStatus.fromJson(Map<String, dynamic> json) {
    return NetworkClientStatus(
      statusCode: NetworkClientStatusCodeFromExt.fromValue(json['statusCode']),
      codeLiteral: json['codeLiteral'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode.value,
      'codeLiteral': codeLiteral,
      'code': code,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
