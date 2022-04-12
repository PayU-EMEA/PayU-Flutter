import 'package:collection/collection.dart';
import 'package:payu_core/payu_core.dart';
import 'package:payu_state_management/payu_state_management.dart';

import '../../payment_methods_configuration.dart';
import '../core/payment_methods_item.dart';
import '../core/payment_methods_storage.dart';
import 'payment_methods_listener.dart';

mixin PaymentMethodsControllerDelegate {
  void didComplete(PaymentMethod paymentMethod);

  void navigateToBankTransfer();
  void navigateToCardToken();
}

class PaymentMethodsController extends PayuController {
  final PaymentMethodsControllerDelegate _delegate;
  final PaymentMethodsConfiguration _configuration;
  final PaymentMethodsListener _listener;
  final PaymentMethodsStorage _storage;

  List<PaymentMethodsItem> get items => _items.whereNot((e) => _removed.contains(e.hash)).toList();

  List<BlikToken>? get _blikTokens => _configuration.blikTokens;
  List<CardToken> get _cardTokens => _configuration.cardTokens;
  List<PayByLink> get _payByLinks => _configuration.payByLinks;

  final _items = <PaymentMethodsItem>[];
  final _removed = <String>[];

  PaymentMethodsController(this._delegate, this._configuration, this._listener, this._storage);

  @override
  Future<void> onInit() async {
    await _setupPaymentMethods();
    super.onInit();
  }

  bool canDismissPaymentMethod(PaymentMethodsItem item) {
    const excluded = [
      PaymentMethodValue.applePay,
      PaymentMethodValue.blikCode,
      PaymentMethodValue.googlePay,
      PaymentMethodValue.mastercardInstallments,
    ];

    return item.hash != null && !excluded.contains(item.hash);
  }

  void dismissPaymentMethod(PaymentMethodsItem item) {
    if (canDismissPaymentMethod(item)) {
      final method = item.paymentMethod!;
      _listener.didDeletePaymentMethod(method);

      _removed.add(item.hash!);
      _setupPaymentMethods();
    }
  }

  void didSelectPaymentMethod(PaymentMethodsItem item) {
    if (item is PaymentMethodsApplePayItem) {
      _selectPaymentMethod(item.value);
    } else if (item is PaymentMethodsBankTransferItem) {
      _delegate.navigateToBankTransfer();
    } else if (item is PaymentMethodsBlikCodeItem) {
      _selectPaymentMethod(item.value);
    } else if (item is PaymentMethodsBlikTokenItem) {
      _selectPaymentMethod(item.value);
    } else if (item is PaymentMethodsCardItem) {
      _delegate.navigateToCardToken();
    } else if (item is PaymentMethodsCardTokenItem) {
      _selectPaymentMethod(item.value);
    } else if (item is PaymentMethodsInstallmentsItem) {
      _selectPaymentMethod(item.value);
    } else if (item is PaymentMethodsPayByLinkItem) {
      _selectPaymentMethod(item.value);
    }
  }

  void didSelectBankTransfer(PayByLink payByLink) async {
    _selectPaymentMethod(payByLink);
  }

  void didSelectCardToken(CardToken cardToken) async {
    _cardTokens.add(cardToken);
    _selectPaymentMethod(cardToken);
  }

  void _selectPaymentMethod(PaymentMethod paymentMethod) async {
    await _saveSelectedPaymentMethodHash(paymentMethod.hash);
    _delegate.didComplete(paymentMethod);
  }

  Future<void> _setupPaymentMethods() async {
    _items.clear();

    _setupApplePay();
    _setupBlikCode();
    _setupBlikTokens();
    _setupCardTokens();
    _setupCard();
    _setupBankTransfer();
    _setupInstallments();
    await _setupPayByLinks();
    await _setupSelectedPaymentMethod();

    notifyListeners();
  }

  void _setupApplePay() {
    for (final e in _payByLinks) {
      if (_isApplePayPayByLink(e)) {
        final value = ApplePay.fromPayByLink(e);
        _items.add(PaymentMethodsApplePayItem.build(value));
      }
    }
  }

  void _setupBlikCode() {
    if (_blikTokens != null && _blikTokens!.isEmpty) {
      _items.add(PaymentMethodsBlikCodeItem.build(const BlikCode()));
    }
  }

  void _setupBlikTokens() {
    if (_blikTokens != null && _blikTokens!.isNotEmpty) {
      for (final e in _blikTokens!) {
        _items.add(PaymentMethodsBlikTokenItem.build(e));
      }
    }
  }

  void _setupCardTokens() {
    for (final e in _cardTokens) {
      _items.add(PaymentMethodsCardTokenItem.build(e));
    }
  }

  void _setupInstallments() {
    for (final e in _payByLinks) {
      if (_isInstallmentsPayByLink(e)) {
        final value = Installments.fromPayByLink(e);
        _items.add(PaymentMethodsInstallmentsItem.build(value));
      }
    }
  }

  Future _setupPayByLinks() async {
    final hash = await _getSelectedPaymentMethodHash();

    if (hash != null) {
      if (_configuration.enablePayByLinks) {
        for (final e in _payByLinks) {
          if (_isAllowedPayByLink(e)) {
            if (e.hash == hash) {
              _items.add(PaymentMethodsPayByLinkItem.build(e));
            }
          }
        }
      }
    }
  }

  void _setupCard() {
    if (_configuration.enableAddCard) {
      _items.add(PaymentMethodsCardItem.build());
    }
  }

  void _setupBankTransfer() {
    if (_configuration.enablePayByLinks) {
      final enabled = _payByLinks.isNotEmpty;
      _items.add(PaymentMethodsBankTransferItem.build(enabled));
    }
  }

  Future _setupSelectedPaymentMethod() async {
    final hash = await _getSelectedPaymentMethodHash();

    if (hash != null) {
      final item = _items.firstWhereOrNull((e) => e.hash == hash);
      if (item != null) {
        _items.remove(item);
        _items.insert(0, item);
      }
    }
  }

  // SELECTED PAYMENT METHOD

  Future<String?> _getSelectedPaymentMethodHash() async {
    return await _storage.getSelectedPaymentMethodHash();
  }

  Future _saveSelectedPaymentMethodHash(String hash) async {
    await _storage.saveSelectedPaymentMethodHash(hash);
  }

  // MATCHING
  bool _isAllowedPayByLink(PayByLink value) {
    return value.value != PaymentMethodValue.applePay && value.value != PaymentMethodValue.mastercardInstallments;
  }

  bool _isApplePayPayByLink(PayByLink value) {
    return value.value == PaymentMethodValue.applePay;
  }

  bool _isInstallmentsPayByLink(PayByLink value) {
    return value.value == PaymentMethodValue.mastercardInstallments;
  }
}
