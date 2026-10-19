//
//  PKPaymentRequestBuilder.swift
//  payu_mobile_payments_ios
//
//  Created by Anton Ivashyna on 07/02/2022.
//

import Foundation
import PassKit

class PKPaymentRequestBuilder {

  // MARK: - Private Properties
  private let request = PKPaymentRequest()

  // MARK: - Public Methods
  func build() -> PKPaymentRequest {
    request.supportedNetworks = PKPaymentNetwork.networks()
    request.merchantCapabilities = PKMerchantCapability.capabilities()
    return request
  }

  // MARK: - Private Methods
  @discardableResult
  func withMerchantIdentifier(_ merchantIdentifier: String) -> PKPaymentRequestBuilder {
    request.merchantIdentifier = merchantIdentifier
    return self
  }

  @discardableResult
  func withRegionCodes(_ countryCode: String, _ currencyCode: String) -> PKPaymentRequestBuilder {
    request.countryCode = countryCode
    request.currencyCode = currencyCode
    return self
  }

  @discardableResult
  func withShippingContact(_ value: Contact?) -> PKPaymentRequestBuilder {
    guard let value = value else { return self };
    let contact = PKContact()
    contact.emailAddress = value.emailAddress
    request.requiredShippingContactFields = [.emailAddress]
    request.shippingContact = contact
    return self
  }

  @discardableResult
  func withSummaryItems(_ items: [SummaryItem]) -> PKPaymentRequestBuilder {
    request.paymentSummaryItems = items.map {
      PKPaymentSummaryItem(
        label: $0.label,
        amount: NSDecimalNumber(
          mantissa: UInt64(exactly: NSNumber(value: $0.amount)) ?? 0,
          exponent: -2,
          isNegative: false),
        type: .final) }
    return self
  }

}
