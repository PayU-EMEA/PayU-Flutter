import 'package:json_annotation/json_annotation.dart';

part 'request_response.g.dart';

@JsonSerializable()
class RequestResponse {
  final String? error;

  @JsonKey(name: 'error_description')
  final String? errorDescription;

  const RequestResponse({
    this.error,
    this.errorDescription,
  });

  factory RequestResponse.fromJson(Map<String, dynamic> json) => _$RequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestResponseToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
