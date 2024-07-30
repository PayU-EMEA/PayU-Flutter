import 'package:flutter/material.dart';

class PayuAppBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const PayuAppBarIcon._({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }

  factory PayuAppBarIcon.back({required VoidCallback onPressed}) {
    return PayuAppBarIcon._(
      icon: Icons.arrow_back,
      onPressed: onPressed,
    );
  }

  factory PayuAppBarIcon.info({required VoidCallback onPressed}) {
    return PayuAppBarIcon._(
      icon: Icons.info_outline,
      onPressed: onPressed,
    );
  }
}
