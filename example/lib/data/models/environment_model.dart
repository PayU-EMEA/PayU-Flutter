import 'package:equatable/equatable.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'environment_model.g.dart';

@JsonSerializable()
class EnvironmentModel extends Equatable {
  static const sandboxClientId = '300746';
  static const sandboxClientSecret = '2ee86a66e5d97e3fadc400c9f19b065d';

  final GrantType grantType;
  final Environment environment;
  final String clientId;
  final String clientSecret;
  final String name;

  const EnvironmentModel({
    required this.grantType,
    required this.environment,
    required this.clientId,
    required this.clientSecret,
    required this.name,
  });

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) => _$EnvironmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$EnvironmentModelToJson(this);

  factory EnvironmentModel.sandbox() {
    return const EnvironmentModel(
      grantType: GrantType.trustedMerchant,
      environment: Environment.sandbox,
      clientId: sandboxClientId,
      clientSecret: sandboxClientSecret,
      name: 'Sandbox',
    );
  }

  @override
  List<Object?> get props => [clientId, clientSecret];
}
