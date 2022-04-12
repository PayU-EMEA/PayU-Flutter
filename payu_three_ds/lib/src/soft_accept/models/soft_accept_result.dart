import 'soft_accept_message.dart';

class SoftAcceptResult {
  final SoftAcceptMessage message;

  const SoftAcceptResult({
    required this.message,
  });

  factory SoftAcceptResult.fromJson(Map<String, dynamic> json) {
    return SoftAcceptResult(
      message: SoftAcceptMessageFromExt.fromValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message.value,
    };
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
