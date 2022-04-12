//
//  Constants.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Foundation

struct FlutterMethodChannelName {
  static let inputChannel = "com.payu.flutter.apple-pay.input"
  static let outputChannel = "com.payu.flutter.apple-pay.output"
}

struct FlutterMethodCallName {
  static let authorize = "authorize"
  static let canMakePayments = "canMakePayments"

  static let onDidAuthorize = "onDidAuthorize";
  static let onDidCancel = "onDidCancel";
}
