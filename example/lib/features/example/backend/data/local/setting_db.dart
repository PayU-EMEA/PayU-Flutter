import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:get/get.dart';
import 'package:payu/payu.dart' as payu;
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDb extends GetxService {
  static const tag = 'SettingsDb';

  static const _defaultCurrencies = ['CZK', 'PLN'];
  static final _defaultLanguages = payu.Payu.supportedLanguagesCodes;

  static const _defaultCurrencyCode = 'PLN';
  static final _defaultLanguageCode = payu.Payu.defaultLanguageCode;

  static const _accessToken = '_accessToken';
  static const _grantType = '_grantType';
  static const _clientId = '_clientId';
  static const _clientSecret = '_clientSecret';
  static const _environment = '_environment';
  static const _currencyCode = '_currencyCode';
  static const _languageCode = '_languageCode';
  static const _cardInstallments = '_cardInstallments';

  final SharedPreferences _prefs;

  SettingsDb(this._prefs);

  String? get accessToken => _prefs.getString(_accessToken);

  GrantType? get grantType {
    final value = _prefs.getString(_grantType);
    if (value == null) return null;
    return GrantType.values.firstWhereOrNull((e) => e.name == value);
  }

  String? get clientId => _prefs.getString(_clientId);
  String? get clientSecret => _prefs.getString(_clientSecret);

  Environment? get environment {
    final value = _prefs.getString(_environment);
    if (value == null) return null;
    return Environment.values.firstWhereOrNull((e) => e.name == value);
  }

  String get currencyCode => _prefs.getString(_currencyCode) ?? _defaultCurrencyCode;
  String get languageCode => _prefs.getString(_languageCode) ?? _defaultLanguageCode;
  bool get cardInstallments => _prefs.getBool(_cardInstallments) ?? false;

  Future<void> setAccessToken(String value) => _prefs.setString(_accessToken, value);
  Future<void> setGrantType(GrantType value) => _prefs.setString(_grantType, value.name);
  Future<void> setClientId(String value) => _prefs.setString(_clientId, value);
  Future<void> setClientSecret(String value) => _prefs.setString(_clientSecret, value);
  Future<void> setEnvironment(Environment value) => _prefs.setString(_environment, value.name);
  Future<void> setCurrencyCode(String value) => _prefs.setString(_currencyCode, value);
  Future<void> setLanguageCode(String value) => _prefs.setString(_languageCode, value);
  Future<void> setCardInstallments(bool value) => _prefs.setBool(_cardInstallments, value);

  List<String> getCurrencies() => _defaultCurrencies;
  List<String> getLanguages() => _defaultLanguages;
}
