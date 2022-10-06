import 'package:example/data/models/product.dart';
import 'package:example/features/example/features/products/example_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleProductsPage extends GetView<ExampleProductsController> {
  const ExampleProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('ExampleProductsPage'),
        ),
        floatingActionButton: TextButton(
          onPressed: () => controller.didTapCheckout(),
          child: Text('Pay: ${controller.amount() / 100}'),
        ),
        body: ListView.separated(
          itemCount: controller.products.length,
          itemBuilder: (context, index) => _ProductListTile(
            product: controller.products[index],
            controller: controller,
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class _ProductListTile extends StatelessWidget {
  final Product product;
  final ExampleProductsController controller;

  const _ProductListTile({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('Price: ${product.unitPrice / 100}'),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          TextButton(
            onPressed: () => controller.didTapDecreaseQuantity(product),
            child: const Text('-'),
          ),
          Text(controller.quantity(product).toString()),
          TextButton(
            onPressed: () => controller.didTapIncreateQuantity(product),
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
