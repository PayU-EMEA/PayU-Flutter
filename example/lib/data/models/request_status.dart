import 'package:json_annotation/json_annotation.dart';

part 'request_status.g.dart';

@JsonSerializable()
class RequestStatus {
  final String statusCode;
  final String? statusDesc;

  const RequestStatus({
    required this.statusCode,
    this.statusDesc,
  });

  factory RequestStatus.fromJson(Map<String, dynamic> json) => _$RequestStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RequestStatusToJson(this);

  @override
  String toString() => '$statusCode ($statusDesc)';
}
