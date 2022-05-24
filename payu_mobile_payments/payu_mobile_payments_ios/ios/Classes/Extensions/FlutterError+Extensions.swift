//
//  FlutterError+Extensions.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter

extension FlutterError {
  static let domain = "com.payu.flutter.apple-pay"

  static func invalidInputArguments() -> FlutterError {
    return FlutterError(code: domain, message: "invalidInputArguments", details: nil)
  }

  static func cannotParseInputArguments(_ message: String) -> FlutterError {
    return FlutterError(code: domain, message: "cannotParseInputArguments", details: message)
  }

  static func cannotCreatePaymentAuthorizationController() -> FlutterError {
    return FlutterError(code: domain, message: "cannotCreatePaymentAuthorizationController", details: nil)
  }

  static func cannotCreatePresentingViewController() -> FlutterError {
    return FlutterError(code: domain, message: "cannotCreatePresentingViewController", details: nil)
  }

}
