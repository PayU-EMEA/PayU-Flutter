import 'package:get/state_manager.dart';

import 'package:example/data/models/order_create_response.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/product.dart';

class ExampleCoreController {
  List<Product> get products => _products;
  PayMethod? get method => _method();
  OrderCreateResponse? get orderCreateResponse => _orderCreateResponse();

  final _products = <Product>[].obs;
  final _method = Rxn<PayMethod>();
  final _orderCreateResponse = Rxn<OrderCreateResponse>();

  void setProducts(List<Product> products) => _products(products);
  void setMethod(PayMethod payMethod) => _method(payMethod);
  void setResponse(OrderCreateResponse orderCreateResponse) => _orderCreateResponse(orderCreateResponse);
}
