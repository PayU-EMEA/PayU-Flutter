import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

import 'package:example/features/example/features/test_cards/example_test_cards_controller.dart';

class ExampleTestCardsPage extends GetView<ExampleTestCardsController> {
  const ExampleTestCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleTestCardsPage'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => DataTable(
              columns: _mapDataToDataColumns(),
              rows: _mapDataToDataRows(onTap: (e) => controller.didSelect(e)),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _mapDataToDataColumns() {
    return [
      _makeDataColumn('Number'),
      _makeDataColumn('Date'),
      _makeDataColumn('CVV'),
      _makeDataColumn('3DS'),
      _makeDataColumn('Mastercard\ninstallments'),
      _makeDataColumn('Behavior'),
    ];
  }

  List<DataRow> _mapDataToDataRows({required Function(TestPaymentCard) onTap}) {
    return controller.cards.map((e) => _makeDataRow(model: e, onTap: () => onTap(e))).toList();
  }

  DataColumn _makeDataColumn(String label) {
    return DataColumn(label: Text(label));
  }

  DataRow _makeDataRow({required TestPaymentCard model, required VoidCallback onTap}) {
    return DataRow(
      cells: [
        _makeDataCell(value: model.number),
        _makeDataCell(value: '${model.expirationMonth} / ${model.expirationYear}'),
        _makeDataCell(value: model.cvv),
        _makeDataCell(value: model.is3DSecure),
        _makeDataCell(value: model.isMastercardInstallments),
        _makeDataCell(value: model.behavior),
      ],
      onSelectChanged: (value) => onTap(),
    );
  }

  DataCell _makeDataCell({required String value}) {
    return DataCell(Text(value));
  }
}
