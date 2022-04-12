//
//  Handler.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import Flutter

protocol Handler {
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)
}
