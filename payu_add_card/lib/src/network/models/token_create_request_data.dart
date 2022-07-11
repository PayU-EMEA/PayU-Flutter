import 'token_create_request_data_card.dart';

class TokenCreateRequestData {
  final bool agreement;
  final TokenCreateRequestDataCard card;

  const TokenCreateRequestData({
    required this.agreement,
    required this.card,
  });

  Map<String, dynamic> toJson() {
    return {
      'agreement': agreement,
      'card': card,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
