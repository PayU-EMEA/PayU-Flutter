import 'package:json_annotation/json_annotation.dart';

import 'order_create_status_code.dart';

part 'order_create_status.g.dart';

@JsonSerializable()
class OrderCreateStatus {
  final OrderCreateStatusCode statusCode;

  const OrderCreateStatus({
    required this.statusCode,
  });

  factory OrderCreateStatus.fromJson(Map<String, dynamic> json) => _$OrderCreateStatusFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCreateStatusToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
