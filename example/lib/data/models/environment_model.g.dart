// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentModel _$EnvironmentModelFromJson(Map<String, dynamic> json) =>
    EnvironmentModel(
      grantType: $enumDecode(_$GrantTypeEnumMap, json['grantType']),
      environment: $enumDecode(_$EnvironmentEnumMap, json['environment']),
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$EnvironmentModelToJson(EnvironmentModel instance) =>
    <String, dynamic>{
      'grantType': _$GrantTypeEnumMap[instance.grantType]!,
      'environment': _$EnvironmentEnumMap[instance.environment]!,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'name': instance.name,
    };

const _$GrantTypeEnumMap = {
  GrantType.clientCredentials: 'client_credentials',
  GrantType.trustedMerchant: 'trusted_merchant',
};

const _$EnvironmentEnumMap = {
  Environment.production: 'production',
  Environment.sandbox: 'sandbox',
  Environment.sandboxBeta: 'sandboxBeta',
};
