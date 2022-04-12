import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/data/repositories/backend_constants.dart';

part 'authorization_body.g.dart';

@JsonSerializable()
class AuthorizationBody {
  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'client_secret')
  final String clientSecret;

  @JsonKey(name: 'grant_type')
  final String grantType;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'ext_customer_id')
  final String extCustomerId;

  const AuthorizationBody({
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
    required this.email,
    required this.extCustomerId,
  });

  factory AuthorizationBody.fromJson(Map<String, dynamic> json) => _$AuthorizationBodyFromJson(json);

  factory AuthorizationBody.mock(String clientId, String clientSecret, String grantType) {
    return AuthorizationBody(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: grantType,
      email: BackendConstants.buyerEmail,
      extCustomerId: BackendConstants.buyerExtCustomerId,
    );
  }

  Map<String, dynamic> toJson() => _$AuthorizationBodyToJson(this);
}
