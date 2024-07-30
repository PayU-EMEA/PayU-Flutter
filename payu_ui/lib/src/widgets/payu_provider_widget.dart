import 'package:flutter/material.dart';
import 'package:payu_interface/payu_interface.dart';
import 'package:provider/provider.dart';

import '../interface/payu_interface_theme.dart';

class PayuProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T controller) builder;

  const PayuProviderWidget({super.key, required this.create, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: ChangeNotifierProvider<T>(
        create: (context) => create(context),
        builder: (context, widget) => Consumer<T>(
          builder: (context, controller, child) => builder(context, controller),
        ),
      ),
    );
  }
}
