import 'package:payu_core/payu_core.dart';

import '../interface/payu_interface_translations.dart';

extension Plurals on String {
  static String plural({
    required int value,
    required String zero,
    required String one,
    required String two,
    required String few,
    required String many,
  }) {
    return Payu.plural(
      value: value,
      zero: zero,
      one: one,
      two: two,
      few: few,
      many: many,
    );
  }
}
