import 'package:flutter/material.dart';

import 'package:payu_ui/payu_ui.dart';

class PayuFadeInImage extends StatelessWidget {
  final String? uri;
  final IconData? icon;
  final double? size;

  const PayuFadeInImage({super.key, this.uri, this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    if (uri != null) return _UriFadeInImage(uri: uri!, size: size);
    if (icon != null) return _IconFadeInImage(icon: icon!, size: size);
    return const SizedBox();
  }
}

class _UriFadeInImage extends StatelessWidget {
  final String uri;
  final double? size;

  const _UriFadeInImage({required this.uri, this.size});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fadeInDuration: const Duration(milliseconds: 250),
      image: uri,
      placeholder: uri,
      imageErrorBuilder: (context, object, trace) => const SizedBox(),
      placeholderErrorBuilder: (context, object, trace) => const SizedBox(),
      width: size,
      height: size,
    );
  }
}

class _IconFadeInImage extends StatelessWidget {
  final IconData icon;
  final double? size;

  const _IconFadeInImage({required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: PayuColors.primary2,
    );
  }
}
