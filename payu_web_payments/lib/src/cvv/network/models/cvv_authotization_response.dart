import 'package:payu_api/payu_api.dart';

class CVVAuthorizationResponse {
  final NetworkClientStatus status;

  const CVVAuthorizationResponse({
    required this.status,
  });

  factory CVVAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return CVVAuthorizationResponse(
      status: NetworkClientStatus.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
