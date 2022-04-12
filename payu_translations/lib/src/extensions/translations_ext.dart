import 'package:payu_core/payu_core.dart';

import '../interface/payu_interface_translations.dart';

extension Translations on String {
  String translated({List<String>? args}) {
    return Payu.translated(this, args: args);
  }
}
