import 'package:collection/collection.dart';
import 'package:get/get.dart';

import 'package:example/core/routes.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/core/example_core_controller.dart';

class ExampleProductsController extends GetxController {
  final ExampleCoreController _controller;

  final selected = <Product>[].obs;
  final products = [Product.futomaki(), Product.napkin(), Product.set30pcs()];

  int amount() => selected.map((e) => e.unitPrice * e.quantity).sum;
  int quantity(Product product) => selected.firstWhereOrNull((e) => e.id == product.id)?.quantity ?? 0;

  ExampleProductsController(this._controller);

  void didTapCheckout() {
    if (selected.isNotEmpty) {
      _controller.setProducts(selected);
      Get.toNamed(Routes.exampleMethod);
    }
  }

  void didTapDecreaseQuantity(Product product) {
    final existing = selected.firstWhereOrNull((e) => e.id == product.id);

    if (existing == null) {
      return;
    } else if (existing.quantity == 1) {
      selected.remove(existing);
    } else {
      selected.remove(existing);
      selected.add(
        existing.copyWith(
          quantity: existing.quantity - 1,
        ),
      );
    }
  }

  void didTapIncreateQuantity(Product product) {
    final existing = selected.firstWhereOrNull((e) => e.id == product.id);

    if (existing == null) {
      selected.add(
        product.copyWith(
          quantity: 1,
        ),
      );
    } else {
      selected.remove(existing);
      selected.add(
        existing.copyWith(
          quantity: existing.quantity + 1,
        ),
      );
    }
  }
}
