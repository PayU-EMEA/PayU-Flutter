//
//  FlutterError+Extensions.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter

extension FlutterError {
  static func didFailMapArguments() -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didFailMapArguments", message: nil, details: nil)
  }

  static func didFailPresentPaymentController() -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didFailPresentPaymentController", message: nil, details: nil)
  }

  static func didFailGenerateJSONForArguments(_ message: String) -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didFailGenerateJSONForArguments", message: message, details: nil)
  }

  static func didFailGenerateJSONForPayment(_ message: String) -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didFailGenerateJSONForPayment", message: message, details: nil)
  }

  static func didCancelPayment() -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didCancelPayment", message: nil, details: nil)
  }

  static func didFailPayment() -> FlutterError {
    return FlutterError(code: "PayuMobilePayments.didFailPayment", message: nil, details: nil)
  }
}
