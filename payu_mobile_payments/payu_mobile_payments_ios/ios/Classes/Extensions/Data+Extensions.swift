//
//  Data+Extensions.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 25/05/2022.
//

import Foundation

extension Data {
  func utf8() -> String {
    return String(decoding: self, as: UTF8.self)
  }
}
