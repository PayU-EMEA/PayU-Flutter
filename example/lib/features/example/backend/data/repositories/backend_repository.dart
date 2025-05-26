import 'package:example/core/constants.dart';
import 'package:example/data/models/grant_type.dart';
import 'package:example/data/models/order_create_response.dart';
import 'package:example/data/models/pay_method.dart';
import 'package:example/data/models/payment_methods_response.dart';
import 'package:example/data/models/product.dart';
import 'package:example/features/example/backend/api/api.dart';
import 'package:example/features/example/backend/models/authorization_body.dart';
import 'package:example/features/example/backend/models/get_transactions/transactions_response.dart';
import 'package:example/features/example/backend/models/order_create_request.dart';

import 'settings_repository.dart';

class BackendRepository {
  final Api _api;
  final SettingsRepository _settingsRepository;

  BackendRepository(
    this._api,
    this._settingsRepository,
  );

  Future<void> authorize() async {
    final grantType = _settingsRepository.grantType;
    final clientId = _settingsRepository.clientId;
    final clientSecret = _settingsRepository.clientSecret;

    final body = AuthorizationBody.mock(clientId!, clientSecret!, grantType!.key);
    final response = await _api.authorize('application/x-www-form-urlencoded', body);
    await _settingsRepository.setAccessToken(response.accessToken);
  }

  Future<OrderCreateResponse> createOrder(PayMethod payMethod, List<Product> products) async {
    await authorize();

    final clientId = _settingsRepository.clientId;
    const continueUrl = Constants.continueUrl;
    final currencyCode = _settingsRepository.currencyCode;

    return await _api.createOrder(
      'application/json',
      OrderCreateRequest.mock(
        clientId: clientId!,
        continueUrl: continueUrl,
        currencyCode: currencyCode,
        payMethod: payMethod,
        products: products,
      ),
    );
  }

  Future<PaymentMethodsResponse> getPaymentMethods() async {
    await authorize();
    return await _api.getPaymentMethods('application/json');
  }

  Future<TransactionsResponse> getTransactions(String orderId) async {
    return await _api.getTransactions(orderId);
  }
}
