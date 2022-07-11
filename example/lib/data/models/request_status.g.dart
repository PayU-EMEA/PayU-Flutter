// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestStatus _$RequestStatusFromJson(Map<String, dynamic> json) =>
    RequestStatus(
      statusCode: json['statusCode'] as String,
      statusDesc: json['statusDesc'] as String?,
    );

Map<String, dynamic> _$RequestStatusToJson(RequestStatus instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusDesc': instance.statusDesc,
    };
