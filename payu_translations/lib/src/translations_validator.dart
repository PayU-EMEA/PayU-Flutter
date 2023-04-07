import 'package:payu_core/payu_core.dart';
import 'package:payu_translations/src/translations_loader.dart';

class TranslationsValidator {
  final _translationsLoader = TranslationsLoader();

  void validateTranslations({required List<String> supportedLanguagesCodes}) async {
    const enCode = 'en';
    final enTranslations = await _translationsLoader.load(languageCode: enCode);
    final enKeys = enTranslations.keys;

    for (final key in enKeys) {
      Logger.logInfo('\n');

      for (final languageCode in supportedLanguagesCodes) {
        final languageTranslations = await _translationsLoader.load(languageCode: languageCode);
        final languageTranslation = languageTranslations[key];
        final enTranslation = enTranslations[key];

        languageCode == enCode
            ? Logger.logInfo('[$languageCode] $key: $languageTranslation')
            : enTranslation == languageTranslation
                ? Logger.logError('[$languageCode] $key: $languageTranslation')
                : Logger.logInfo('[$languageCode] $key: $languageTranslation');
      }
    }
  }
}
