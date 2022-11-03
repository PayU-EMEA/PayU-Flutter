import 'dart:ui';

import 'package:example/data/models/environment.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:example/features/example/backend/data/local/setting_db.dart';
import 'package:payu/payu.dart' as p;

class SettingsRepository {
  final SettingsDb _db;

  SettingsRepository(this._db);

  String? get accessToken => _db.accessToken;
  GrantType? get grantType => _db.grantType;
  String? get clientId => _db.clientId;
  String? get clientSecret => _db.clientSecret;

  Environment? get environment => _db.environment;

  String get currencyCode => _db.currencyCode;
  String get languageCode => _db.languageCode;

  Future<void> setAccessToken(String value) => _db.setAccessToken(value);
  Future<void> setGrantType(GrantType value) => _db.setGrantType(value);
  Future<void> setClientId(String value) => _db.setClientId(value);
  Future<void> setClientSecret(String value) => _db.setClientSecret(value);

  Future<void> setEnvironment(Environment value) => _db.setEnvironment(value);

  Future<void> setCurrencyCode(String value) => _db.setCurrencyCode(value);
  Future<void> setLanguageCode(String value) => _db.setLanguageCode(value).then((e) => p.Payu.locale = Locale(value));

  List<String> getCurrencies() => _db.getCurrencies();
  List<String> getLanguages() => _db.getLanguages();
}
