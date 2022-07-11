import 'package:payu_core/payu_core.dart';

class PaymentMethodsConfiguration {
  final List<BlikToken>? blikTokens;
  final List<CardToken> cardTokens;
  final List<PayByLink> payByLinks;

  final bool enableAddCard;
  final bool enablePayByLinks;

  PaymentMethodsConfiguration({
    required List<BlikToken>? blikTokens,
    required List<CardToken> cardTokens,
    required List<PayByLink> payByLinks,
    this.enableAddCard = true,
    this.enablePayByLinks = true,
    bool showExpiredCards = false,
    bool showDisabledPayByLinks = false,
  })  :
        // ignore: unnecessary_this, prefer_initializing_formals
        this.blikTokens = blikTokens,
        // ignore: unnecessary_this
        this.cardTokens = cardTokens.where((e) => showExpiredCards ? true : e.enabled).toList(),
        // ignore: unnecessary_this
        this.payByLinks = payByLinks.where((e) => showDisabledPayByLinks ? true : e.enabled).toList();
}
