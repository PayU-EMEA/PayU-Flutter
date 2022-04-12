// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodsResponse _$PaymentMethodsResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodsResponse(
      blikTokens: (json['blikTokens'] as List<dynamic>?)
          ?.map((e) => BlikToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardTokens: (json['cardTokens'] as List<dynamic>)
          .map((e) => CardToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      payByLinks: (json['payByLinks'] as List<dynamic>)
          .map((e) => PayByLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentMethodsResponseToJson(
        PaymentMethodsResponse instance) =>
    <String, dynamic>{
      'blikTokens': instance.blikTokens,
      'cardTokens': instance.cardTokens,
      'payByLinks': instance.payByLinks,
    };
