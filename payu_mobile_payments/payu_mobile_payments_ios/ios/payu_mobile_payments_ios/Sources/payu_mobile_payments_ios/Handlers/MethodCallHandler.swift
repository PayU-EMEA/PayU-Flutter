//
//  Handler.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter

protocol MethodCallHandler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)
}
