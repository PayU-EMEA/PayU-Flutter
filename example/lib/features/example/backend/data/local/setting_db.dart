import 'package:hive/hive.dart';

import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';

class SettingsDb {
  static const tag = 'SettingsDb';

  static const _accessToken = '_accessToken';
  static const _grantType = '_grantType';
  static const _clientId = '_clientId';
  static const _clientSecret = '_clientSecret';
  static const _environment = '_environment';

  final Box _box;

  SettingsDb(this._box);

  String? get accessToken => _box.get(_accessToken);
  GrantType? get grantType => _box.get(_grantType);
  String? get clientId => _box.get(_clientId);
  String? get clientSecret => _box.get(_clientSecret);
  Environment? get environment => _box.get(_environment);

  Future<void> setAccessToken(String value) => _box.put(_accessToken, value);
  Future<void> setGrantType(GrantType value) => _box.put(_grantType, value);
  Future<void> setClientId(String value) => _box.put(_clientId, value);
  Future<void> setClientSecret(String value) => _box.put(_clientSecret, value);
  Future<void> setEnvironment(Environment value) => _box.put(_environment, value);
}
