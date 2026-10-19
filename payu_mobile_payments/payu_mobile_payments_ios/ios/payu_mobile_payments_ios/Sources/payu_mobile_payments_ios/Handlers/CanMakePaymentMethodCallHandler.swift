//
//  CanMakePaymentsHandler.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter
import PassKit

class CanMakePaymentMethodCallHandler: NSObject {  }

// MARK: - MethodCallHandler
extension CanMakePaymentMethodCallHandler: MethodCallHandler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let canMakePayments = PKPaymentAuthorizationController.canMakePayments(
      usingNetworks:  PKPaymentNetwork.networks(),
      capabilities: PKMerchantCapability.capabilities())
    result(NSNumber(value: canMakePayments))
  }
}
