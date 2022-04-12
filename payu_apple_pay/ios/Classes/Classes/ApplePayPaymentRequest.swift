//
//  ApplePayPaymentRequest.swift
//  payu_apple_pay
//
//  Created by Anton Ivashyna on 07/02/2022.
//

import Foundation

struct ApplePayPaymentRequest: Codable {
  let merchantIdentifier: String
  let countryCode: String
  let currencyCode: String
  let shippingContact: ApplePayContact
  let paymentSummaryItems: [ApplePaySummaryItem]
}
