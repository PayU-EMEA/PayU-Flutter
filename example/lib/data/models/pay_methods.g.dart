// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_methods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayMethods _$PayMethodsFromJson(Map<String, dynamic> json) => PayMethods(
      payMethod: PayMethod.fromJson(json['payMethod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayMethodsToJson(PayMethods instance) =>
    <String, dynamic>{
      'payMethod': instance.payMethod,
    };
