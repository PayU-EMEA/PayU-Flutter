import 'package:json_annotation/json_annotation.dart';

import 'pay_method.dart';

part 'pay_methods.g.dart';

@JsonSerializable()
class PayMethods {
  final PayMethod payMethod;

  const PayMethods({
    required this.payMethod,
  });

  factory PayMethods.fromJson(Map<String, dynamic> json) => _$PayMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$PayMethodsToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
