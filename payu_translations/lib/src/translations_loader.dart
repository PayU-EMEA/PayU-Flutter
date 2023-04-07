import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:payu_core/payu_core.dart';

class TranslationsLoader {
  Future<Map<String, String>> load({
    required String languageCode,
    String? fallbackLanguageCode,
  }) async {
    try {
      final path = 'packages/payu_translations/assets/lang/$languageCode.json';
      final source = await rootBundle.loadString(path);
      return Map<String, String>.from(jsonDecode(source));
    } catch (e) {
      Logger.logError(e.toString());
      if (fallbackLanguageCode != null) {
        return load(
          languageCode: fallbackLanguageCode,
          fallbackLanguageCode: fallbackLanguageCode,
        );
      } else {
        rethrow;
      }
    }
  }
}
