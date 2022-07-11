// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestResponse _$RequestResponseFromJson(Map<String, dynamic> json) =>
    RequestResponse(
      error: json['error'] as String?,
      errorDescription: json['error_description'] as String?,
    );

Map<String, dynamic> _$RequestResponseToJson(RequestResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
