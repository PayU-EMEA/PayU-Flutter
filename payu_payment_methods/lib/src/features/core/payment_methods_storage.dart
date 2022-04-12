abstract class PaymentMethodsStorage {
  Future<String?> getSelectedPaymentMethodHash();
  Future<void> saveSelectedPaymentMethodHash(String hash);
}
