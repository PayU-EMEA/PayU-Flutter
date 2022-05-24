package com.example.payu_mobile_payments_android

import com.google.android.gms.wallet.IsReadyToPayRequest
import com.google.android.gms.wallet.PaymentDataRequest
import com.google.android.gms.wallet.WalletConstants
import org.json.JSONObject

class PayuMobilePaymentsArgumentExtractor {
    fun extractWalletEnvironment(arguments: Any): Int {
        return when (JSONObject(arguments.toString())["environment"] as String?) {
            "production" -> WalletConstants.ENVIRONMENT_PRODUCTION
            "test" -> WalletConstants.ENVIRONMENT_TEST
            else -> WalletConstants.ENVIRONMENT_TEST
        }
    }

    fun extractIsReadyToPayRequest(arguments: Any): IsReadyToPayRequest {
        return IsReadyToPayRequest.fromJson(JSONObject(arguments.toString())["data"].toString())
    }

    fun extractPaymentDataRequest(arguments: Any): PaymentDataRequest {
        val jsonObject = JSONObject(JSONObject(arguments.toString())["data"].toString())
        jsonObject.getJSONObject("transactionInfo").let {
            val totalPrice = it.getString("totalPrice")
            it.putOpt("totalPrice", totalPrice.toString())
        }
        return PaymentDataRequest.fromJson(jsonObject.toString())
    }
}