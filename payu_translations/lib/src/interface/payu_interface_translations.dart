import 'dart:io' show Platform;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:payu_core/payu_core.dart';

import '../translations_loader.dart';

extension PayuInterfaceTranslations on PayuInterface {
  static final _impl = _PayuInterfaceTranslationsImpl();

  String get defaultLanguageCode => _PayuInterfaceTranslationsImpl.defaultLanguageCode;

  List<String> get supportedLanguagesCodes => _PayuInterfaceTranslationsImpl.supportedLanguagesCodes;

  Locale get locale => _impl.locale;

  /// [Locale] which is used for plugin texts.
  ///
  /// Available language codes:
  /// - `bg` (Bulgarian)
  /// - `cs` (Czech)
  /// - `de` (German)
  /// - `el` (Greek)
  /// - `en` (English)
  /// - `es` (Spanish)
  /// - `fr` (French)
  /// - `hr` (Croatian)
  /// - `hu` (Hungarian)
  /// - `it` (Italian)
  /// - `lv` (Latvian)
  /// - `pl` (Polish)
  /// - `ro` (Romanian)
  /// - `ru` (Russian)
  /// - `sl` (Slovenian)
  /// - `sk` (Slovak)
  /// - `uk` (Ukrainian)
  ///
  /// If provided languageCode is not available - default system Locale should be used.
  set locale(Locale? locale) => _impl.locale = locale;

  String translated(String key, {List<String>? args}) => _impl.translated(key, args: args);

  String plural({
    required int value,
    required String zero,
    required String one,
    required String two,
    required String few,
    required String many,
  }) =>
      _impl.plural(
        value: value,
        zero: zero,
        one: one,
        two: two,
        few: few,
        many: many,
      );
}

class _PayuInterfaceTranslationsImpl {
  static const defaultLanguageCode = 'pl';
  static const supportedLanguagesCodes = [
    'bg',
    'cs',
    'de',
    'el',
    'en',
    'es',
    'fr',
    'hr',
    'hu',
    'it',
    'lv',
    'pl',
    'ro',
    'ru',
    'sk',
    'sl',
    'uk'
  ];

  late Locale _locale = _platformLocale();

  final _defaultTranslations = <String, String>{};
  final _localeTranslations = <String, String>{};
  final _translationsLoader = TranslationsLoader();

  Locale get locale => _locale;

  set locale(Locale? locale) {
    _locale = locale ?? _platformLocale();
    _loadTranslations();
  }

  _PayuInterfaceTranslationsImpl() {
    _loadTranslations();
  }

  String translated(String key, {List<String>? args}) {
    if (!_localeTranslations.containsKey(key)) Logger.logError('`${_locale.languageCode}` / `$key` translation missed');
    var result = _localeTranslations[key] ?? key;
    args?.forEachIndexed((index, element) => result = result.replaceAll('{$index}', element));
    return result;
  }

  String plural({
    required int value,
    required String zero,
    required String one,
    required String two,
    required String few,
    required String many,
  }) {
    final number = value % 100;
    if (number == 0) return zero;
    if (number == 1) return one;
    if (number == 2) return two;
    if (number == 3) return few;
    if (number == 4) return few;
    return many;
  }

  Locale _platformLocale() {
    const languageCodeLength = 2;
    final languageCode = Platform.localeName.substring(0, languageCodeLength);
    return Locale(supportedLanguagesCodes.contains(languageCode) ? languageCode : defaultLanguageCode);
  }

  Future<void> _loadTranslations() async {
    await _loadDefaultTranslations();
    await _loadLocaleTranslations();
  }

  Future<void> _loadDefaultTranslations() async {
    _defaultTranslations.clear();
    _defaultTranslations.addAll(
      await _translationsLoader.load(
        languageCode: defaultLanguageCode,
      ),
    );
  }

  Future<void> _loadLocaleTranslations() async {
    _localeTranslations.clear();
    _localeTranslations.addAll(
      await _translationsLoader.load(
        languageCode: locale.languageCode,
        fallbackLanguageCode: defaultLanguageCode,
      ),
    );
  }
}
