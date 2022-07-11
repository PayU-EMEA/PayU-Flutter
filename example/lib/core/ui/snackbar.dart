import 'dart:developer';

import 'package:get/get.dart';

void snackbar(String? message) {
  log(message ?? 'null');
  Get.closeCurrentSnackbar();
  Get.rawSnackbar(
    message: message ?? 'null',
    animationDuration: const Duration(milliseconds: 250),
  );
}
