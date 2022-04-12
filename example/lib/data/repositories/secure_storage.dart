import 'package:payu/payu.dart';

import 'package:example/data/local/secure_db.dart';

class SecureStorage implements PaymentMethodsStorage {
  final SecureDb _db;

  SecureStorage(this._db);

  @override
  Future<String?> getSelectedPaymentMethodHash() {
    return _db.getSelectedPaymentMethodHash();
  }

  @override
  Future<void> saveSelectedPaymentMethodHash(String hash) async {
    await _db.saveSelectedPaymentMethodHash(hash);
  }
}
