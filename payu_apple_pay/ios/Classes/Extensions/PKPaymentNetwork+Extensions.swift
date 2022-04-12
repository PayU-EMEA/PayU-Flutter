//
//  PKPaymentNetwork+Extensions.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 08/02/2022.
//

import PassKit

extension PKPaymentNetwork {
  static func networks() -> [PKPaymentNetwork] {
    return [.maestro, .masterCard, .visa]
  }
}

