import 'package:json_annotation/json_annotation.dart';

import 'order_create_status.dart';

part 'order_create_response.g.dart';

@JsonSerializable()
class OrderCreateResponse {
  final OrderCreateStatus status;
  final String? redirectUri;
  final String orderId;

  const OrderCreateResponse({
    required this.status,
    required this.redirectUri,
    required this.orderId,
  });

  factory OrderCreateResponse.fromJson(Map<String, dynamic> json) => _$OrderCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCreateResponseToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
