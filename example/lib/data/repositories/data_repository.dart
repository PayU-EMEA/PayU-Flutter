import 'package:example/data/models/order_create_response.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/payment_methods_response.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/backend/data/repositories/backend_repository.dart';

class DataRepository {
  final BackendRepository _repository;

  DataRepository(this._repository);

  Future<OrderCreateResponse> createOrder(PayMethod payMethod, List<Product> products) {
    return _repository.createOrder(payMethod, products);
  }

  Future<PaymentMethodsResponse> getPaymentMethods() {
    return _repository.getPaymentMethods();
  }
}
