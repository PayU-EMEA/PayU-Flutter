import 'package:flutter/foundation.dart';
import 'package:payu_core/payu_core.dart';

import '../network/client/card_installments_network_client.dart';
import '../network/models/card_installments_response.dart';
import '../exceptions/add_card_exception.dart';

class CardInstallmentsController {
  final CardInstallmentsNetworkClient _client;
  final VoidCallback _onChanged;

  final Map<String, CardInstallmentsResponse> _cache = {};
  String? _activeBin;

  CardInstallmentsResponse? cardInstallmentsOptions;
  int? selectedNumber;
  bool hasSelection = false;
  bool isLoading = false;
  String? errorText;

  List<int> get options =>
      (cardInstallmentsOptions?.numbers.where((v) => v > 1).toList() ?? const []);

  bool get isSelectionRequired => options.isNotEmpty && !hasSelection;

  CardInstallmentsController({
    required CardInstallmentsNetworkClient client,
    required VoidCallback onChanged,
  })  : _client = client,
        _onChanged = onChanged;

  void didUpdateDigits(String digits) {
    if (digits.length < 10) {
      _activeBin = null;
      isLoading = false;
      cardInstallmentsOptions = null;
      selectedNumber = null;
      return;
    }

    final bin = digits.substring(0, 10);
    if (_activeBin == bin) return;

    _activeBin = bin;
    _applyOrFetch(bin);
  }

  void select(int? value) {
    selectedNumber = value;
    errorText = null;
    _onChanged();
  }

  void prevalidate() {
    try {
      validate();
      errorText = null;
    } catch (e) {
      errorText = e.toString();
    } finally {
      _onChanged();
    }
  }

  void validate() {
    if (options.isNotEmpty && selectedNumber == null) throw AddCardException.noSelectInstallmentOption();
  }

  Future<void> _applyOrFetch(String bin) async {
    selectedNumber = null;

    if (!_cache.containsKey(bin)) {
      isLoading = true;
      _onChanged();

      await _fetch(bin);
    }

    if (_cache.containsKey(bin)) {
      cardInstallmentsOptions = _cache[bin]!;
    }

    isLoading = false;
    _onChanged();
  }

  Future<void> _fetch(String bin) async {
    try {
      final optionsResponse = await _client.options(bin);
      _cache[bin] = optionsResponse;
    } catch (e) {
      Logger.logError('Get card installments options: $e');
    }
  }
}




