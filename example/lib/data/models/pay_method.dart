import 'package:json_annotation/json_annotation.dart';

import 'pay_method_type.dart';

part 'pay_method.g.dart';

@JsonSerializable()
class PayMethod {
  final PayMethodType type;
  final String? value;
  final String? authorizationCode;
  final String? installmentsProvider;
  final int? installmentsNumber;

  const PayMethod({
    required this.type,
    this.value,
    this.authorizationCode,
    this.installmentsProvider,
    this.installmentsNumber,
  });

  factory PayMethod.fromJson(Map<String, dynamic> json) => _$PayMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PayMethodToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
