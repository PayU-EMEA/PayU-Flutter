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
      iframeAllowed: json['iframeAllowed'] as bool?,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$OrderCreateResponseToJson(
        OrderCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'redirectUri': instance.redirectUri,
      'iframeAllowed': instance.iframeAllowed,
      'orderId': instance.orderId,
    };
