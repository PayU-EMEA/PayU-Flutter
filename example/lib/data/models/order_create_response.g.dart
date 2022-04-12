// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreateResponse _$OrderCreateResponseFromJson(Map<String, dynamic> json) =>
    OrderCreateResponse(
      status:
          OrderCreateStatus.fromJson(json['status'] as Map<String, dynamic>),
      redirectUri: json['redirectUri'] as String?,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$OrderCreateResponseToJson(
        OrderCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'redirectUri': instance.redirectUri,
      'orderId': instance.orderId,
    };
