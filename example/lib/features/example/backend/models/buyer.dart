import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/data/repositories/backend_constants.dart';

part 'buyer.g.dart';

@JsonSerializable()
class Buyer {
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String language;
  final String extCustomerId;

  const Buyer({
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.language,
    required this.extCustomerId,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);

  factory Buyer.mock() {
    return const Buyer(
      email: BackendConstants.buyerEmail,
      phone: BackendConstants.buyerPhone,
      firstName: BackendConstants.buyerFirstName,
      lastName: BackendConstants.buyerLastName,
      language: BackendConstants.buyerLanguage,
      extCustomerId: BackendConstants.buyerExtCustomerId,
    );
  }

  Map<String, dynamic> toJson() => _$BuyerToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
