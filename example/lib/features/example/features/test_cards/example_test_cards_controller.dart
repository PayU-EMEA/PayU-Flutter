import 'dart:developer';

import 'package:get/get.dart';
import 'package:payu/payu.dart';

class ExampleTestCardsController extends GetxController {
  final TestCardsService _service;

  List<TestPaymentCard> get cards => _cards();
  final _cards = <TestPaymentCard>[].obs;

  ExampleTestCardsController(this._service);

  @override
  void onInit() async {
    await _loadCards();
    super.onInit();
  }

  void didSelect(TestPaymentCard card) async {
    final token = await _service.tokenizeTestPaymentCard(card);
    Get.back(result: token);
    log(token.toString());
  }

  Future _loadCards() async {
    _cards.value = await _service.getTestPaymentCards();
  }
}
