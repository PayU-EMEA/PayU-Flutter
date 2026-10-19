//
//  AuthorizeHandler.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter
import PassKit

class MakePaymentMethodCallHandler: NSObject {

  private enum Status {
    case didStartPayment
    case didPresentAuthorization
    case willAuthorizePayment
    case didAuthorizePayment
  }

  // MARK: - Private Properties
  private var result: FlutterResult!
  private var status: Status!

  // MARK: - Private Methods
  private func buildPaymentRequest(_ input: PaymentRequest) -> PKPaymentRequest {
    return PKPaymentRequestBuilder()
      .withMerchantIdentifier(input.merchantIdentifier)
      .withRegionCodes(input.countryCode, input.currencyCode)
      .withShippingContact(input.shippingContact)
      .withSummaryItems(input.paymentSummaryItems)
      .build()
  }

  private func processPaymentRequest(_ request: PKPaymentRequest, result: @escaping FlutterResult) {
    let authorizationController = PKPaymentAuthorizationController(paymentRequest: request)
    authorizationController.present { isPresented in isPresented ? self.status = .didPresentAuthorization : result(FlutterError.didFailPresentPaymentController()) }
    authorizationController.delegate = self
  }

}

// MARK: - MethodCallHandler
extension MakePaymentMethodCallHandler: MethodCallHandler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    self.status = .didStartPayment
    self.result = result

    guard let json = call.arguments as? [String: Any] else {
      result(FlutterError.didFailMapArguments())
      return
    }

    do {
      let data = try JSONSerialization.data(withJSONObject: json, options: [])
      let configuration = try JSONDecoder().decode(PaymentConfiguration.self, from: data)
      processPaymentRequest(buildPaymentRequest(configuration.data), result: result)
    } catch {
      result(FlutterError.didFailGenerateJSONForArguments(error.localizedDescription))
    }
  }
}

// MARK: - PKPaymentAuthorizationControllerDelegate
extension MakePaymentMethodCallHandler: PKPaymentAuthorizationControllerDelegate {
  func paymentAuthorizationControllerWillAuthorizePayment(_ controller: PKPaymentAuthorizationController) {
    status = .willAuthorizePayment
  }

  func paymentAuthorizationController(
    _ controller: PKPaymentAuthorizationController,
    didAuthorizePayment payment: PKPayment,
    handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
      do {
        let data = try JSONSerialization.data(withJSONObject: payment.toDictionary(), options: [])
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
        status = .didAuthorizePayment
        result(data.utf8())
      } catch {
        result(FlutterError.didFailGenerateJSONForPayment(error.localizedDescription))
      }
    }

  func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
    controller.dismiss {
      DispatchQueue.main.async {
        switch self.status {
        case .didPresentAuthorization:
          self.result(FlutterError.didCancelPayment())
          break
        case .willAuthorizePayment:
          self.result(FlutterError.didFailPayment())
          break
        default:
          break
        }
      }
    }
  }
}


