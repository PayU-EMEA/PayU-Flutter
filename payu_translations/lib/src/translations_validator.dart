import 'package:collection/collection.dart';
import 'package:payu_core/payu_core.dart';

import 'translations_source.dart';

class TranslationsValidator {
  void validatate() {
    final codes = _codes();
    final keys = _keys();

    for (final key in keys) {
      Logger.logInfo('\n');
      const enCode = 'en';
      for (final code in codes) {
        final enTranslation = translations[enCode]?[key];
        final codeTranslation = translations[code]?[key];
        code == enCode
            ? Logger.logInfo('[$code] $key: ${translations[code]?[key]}')
            : enTranslation == codeTranslation
                ? Logger.logError('[$code] $key: ${translations[code]?[key]}')
                : Logger.logInfo('[$code] $key: ${translations[code]?[key]}');
      }
    }
  }

  List<String> _codes() => translations.keys.toList();
  List<String> _keys() => translations.values.map((e) => e.keys).expand((e) => e).toSet().toList().sorted();
}
