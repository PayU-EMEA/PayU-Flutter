import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:payu_add_card/src/helpers/card_data_formatter.dart';

void main() {
  late TextEditingValue empty;

  late CardDataFormatter cvvFormatter;
  late CardDataFormatter dateFormatter;
  late CardDataFormatter numberFormatter;

  TextEditingValue value(String text) {
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }

  setUp(() {
    empty = TextEditingValue.empty;

    cvvFormatter = CardDataFormatter.cvv();
    dateFormatter = CardDataFormatter.date();
    numberFormatter = CardDataFormatter.number();
  });

  group('CardDataFormatter', () {
    test('`cvv` formatter should format correctly', () {
      expect(cvvFormatter.formatEditUpdate(empty, value('123')), value('123'));
      expect(cvvFormatter.formatEditUpdate(empty, value('1234')), value('123'));
    });

    test('`date` formatter should format correctly', () {
      expect(dateFormatter.formatEditUpdate(empty, value('0924')), value('09/24'));
      expect(dateFormatter.formatEditUpdate(empty, value('112025')), value('11/2025'));
    });

    test('`number` formatter should format correctly', () {
      expect(numberFormatter.formatEditUpdate(empty, value('4444333322221111')), value('4444 3333 2222 1111'));
      expect(numberFormatter.formatEditUpdate(empty, value('44443333222211110000')), value('4444 3333 2222 1111'));
      expect(numberFormatter.formatEditUpdate(empty, value('44443333')), value('4444 3333'));
    });
  });
}
