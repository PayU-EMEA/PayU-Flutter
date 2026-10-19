//
//  PKPayment+Extensions.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 24/05/2022.
//

import PassKit

extension PKPayment {
  func toDictionary() -> [String: Any] {
    return [
      "token": token.toDictionary()
    ]
  }
  func toJSON() -> Data? {
    return try? JSONSerialization.data(
      withJSONObject: toDictionary(),
      options: [])
  }
}

extension PKPaymentToken {
  func toDictionary() -> [String: Any] {
    return [
      "paymentData": paymentData.base64EncodedString()
    ]
  }
}
