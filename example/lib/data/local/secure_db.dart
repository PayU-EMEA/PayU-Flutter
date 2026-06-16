import 'package:shared_preferences/shared_preferences.dart';

class SecureDb {
  static const tag = 'SecureDb';
  static const _keySelectedPaymentMethodHash = '_keySelectedPaymentMethodHash';

  final SharedPreferences _prefs;

  SecureDb(this._prefs);

  Future<String?> getSelectedPaymentMethodHash() {
    return Future.value(_prefs.getString(_keySelectedPaymentMethodHash));
  }

  Future<void> saveSelectedPaymentMethodHash(String hash) async {
    await _prefs.setString(_keySelectedPaymentMethodHash, hash);
  }
}
