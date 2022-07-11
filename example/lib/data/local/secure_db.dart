import 'package:hive/hive.dart';

class SecureDb {
  static const tag = 'SecureDb';
  static const _keySelectedPaymentMethodHash = '_keySelectedPaymentMethodHash';

  final Box _box;

  SecureDb(this._box);

  Future<String?> getSelectedPaymentMethodHash() {
    return Future.value(_box.get(_keySelectedPaymentMethodHash, defaultValue: null));
  }

  Future<void> saveSelectedPaymentMethodHash(String hash) async {
    await _box.put(_keySelectedPaymentMethodHash, hash);
  }
}
