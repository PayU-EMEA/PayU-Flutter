// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResponse _$AuthorizationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorizationResponse(
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$AuthorizationResponseToJson(
        AuthorizationResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
    };
