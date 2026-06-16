import 'package:payu_translations/payu_translations.dart';

abstract class InstallmentsLabel {
  static String build(int value) {
    return Plurals.plural(
      value: value,
      zero: 'installments_many',
      one: 'installments_one',
      two: 'installments_two',
      few: 'installments_few',
      many: 'installments_many',
    ).translated(args: [value.toString()]);
  }
}

