package com.example.payu_mobile_payments_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** PayuMobilePaymentsAndroidPlugin */
class PayuMobilePaymentsAndroidPlugin: FlutterPlugin, ActivityAware {
  private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  private lateinit var methodCallHandler: PayuMobilePaymentsMethodCallHandler

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = binding
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {}
  override fun onAttachedToActivity(binding: ActivityPluginBinding) = setMethodCallHandler(binding)
  override fun onDetachedFromActivity() = clearMethodCallHandler()
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) = setMethodCallHandler(binding)
  override fun onDetachedFromActivityForConfigChanges() = clearMethodCallHandler()

  private fun setMethodCallHandler(binding: ActivityPluginBinding) {
    methodCallHandler = PayuMobilePaymentsMethodCallHandler(flutterPluginBinding, binding)
    methodCallHandler.setMethodCallHandler()
  }

  private fun clearMethodCallHandler() {
    methodCallHandler.clearMethodCallHandler()
  }
}
