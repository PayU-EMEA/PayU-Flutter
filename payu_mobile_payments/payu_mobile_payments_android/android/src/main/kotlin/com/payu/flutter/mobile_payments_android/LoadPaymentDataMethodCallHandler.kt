package com.payu.flutter.mobile_payments_android

import android.app.Activity
import android.content.Intent
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.common.api.CommonStatusCodes
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.wallet.AutoResolveHelper
import com.google.android.gms.wallet.PaymentData
import com.google.android.gms.wallet.Wallet
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class LoadPaymentDataMethodCallHandler(
    private val activity: Activity,
    private val extractor: PayuMobilePaymentsArgumentExtractor
) : MethodChannel.MethodCallHandler,
    PluginRegistry.ActivityResultListener {

    private companion object {
        private const val LOAD_PAYMENT_DATA_REQUEST_CODE = 991
    }

    private var result: MethodChannel.Result? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        this.result = result

        val walletOptions = Wallet.WalletOptions.Builder()
            .setEnvironment(extractor.extractWalletEnvironment(call.arguments))
            .build()

        val paymentDataRequest = extractor.extractPaymentDataRequest(call.arguments)
        val paymentsClient = Wallet.getPaymentsClient(activity, walletOptions)
        val task = paymentsClient.loadPaymentData(paymentDataRequest)

        task.addOnCompleteListener(activity) { completedTask ->
            when (val exception = completedTask.exception) {
                null -> result.success(completedTask.result.toJson())
                is ResolvableApiException -> exception.startResolutionForResult(activity, LOAD_PAYMENT_DATA_REQUEST_CODE)
                is ApiException -> result.error(exception.statusCode.toString(), "AutoResolveHelper.RESULT_ERROR", exception.status.statusMessage)
                else -> result.error(CommonStatusCodes.INTERNAL_ERROR.toString(), "AutoResolveHelper.RESULT_ERROR", exception.message)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        return when (requestCode) {
            LOAD_PAYMENT_DATA_REQUEST_CODE -> handleLoadPaymentDataRequestCode(resultCode, data)
            else -> false
        }
    }

    private fun handleLoadPaymentDataRequestCode(resultCode: Int, data: Intent?): Boolean {
        return when (resultCode) {
            Activity.RESULT_OK -> handleLoadPaymentDataResultOk(data)
            Activity.RESULT_CANCELED -> handleLoadPaymentDataResultCancelled(resultCode)
            AutoResolveHelper.RESULT_ERROR -> handleLoadPaymentDataResultError(data)
            else -> false
        }
    }

    private fun handleLoadPaymentDataResultOk(data: Intent?): Boolean {
        data?.let { intent ->
            PaymentData.getFromIntent(intent)?.let {
                result?.success(it.toJson())
            }
        }
        return true
    }

    private fun handleLoadPaymentDataResultCancelled(resultCode: Int): Boolean {
        result?.error(resultCode.toString(), "Activity.RESULT_CANCELED", null)
        return true
    }

    private fun handleLoadPaymentDataResultError(data: Intent?): Boolean {
        AutoResolveHelper.getStatusFromIntent(data)?.let {
            result?.error(it.statusCode.toString(), "AutoResolveHelper.RESULT_ERROR", it.statusMessage)
        }
        return true
    }
}