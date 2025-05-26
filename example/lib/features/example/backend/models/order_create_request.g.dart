// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreateRequest _$OrderCreateRequestFromJson(Map<String, dynamic> json) =>
    OrderCreateRequest(
      continueUrl: json['continueUrl'] as String,
      notifyUrl: json['notifyUrl'] as String,
      customerIp: json['customerIp'] as String,
      merchantPosId: json['merchantPosId'] as String,
      description: json['description'] as String,
      currencyCode: json['currencyCode'] as String,
      totalAmount: (json['totalAmount'] as num).toInt(),
      buyer: Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      payMethods:
          PayMethods.fromJson(json['payMethods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderCreateRequestToJson(OrderCreateRequest instance) =>
    <String, dynamic>{
      'continueUrl': instance.continueUrl,
      'notifyUrl': instance.notifyUrl,
      'customerIp': instance.customerIp,
      'merchantPosId': instance.merchantPosId,
      'description': instance.description,
      'currencyCode': instance.currencyCode,
      'totalAmount': instance.totalAmount,
      'buyer': instance.buyer,
      'products': instance.products,
      'payMethods': instance.payMethods,
    };
