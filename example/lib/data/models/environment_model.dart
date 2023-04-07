import 'package:equatable/equatable.dart';
import 'package:example/core/database_type_id.dart';
import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:hive/hive.dart';

part 'environment_model.g.dart';

@HiveType(typeId: DatabaseTypeId.environmentModel)
class EnvironmentModel extends Equatable {
  static const sandboxClientId = '300746';
  static const sandboxClientSecret = '2ee86a66e5d97e3fadc400c9f19b065d';

  @HiveField(0)
  final GrantType grantType;

  @HiveField(1)
  final Environment environment;

  @HiveField(2)
  final String clientId;

  @HiveField(3)
  final String clientSecret;

  @HiveField(4)
  final String name;

  const EnvironmentModel({
    required this.grantType,
    required this.environment,
    required this.clientId,
    required this.clientSecret,
    required this.name,
  });

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
