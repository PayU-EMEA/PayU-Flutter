package com.example.payu_mobile_payments_android

import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class PayuMobilePaymentsMethodCallHandler private constructor(
    binaryMessenger: BinaryMessenger,
    activity: Activity
) : MethodChannel.MethodCallHandler {

    constructor(
        flutterBinding: FlutterPlugin.FlutterPluginBinding,
        activityBinding: ActivityPluginBinding,
    ) : this(flutterBinding.binaryMessenger, activityBinding.activity) {
        activityBinding.addActivityResultListener(loadPaymentDataMethodCallHandler)
    }

    private companion object {
        private const val METHOD_CHANNEL_NAME = "PayuMobilePaymentsPlatformInterface"
        private const val METHOD_CAN_MAKE_PAYMENT = "canMakePayment"
        private const val METHOD_MAKE_PAYMENT = "makePayment"
    }

    private val channel = MethodChannel(binaryMessenger, METHOD_CHANNEL_NAME)
    private val extractor = PayuMobilePaymentsArgumentExtractor()

    private val isReadyToPayMethodCallHandler = IsReadyToPayMethodCallHandler(activity, extractor)
    private val loadPaymentDataMethodCallHandler = LoadPaymentDataMethodCallHandler(activity, extractor)

    fun setMethodCallHandler() = channel.setMethodCallHandler(this)
    fun clearMethodCallHandler() = channel.setMethodCallHandler(null)

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_CAN_MAKE_PAYMENT -> isReadyToPayMethodCallHandler.onMethodCall(call, result)
            METHOD_MAKE_PAYMENT -> loadPaymentDataMethodCallHandler.onMethodCall(call, result)
            else -> result.notImplemented()
        }
    }

}