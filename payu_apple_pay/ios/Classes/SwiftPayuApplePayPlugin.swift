import Flutter

public class SwiftPayuApplePayPlugin: NSObject, FlutterPlugin {

  // MARK: - Private Properties
  private let canMakePaymentsHandler: CanMakePaymentsHandler
  private let authorizeHandler: AuthorizeHandler

  // MARK: - Initialization
  init(authorizeHandler: AuthorizeHandler, canMakePaymentsHandler: CanMakePaymentsHandler) {
    self.authorizeHandler = authorizeHandler
    self.canMakePaymentsHandler = canMakePaymentsHandler
  }

  // MARK: - Public Methods
  public static func register(with registrar: FlutterPluginRegistrar) {
    let inputChannel = FlutterMethodChannel(
      name: FlutterMethodChannelName.inputChannel,
      binaryMessenger: registrar.messenger())

    let outputChannel = FlutterMethodChannel(
      name: FlutterMethodChannelName.outputChannel,
      binaryMessenger: registrar.messenger())

    registrar.addMethodCallDelegate(
      SwiftPayuApplePayPlugin(
        authorizeHandler: AuthorizeHandler(outputChannel: outputChannel),
        canMakePaymentsHandler: CanMakePaymentsHandler()),
      channel: inputChannel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case FlutterMethodCallName.authorize:
      authorizeHandler.handle(call, result: result)
    case FlutterMethodCallName.canMakePayments:
      canMakePaymentsHandler.handle(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

