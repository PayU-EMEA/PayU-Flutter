import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:payu/payu.dart' as payu;

class SettingsDb extends GetxService {
  static const tag = 'SettingsDb';

  static const _defaultCurrencies = ['CZK', 'PLN', 'RON'];
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

  final Box _box;

  SettingsDb(this._box);

  String? get accessToken => _box.get(_accessToken);
  GrantType? get grantType => _box.get(_grantType);
  String? get clientId => _box.get(_clientId);
  String? get clientSecret => _box.get(_clientSecret);

  Environment? get environment => _box.get(_environment);

  String get currencyCode => _box.get(_currencyCode, defaultValue: _defaultCurrencyCode);
  String get languageCode => _box.get(_languageCode, defaultValue: _defaultLanguageCode);

  Future<void> setAccessToken(String value) => _box.put(_accessToken, value);
  Future<void> setGrantType(GrantType value) => _box.put(_grantType, value);
  Future<void> setClientId(String value) => _box.put(_clientId, value);
  Future<void> setClientSecret(String value) => _box.put(_clientSecret, value);

  Future<void> setEnvironment(Environment value) => _box.put(_environment, value);

  Future<void> setCurrencyCode(String value) => _box.put(_currencyCode, value);
  Future<void> setLanguageCode(String value) => _box.put(_languageCode, value);

  List<String> getCurrencies() => _defaultCurrencies;
  List<String> getLanguages() => _defaultLanguages;
}
