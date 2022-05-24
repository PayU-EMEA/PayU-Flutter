import Flutter
import UIKit

public class SwiftPayuMobilePaymentsIosPlugin: NSObject, FlutterPlugin {
  private struct Constants {
    static let METHOD_CHANNEL_NAME = "PayuMobilePaymentsPlatformInterface"
    static let METHOD_CAN_MAKE_PAYMENT = "canMakePayment"
    static let METHOD_MAKE_PAYMENT = "makePayment"
  }

  // MARK: - Private Properties
  private let canMakePaymentMethodCallHandler: CanMakePaymentMethodCallHandler
  private let makePaymentMethodCallHandler: MakePaymentMethodCallHandler

  // MARK: - Initialization
  init(canMakePaymentMethodCallHandler: CanMakePaymentMethodCallHandler,
       makePaymentMethodCallHandler: MakePaymentMethodCallHandler) {

    self.canMakePaymentMethodCallHandler = canMakePaymentMethodCallHandler
    self.makePaymentMethodCallHandler = makePaymentMethodCallHandler
  }

  // MARK: - Public Methods
  public static func register(with registrar: FlutterPluginRegistrar) {
    let inputChannel = FlutterMethodChannel(
      name: Constants.METHOD_CHANNEL_NAME,
      binaryMessenger: registrar.messenger())

    registrar.addMethodCallDelegate(
      SwiftPayuMobilePaymentsIosPlugin(
        canMakePaymentMethodCallHandler: CanMakePaymentMethodCallHandler(),
        makePaymentMethodCallHandler: MakePaymentMethodCallHandler()),
      channel: inputChannel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case Constants.METHOD_CAN_MAKE_PAYMENT:
      canMakePaymentMethodCallHandler.handle(call, result: result)
    case Constants.METHOD_MAKE_PAYMENT:
      makePaymentMethodCallHandler.handle(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}


//public class SwiftPayuMobilePaymentsIosPlugin: NSObject, FlutterPlugin {
//  public static func register(with registrar: FlutterPluginRegistrar) {
//    let channel = FlutterMethodChannel(name: "payu_mobile_payments_ios", binaryMessenger: registrar.messenger())
//    let instance = SwiftPayuMobilePaymentsIosPlugin()
//    registrar.addMethodCallDelegate(instance, channel: channel)
//  }
//
//  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//    result("iOS " + UIDevice.current.systemVersion)
//  }
//}
