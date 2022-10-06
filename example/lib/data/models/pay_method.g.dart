// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayMethod _$PayMethodFromJson(Map<String, dynamic> json) => PayMethod(
      type: $enumDecode(_$PayMethodTypeEnumMap, json['type']),
      value: json['value'] as String?,
      authorizationCode: json['authorizationCode'] as String?,
    );

Map<String, dynamic> _$PayMethodToJson(PayMethod instance) => <String, dynamic>{
      'type': _$PayMethodTypeEnumMap[instance.type]!,
      'value': instance.value,
      'authorizationCode': instance.authorizationCode,
    };

const _$PayMethodTypeEnumMap = {
  PayMethodType.blik: 'BLIK',
  PayMethodType.blikToken: 'BLIK_TOKEN',
  PayMethodType.cardToken: 'CARD_TOKEN',
  PayMethodType.installmenst: 'INSTALLMENTS',
  PayMethodType.pbl: 'PBL',
};
