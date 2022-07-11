// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Buyer _$BuyerFromJson(Map<String, dynamic> json) => Buyer(
      email: json['email'] as String,
      phone: json['phone'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      language: json['language'] as String,
      extCustomerId: json['extCustomerId'] as String,
    );

Map<String, dynamic> _$BuyerToJson(Buyer instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'language': instance.language,
      'extCustomerId': instance.extCustomerId,
    };
