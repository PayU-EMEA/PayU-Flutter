// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationBody _$AuthorizationBodyFromJson(Map<String, dynamic> json) =>
    AuthorizationBody(
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      grantType: json['grant_type'] as String,
      email: json['email'] as String,
      extCustomerId: json['ext_customer_id'] as String,
    );

Map<String, dynamic> _$AuthorizationBodyToJson(AuthorizationBody instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'grant_type': instance.grantType,
      'email': instance.email,
      'ext_customer_id': instance.extCustomerId,
    };
