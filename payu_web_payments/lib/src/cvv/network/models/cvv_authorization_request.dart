import 'cvv_authorization_data.dart';

class CVVAuthorizationRequest {
  final String request = 'auth.cvv';
  final CVVAuthorizationData data;

  const CVVAuthorizationRequest({
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'request': request,
      'data': data,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
