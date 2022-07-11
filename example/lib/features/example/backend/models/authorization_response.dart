import 'package:json_annotation/json_annotation.dart';

part 'authorization_response.g.dart';

@JsonSerializable()
class AuthorizationResponse {
  @JsonKey(name: 'access_token')
  final String accessToken;

  AuthorizationResponse({
    required this.accessToken,
  });

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) => _$AuthorizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResponseToJson(this);
}
