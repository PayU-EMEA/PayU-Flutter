import 'package:collection/collection.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/pay_methods.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/backend/data/repositories/backend_constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'buyer.dart';

part 'order_create_request.g.dart';

@JsonSerializable()
class OrderCreateRequest {
  final String continueUrl;
  final String notifyUrl;
  final String customerIp;
  final String merchantPosId;
  final String description;
  final String currencyCode;
  final int totalAmount;
  final Buyer buyer;
  final List<Product> products;
  final PayMethods payMethods;

  const OrderCreateRequest({
    required this.continueUrl,
    required this.notifyUrl,
    required this.customerIp,
    required this.merchantPosId,
    required this.description,
    required this.currencyCode,
    required this.totalAmount,
    required this.buyer,
    required this.products,
    required this.payMethods,
  });

  factory OrderCreateRequest.fromJson(Map<String, dynamic> json) => _$OrderCreateRequestFromJson(json);

  factory OrderCreateRequest.mock({
    required String clientId,
    required String continueUrl,
    required String currencyCode,
    required PayMethod payMethod,
    required List<Product> products,
  }) {
    return OrderCreateRequest(
      continueUrl: continueUrl,
      notifyUrl: continueUrl,
      customerIp: BackendConstants.orderCustomerIp,
      merchantPosId: clientId,
      description: BackendConstants.orderDescription,
      currencyCode: currencyCode,
      totalAmount: products.map((e) => e.unitPrice * e.quantity).sum.toInt(),
      buyer: Buyer.mock(),
      products: products,
      payMethods: PayMethods(
        payMethod: payMethod,
      ),
    );
  }

  Map<String, dynamic> toJson() => _$OrderCreateRequestToJson(this);
}
