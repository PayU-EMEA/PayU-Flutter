// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreateStatus _$OrderCreateStatusFromJson(Map<String, dynamic> json) =>
    OrderCreateStatus(
      statusCode:
          $enumDecode(_$OrderCreateStatusCodeEnumMap, json['statusCode']),
    );

Map<String, dynamic> _$OrderCreateStatusToJson(OrderCreateStatus instance) =>
    <String, dynamic>{
      'statusCode': _$OrderCreateStatusCodeEnumMap[instance.statusCode],
    };

const _$OrderCreateStatusCodeEnumMap = {
  OrderCreateStatusCode.success: 'SUCCESS',
  OrderCreateStatusCode.warningContinueRedirect: 'WARNING_CONTINUE_REDIRECT',
  OrderCreateStatusCode.warningContinue3DS: 'WARNING_CONTINUE_3DS',
  OrderCreateStatusCode.warningContinueCVV: 'WARNING_CONTINUE_CVV',
};
