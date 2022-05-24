package com.example.payu_mobile_payments_android

import android.app.Activity
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.wallet.Wallet
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class IsReadyToPayMethodCallHandler(
    private val activity: Activity,
    private val extractor: PayuMobilePaymentsArgumentExtractor
) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        val walletOptions = Wallet.WalletOptions.Builder()
            .setEnvironment(extractor.extractWalletEnvironment(call.arguments))
            .build()


        val isReadyToPayRequest = extractor.extractIsReadyToPayRequest(call.arguments)
        val paymentsClient = Wallet.getPaymentsClient(activity, walletOptions)
        val task = paymentsClient.isReadyToPay(isReadyToPayRequest)

        task.addOnCompleteListener { completedTask ->
            try {
                completedTask.getResult(ApiException::class.java)?.let { result.success(it) }
            } catch (exception: ApiException) {
                result.error(exception.statusCode.toString(), exception.message, null)
            }
        }
    }
}