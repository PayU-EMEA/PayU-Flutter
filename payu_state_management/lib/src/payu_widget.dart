import 'package:flutter/material.dart';
import 'package:payu_interface/payu_interface.dart';
import 'package:payu_ui/payu_ui.dart';
import 'package:provider/provider.dart';

import 'payu_assembler.dart';
import 'payu_controller.dart';

class PayuWidget<T extends PayuController, E extends PayuAssembler> extends StatefulWidget {
  final E Function() assembler;
  final Widget Function(BuildContext context, T controller) builder;

  const PayuWidget({Key? key, required this.assembler, required this.builder}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PayuWidgetState createState() => _PayuWidgetState<T, E>();
}

class _PayuWidgetState<T extends PayuController, E extends PayuAssembler> extends State<PayuWidget<T, E>> {
  late final assembler = widget.assembler()..assemble();
  late final T controller = assembler.find<T>();

  @override
  void initState() {
    controller.onInit();
    super.initState();
  }

  @override
  void dispose() {
    assembler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Payu.theme,
      child: ChangeNotifierProvider<T>(
        create: (context) => controller,
        builder: (context, widget) => Consumer<T>(
          builder: (context, controller, child) => this.widget.builder(context, controller),
        ),
      ),
    );
  }
}
