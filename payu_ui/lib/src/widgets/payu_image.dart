import 'package:flutter/material.dart';

import 'package:payu_ui/payu_ui.dart';

abstract class PayuImageUrl {
  // TODO: - Change endpoint to `static`
  static const logo = 'https://poland.payu.com/wp-content/uploads/sites/14/2020/05/PAYU_LOGO_LIME-990x640.png';
}

abstract class PayuImageSize {
  static const logo = Size(64, 64);
}

class PayuImage extends StatelessWidget {
  final Size size;
  final String url;

  const PayuImage._({Key? key, required this.size, required this.url}) : super(key: key);

  factory PayuImage.logo() => const PayuImage._(size: PayuImageSize.logo, url: PayuImageUrl.logo);

  @override
  Widget build(BuildContext context) {
    return PayuFadeInImage(
      uri: url,
      size: size.width,
    );
  }
}
