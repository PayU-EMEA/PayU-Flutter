//
//  PaymentRequest.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 07/02/2022.
//

import Foundation

struct PaymentRequest: Codable {
  let merchantIdentifier: String
  let countryCode: String
  let currencyCode: String
  let shippingContact: Contact?
  let paymentSummaryItems: [SummaryItem]
}
