import 'token_create_request_data.dart';

class TokenCreateRequest {
  final String request = 'TokenCreateRequest';
  final String sender;
  final TokenCreateRequestData data;

  const TokenCreateRequest({
    required this.sender,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'request': request,
      'sender': sender,
      'data': data,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
