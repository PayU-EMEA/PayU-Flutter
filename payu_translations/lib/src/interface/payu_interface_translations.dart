import 'dart:io' show Platform;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:payu_core/payu_core.dart';

import '../translations_source.dart';

extension PayuInterfaceTranslations on PayuInterface {
  static final _impl = _PayuInterfaceTranslationsImpl();

  Locale get locale => _impl.locale;

  /// [Locale] which is used for plugin texts.
  ///
  /// Available language codes:
  /// - `cs` (Czech)
  /// - `de` (German)
  /// - `en` (English)
  /// - `hu` (Hungarian)
  /// - `pl` (Polish)
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
  static const _defaultLanguageCode = 'pl';

  late Locale _locale = _platformLocale();

  final _translations = <String, String>{};

  Locale get locale => _locale;

  set locale(Locale? locale) {
    _locale = locale ?? _platformLocale();
    _loadTranslations();
  }

  _PayuInterfaceTranslationsImpl() {
    _loadTranslations();
    // _validateTranslations();
  }

  String translated(String key, {List<String>? args}) {
    if (!_translations.containsKey(key)) Logger.logError('`${_locale.languageCode}` / `$key` translation missed');
    var result = _translations[key] ?? key;
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
    final supportedLanguages = translations.keys;
    return Locale(supportedLanguages.contains(languageCode) ? languageCode : _defaultLanguageCode);
  }

  void _loadTranslations() {
    final languageCode = translations.keys.contains(locale.languageCode) ? locale.languageCode : _defaultLanguageCode;
    final selectedTranslations = translations[languageCode] ?? translations[_defaultLanguageCode] ?? <String, String>{};

    _translations.clear();
    _translations.addAll(selectedTranslations);
  }
}
