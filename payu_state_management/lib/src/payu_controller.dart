import 'package:flutter/material.dart';

abstract class PayuController extends ChangeNotifier {
  @mustCallSuper
  void onInit() {}
}
