import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

class SettingsDb extends GetxService {
  static const tag = 'SettingsDb';

  static const _defaultCurrencies = ['CZK', 'PLN'];
  static const _defaultCurrency = 'PLN';

  static const _accessToken = '_accessToken';
  static const _grantType = '_grantType';
  static const _clientId = '_clientId';
  static const _clientSecret = '_clientSecret';
  static const _currencyCode = '_currencyCode';
  static const _environment = '_environment';

  final Box _box;

  SettingsDb(this._box);

  String? get accessToken => _box.get(_accessToken);
  GrantType? get grantType => _box.get(_grantType);
  String? get clientId => _box.get(_clientId);
  String? get clientSecret => _box.get(_clientSecret);
  String get currencyCode => _box.get(_currencyCode, defaultValue: _defaultCurrency);
  Environment? get environment => _box.get(_environment);

  Future<void> setAccessToken(String value) => _box.put(_accessToken, value);
  Future<void> setGrantType(GrantType value) => _box.put(_grantType, value);
  Future<void> setClientId(String value) => _box.put(_clientId, value);
  Future<void> setClientSecret(String value) => _box.put(_clientSecret, value);
  Future<void> setCurrencyCode(String value) => _box.put(_currencyCode, value);
  Future<void> setEnvironment(Environment value) => _box.put(_environment, value);

  List<String> getCurrencies() => _defaultCurrencies;
}
