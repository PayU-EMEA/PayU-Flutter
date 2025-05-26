import 'package:dio/dio.dart';
import 'package:example/data/models/order_create_response.dart';
import 'package:example/data/models/payment_methods_response.dart';
import 'package:example/features/example/backend/models/authorization_body.dart';
import 'package:example/features/example/backend/models/authorization_response.dart';
import 'package:example/features/example/backend/models/get_transactions/transactions_response.dart';
import 'package:example/features/example/backend/models/order_create_request.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST('pl/standard/user/oauth/authorize')
  Future<AuthorizationResponse> authorize(
    @Header('Content-Type') String contentType,
    @Body() AuthorizationBody body,
  );

  @GET('api/v2_1/paymethods')
  Future<PaymentMethodsResponse> getPaymentMethods(
    @Header('Content-Type') String contentType,
  );

  @POST('api/v2_1/orders')
  Future<OrderCreateResponse> createOrder(
    @Header('Content-Type') String contentType,
    @Body() OrderCreateRequest request,
  );

  @GET('api/v2_1/orders/{orderId}/transactions')
  Future<TransactionsResponse> getTransactions(
    @Path() String orderId,
  );
}
