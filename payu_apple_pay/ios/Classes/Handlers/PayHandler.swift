//
//  PayHandler.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter
import PassKit

class PayHandler: NSObject {

  // MARK: - Private Properties
  private let outputChannel: FlutterMethodChannel

  // MARK: - Initialization
  init(outputChannel: FlutterMethodChannel) {
    self.outputChannel = outputChannel
  }

  // MARK: - Private Methods
  private func buildPaymentRequest(_ input: ApplePayPaymentRequest) -> PKPaymentRequest {
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

// MARK: - Handler
extension PayHandler: Handler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let json = call.arguments as? [String: Any] else {
      result(FlutterError.invalidInputArguments())
      return
    }

    do {
      let data = try JSONSerialization.data(withJSONObject: json, options: [])
      let input = try JSONDecoder().decode(ApplePayPaymentRequest.self, from: data)
      processPaymentRequest(buildPaymentRequest(input), result: result)
    } catch {
      result(FlutterError.cannotParseInputArguments(error.localizedDescription))
    }
  }
}

// MARK: - PKPaymentAuthorizationViewControllerDelegate
extension PayHandler: PKPaymentAuthorizationViewControllerDelegate {
  
  public func paymentAuthorizationViewController(
    _ controller: PKPaymentAuthorizationViewController,
    didAuthorizePayment payment: PKPayment,
    handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {

      print("didAuthorizePayment")

    controller.dismiss(animated: true) {
      let token = payment.token.paymentData.base64EncodedString()
      self.outputChannel.invokeMethod(FlutterMethodCallName.onDidAuthorize, arguments: token)
      completion(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: nil))
    }
  }

  public func paymentAuthorizationViewControllerDidFinish(
    _ controller: PKPaymentAuthorizationViewController) {
      print("paymentAuthorizationViewControllerDidFinish")
      controller.dismiss(animated: true) {
        self.outputChannel.invokeMethod(FlutterMethodCallName.onDidCancel, arguments: nil)
      }
  }
}


