import 'package:json_annotation/json_annotation.dart';

import 'package:example/features/example/backend/data/repositories/backend_constants.dart';

part 'delivery.g.dart';

@JsonSerializable()
class Delivery {
  final String recipientName;
  final String recipientEmail;
  final String recipientPhone;
  final String addressId;
  final String street;
  final String postalBox;
  final String postalCode;
  final String city;
  final String state;
  final String countryCode;
  final String name;

  const Delivery({
    required this.recipientName,
    required this.recipientEmail,
    required this.recipientPhone,
    required this.addressId,
    required this.street,
    required this.postalBox,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.countryCode,
    required this.name,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => _$DeliveryFromJson(json);

  factory Delivery.mock() {
    return const Delivery(
      recipientName: BackendConstants.deliveryRecipientName,
      recipientEmail: BackendConstants.deliveryRecipientEmail,
      recipientPhone: BackendConstants.deliveryRecipientPhone,
      addressId: BackendConstants.deliveryAddressId,
      street: BackendConstants.deliveryStreet,
      postalBox: BackendConstants.deliveryPostalBox,
      postalCode: BackendConstants.deliveryPostalCode,
      city: BackendConstants.deliveryCity,
      state: BackendConstants.deliveryState,
      countryCode: BackendConstants.deliveryCountryCode,
      name: BackendConstants.deliveryName,
    );
  }

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';
}
