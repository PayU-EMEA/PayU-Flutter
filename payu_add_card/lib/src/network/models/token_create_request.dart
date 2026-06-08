import 'token_create_request_data_card.dart';
import 'token_type.dart';

class TokenCreateRequest {
  final String posId;
  final TokenType type;
  final TokenCreateRequestDataCard card;

  const TokenCreateRequest({
    required this.posId,
    required bool save,
    required this.card,
  }) : type = save ? TokenType.multi : TokenType.singleLongterm;

  Map<String, dynamic> toJson() {
    return {
      'posId': posId,
      'type': type.value,
      'card': card,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
