package com.example.payu_mobile_payments_android

import com.google.android.gms.wallet.IsReadyToPayRequest
import com.google.android.gms.wallet.PaymentDataRequest
import com.google.android.gms.wallet.WalletConstants
import org.json.JSONObject

class PayuMobilePaymentsArgumentExtractor {
    fun extractWalletEnvironment(arguments: Any): Int {
        return when (JSONObject(arguments as Map<*, *>)["environment"] as String?) {
            "production" -> WalletConstants.ENVIRONMENT_PRODUCTION
            "test" -> WalletConstants.ENVIRONMENT_TEST
            else -> WalletConstants.ENVIRONMENT_TEST
        }
    }

    fun extractIsReadyToPayRequest(arguments: Any): IsReadyToPayRequest {
        return IsReadyToPayRequest.fromJson(
            JSONObject(arguments as Map<*, *>)["data"].toString()
        )
    }

    fun extractPaymentDataRequest(arguments: Any): PaymentDataRequest {
        return PaymentDataRequest.fromJson(
            JSONObject(arguments as Map<*, *>)["data"].toString()
        )
    }
}