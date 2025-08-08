// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
      recipientName: json['recipientName'] as String,
      recipientEmail: json['recipientEmail'] as String,
      recipientPhone: json['recipientPhone'] as String,
      addressId: json['addressId'] as String,
      street: json['street'] as String,
      postalBox: json['postalBox'] as String,
      postalCode: json['postalCode'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      countryCode: json['countryCode'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
      'recipientName': instance.recipientName,
      'recipientEmail': instance.recipientEmail,
      'recipientPhone': instance.recipientPhone,
      'addressId': instance.addressId,
      'street': instance.street,
      'postalBox': instance.postalBox,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'state': instance.state,
      'countryCode': instance.countryCode,
      'name': instance.name,
    };
