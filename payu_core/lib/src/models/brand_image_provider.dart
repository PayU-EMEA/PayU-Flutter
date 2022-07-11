import 'package:flutter/material.dart';

class BrandImageProvider {
  static const _logo = 'https://poland.payu.com/wp-content/uploads/sites/14/2020/05/PAYU_LOGO_LIME-990x640.png';

  static const _maestroLight = 'https://static.payu.com/images/mobile/maestro-light.png';
  static const _maestroDark = 'https://static.payu.com/images/mobile/maestro-dark.png';

  static const _mastercardLight = 'https://static.payu.com/images/mobile/mastercard-light.png';
  static const _mastercardDark = 'https://static.payu.com/images/mobile/mastercard-dark.png';

  static const _visaLight = 'https://static.payu.com/images/mobile/visa-light.png';
  static const _visaDark = 'https://static.payu.com/images/mobile/visa-dark.png';

  final String? light;
  final String? dark;
  final IconData? icon;

  const BrandImageProvider({this.light, this.dark, this.icon});

  factory BrandImageProvider.uri(String uri) {
    return BrandImageProvider(
      light: uri,
      dark: uri,
    );
  }

  factory BrandImageProvider.logo() {
    return const BrandImageProvider(
      light: _logo,
      dark: _logo,
    );
  }

  factory BrandImageProvider.maestro() {
    return const BrandImageProvider(
      light: _maestroLight,
      dark: _maestroDark,
    );
  }

  factory BrandImageProvider.mastercard() {
    return const BrandImageProvider(
      light: _mastercardLight,
      dark: _mastercardDark,
    );
  }

  factory BrandImageProvider.visa() {
    return const BrandImageProvider(
      light: _visaLight,
      dark: _visaDark,
    );
  }
}
