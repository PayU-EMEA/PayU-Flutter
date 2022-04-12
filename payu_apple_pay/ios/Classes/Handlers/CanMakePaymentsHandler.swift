//
//  CanMakePaymentsHandler.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter
import PassKit

class CanMakePaymentsHandler: NSObject {  }

// MARK: - Handler
extension CanMakePaymentsHandler: Handler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let canMakePayments = PKPaymentAuthorizationController.canMakePayments(
      usingNetworks:  PKPaymentNetwork.networks(),
      capabilities: PKMerchantCapability.capabilities())
    result(NSNumber(value: canMakePayments))
  }
}
