//
//  AuthorizeHandler.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter
import PassKit

class MakePaymentMethodCallHandler: NSObject {

  // MARK: - Private Properties
  private var result: FlutterResult?

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
    guard let authorizationController = PKPaymentAuthorizationViewController(paymentRequest: request) else {
      result(FlutterError.cannotCreatePaymentAuthorizationController())
      return
    }

    guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
      result(FlutterError.cannotCreatePresentingViewController())
      return
    }

    rootViewController.present(authorizationController, animated: true, completion: nil)
    authorizationController.delegate = self
  }

}

// MARK: - MethodCallHandler
extension MakePaymentMethodCallHandler: MethodCallHandler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    self.result = result

    guard let json = call.arguments as? [String: Any] else {
      result(FlutterError.invalidInputArguments())
      return
    }

    do {
      let data = try JSONSerialization.data(withJSONObject: json, options: [])
      let configuration = try JSONDecoder().decode(PaymentConfiguration.self, from: data)
      processPaymentRequest(buildPaymentRequest(configuration.data), result: result)
    } catch {
      result(FlutterError.cannotParseInputArguments(error.localizedDescription))
    }
  }
}

// MARK: - PKPaymentAuthorizationViewControllerDelegate
extension MakePaymentMethodCallHandler: PKPaymentAuthorizationViewControllerDelegate {
  
  public func paymentAuthorizationViewController(
    _ controller: PKPaymentAuthorizationViewController,
    didAuthorizePayment payment: PKPayment,
    handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {

    controller.dismiss(animated: true) {
      self.result?(payment.toEncodedJSON())
      completion(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
    }
  }

  public func paymentAuthorizationViewControllerDidFinish(
    _ controller: PKPaymentAuthorizationViewController) {
      controller.dismiss(animated: true) {
        self.result?(nil)
      }
  }
}


